source "https://rubygems.org"

# This is the default theme for new Jekyll sites. You may change this to anything you like.
#gem "minima", "~> 2.5"
gem "github-pages", "204", group: :jekyll_plugins
group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-remote-theme"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :install_if => Gem.win_platform?

# Build
gem 'rake', '10.4.2'
gem 'html-proofer'
gem 'rubyzip'
