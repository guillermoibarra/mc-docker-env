# Base image
FROM ubuntu:24.10

# Non interactive mode for apk
ENV DEBIAN_FRONTEND=noninteractive

# Install essential packages
RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  git \
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  libncurses5-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  locales \
  neovim \
  tmux \
  tk-dev \
  tzdata \
  wget \
  zlib1g-dev \
  zsh \
  && rm -rf /var/lib/apt/lists/*

# Set the timezone environment variable
ENV TZ=America/Mexico_City

# Configure the timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Generate and set locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Install starship prompt
RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y

# Set up the non-root user "taller"
RUN useradd -m -s /bin/zsh taller && \
    mkdir -p /home/taller/.config && \
    chown -R taller:taller /home/taller

# Copy Starship, tmux.conf and zshrc configuration
COPY --chown=taller:taller resources/starship.toml /home/taller/.config/starship.toml
COPY --chown=taller:taller resources/zshrc /home/taller/.zshrc
COPY --chown=taller:taller resources/tmux.conf /home/taller/.config/tmux/tmux.conf

# Switch to non-root user
USER taller
WORKDIR /home/taller

# Create .tmux/plugins directory and clone TPM
RUN mkdir -p ~/.tmux/plugins && \
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install pyenv
RUN curl https://pyenv.run | bash && \
    export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$HOME/.pyenv/bin:$PATH" && \
    pyenv install 3.12.8

# Expose JupyterLab port
EXPOSE 8888

# Set default shell to Zsh for the container
SHELL ["/bin/zsh", "-c"]

# Default command to start tmux in Zsh
CMD ["zsh"]
