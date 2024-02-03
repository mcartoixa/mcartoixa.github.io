FROM ruby:2.7.8

RUN echo 'Acquire::Retries "100";' > /etc/apt/apt.conf.d/99custom \
  && DEBIAN_FRONTEND=noninteractive apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get upgrade -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/*
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -q -y build-essential git gnupg2 less pv sudo zip zlib1g-dev \
  && DEBIAN_FRONTEND=noninteractive apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/*
RUN gem install jekyll -v 3.9.3



ARG USERNAME=mcartoixa
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN addgroup --gid $USER_GID $USERNAME \
  && adduser --uid $USER_UID --gid $USER_GID --disabled-password --gecos '' $USERNAME \
  && adduser $USERNAME sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER $USERNAME
RUN echo 'export GEM_HOME="$HOME/.gem"' >> ~/.profile \
  && echo 'export PATH="$GEM_HOME/bin:$PATH"' >> ~/.profile \
  && echo "PS1='\${debian_chroot:+(\$debian_chroot)}🐳 \[\\\\033[1;32m\]\u\[\\\\033[0m\]:\[\\\\033[1;34m\]\w\[\\\\033[0m\]|\[\\\\033[38;5;197m\] v\$(ruby --version | awk \"{ print \\\$2 }\")\[\\\\033[0m\]\$\[\\\\033[40;36m\]\$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\[\\\\033[0m\]> '" >> ~/.bashrc \
  && mkdir -p ~/mnt
WORKDIR /home/$USERNAME/mnt


EXPOSE 4000
CMD ["/bin/sh"]
