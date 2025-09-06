# frozen_string_literal: true

require 'fileutils'
require 'html-proofer'
require 'jekyll'
require 'rake/clean'
require 'zip'

task 'default' => %w[build:build]

TMP_PATH = 'tmp/'
OBJ_PATH = TMP_PATH + 'obj/'
OBJ_BIN_PATH = OBJ_PATH + 'bin/'
OUT_BIN_PATH = TMP_PATH + 'out/bin/'

CLOBBER.include(TMP_PATH)

namespace 'build' do
    task 'prepare' do
      ENV['JEKYLL_ENV'] = 'production'
    end

    # clean
    desc 'Cleans the workspace'
    task 'clean' => %w[prepare clobber]
    task 'clean' do
      Jekyll::Commands::Clean.process({})
    end

    #compile
    desc 'Compiles the project'
    task 'compile' => %w[prepare]
    task 'compile' do
      config = Jekyll.configuration({
        'destination' => OBJ_BIN_PATH,
        'strict_front_matter' => true
      })
      site = Jekyll::Site.new(config)
      Jekyll::Commands::Build.build(site, config)
    end

    #test
    task 'test' => %w[prepare compile]
    task 'test' do
      options = {
        :allow_hash_href => true,
        :assume_extension => true,
        :check_favicon => true,
        :check_opengraph => true,
        :file_ignore => [
          /\/blog\/software-craftsmanship\/20[01]\d\//, # Do not check old blog posts
          /\/sections\//
        ],
        :root_dir => OBJ_BIN_PATH,
        :url_ignore => [
          'http://html5up.net', 'https://chrisbobbe.github.io/', # Included by the template
          'https://www.facebook.com/mathieu.cartoixa', # 404 only when checked...
          'https://www.linkedin.com/in/cartoixa/', 'https://www.linkedin.com/in/cartoixa/?trk=profile-badge' # 999 only when checked
        ]
      }
      HTMLProofer.check_directory(OBJ_BIN_PATH, options).run
    end

    # analyze
    desc 'Analyzes the project'
    task 'analyze' => %w[prepare]
    task 'analyze' do
      Jekyll::Commands::Doctor.process({})
    end

    # package
    namespace 'package' do
      PACKAGE_FILE = OUT_BIN_PATH + PROJECT_NAME + '-' + PROJECT_VERSION + '.zip'
      file PACKAGE_FILE =>  %w[build:compile]
      file PACKAGE_FILE do
        FileUtils.mkdir_p(OUT_BIN_PATH)
        Zip::File.open(PACKAGE_FILE, Zip::File::CREATE) do |zf|
          Rake::FileList.new(OBJ_BIN_PATH + '**/*').each do |f|
            zf.add(f.delete_prefix(OBJ_BIN_PATH), f)
          end
        end
      end

      task 'build' => PACKAGE_FILE
    end
    desc 'Creates the packages'
    task 'package' => %w[prepare package:build]

    # build
    desc 'Builds the project'
    task 'build' => %w[compile test analyze]
    # rebuild
    desc 'Rebuilds the project'
    task 'rebuild' => %w[clean build]
    # release
    desc 'Builds the project and creates new packages from scratch'
    task 'release' => %w[rebuild package]
end
