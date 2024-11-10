#!/bin/bash

# Вывод сообщений с цветом для лучшей читаемости
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Установка необходимых зависимостей для pyenv...${NC}"

# Установка зависимостей для Ubuntu/Debian
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

# Установка зависимостей для CentOS/RHEL/Fedora
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

echo -e "${GREEN}Установка pyenv через pyenv-installer...${NC}"

# Установка pyenv через pyenv-installer
curl https://pyenv.run | bash

# Настройка переменных окружения
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# Применение изменений
source ~/.bashrc

echo -e "${GREEN}Установка pyenv успешно завершена!${NC}"
echo -e "${GREEN}Перезапустите терминал или выполните 'source ~/.bashrc' для применения изменений.${NC}"
