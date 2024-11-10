#!/bin/bash

# Color output for better readability
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Installing required dependencies for pyenv...${NC}"

# Installing dependencies for Ubuntu/Debian
if [ -f /etc/debian_version ]; then
    sudo apt-get update
    sudo apt-get install -y \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libffi-dev \
        liblzma-dev \
        python-openssl \
        git

# Installing dependencies for CentOS/RHEL/Fedora
elif [ -f /etc/redhat-release ]; then
    sudo yum install -y \
        gcc \
        zlib-devel \
        bzip2-devel \
        readline-devel \
        sqlite-devel \
        openssl-devel \
        git \
        wget \
        curl \
        llvm \
        make \
        tk-devel \
        libffi-devel \
        xz-devel
fi

echo -e "${GREEN}Installing pyenv via pyenv-installer...${NC}"

# Installing pyenv via pyenv-installer
curl https://pyenv.run | bash

# Setting up environment variables
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# Applying changes
source ~/.bashrc

echo -e "${GREEN}pyenv installation completed successfully!${NC}"
echo -e "${GREEN}Restart your terminal or run 'source ~/.bashrc' to apply changes.${NC}"
