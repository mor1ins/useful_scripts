

# useful_scripts

Collection of useful development scripts.

## pyenv Installation (install_pyenv.sh)

Script for automatic installation of pyenv and all required dependencies. Supports Debian/Ubuntu and CentOS/RHEL/Fedora based systems.

### Script Features:
- Automatic operating system type detection
- Installation of all necessary system dependencies
- pyenv installation via official installer
- Environment variables configuration
- Colored output support for better readability

### Usage:
1. Make the script executable:
```bash
chmod +x install_pyenv.sh
```

2. Run the script:
```bash
./install_pyenv.sh
```

3. After installation, restart terminal or execute:
```bash
source ~/.bashrc
```

### Installed Components:
- pyenv
- pyenv-virtualenv
- pyenv-update
- pyenv-doctor
- pyenv-which-ext

### System Dependencies

#### Debian/Ubuntu:
- build-essential
- libssl-dev
- zlib1g-dev
- libbz2-dev
- libreadline-dev
- libsqlite3-dev
- wget, curl, git
- llvm
- libncurses5-dev
- libncursesw5-dev
- xz-utils
- tk-dev
- libffi-dev
- liblzma-dev
- python-openssl

#### CentOS/RHEL/Fedora:
- gcc
- zlib-devel
- bzip2-devel
- readline-devel
- sqlite-devel
- openssl-devel
- git, wget, curl
- llvm
- make
- tk-devel
- libffi-devel
- xz-devel

## AppImage Installation (install_appimage.sh)

Script for convenient installation of AppImage applications into the system. Creates necessary shortcuts and makes the application available from the command line.

### Script Features:
- Moving AppImage to ~/Applications directory
- Creating symbolic link in /usr/local/bin
- Creating .desktop file for display in application menu
- Optional application icon addition
- Automatic shortcut cache update

### Usage:
1. Make the script executable:
```bash
chmod +x install_appimage.sh
```

2. Run the script specifying the path to AppImage file:
```bash
./install_appimage.sh /path/to/your/application.AppImage
```

3. When prompted, you can specify the path to the application icon (optional)

### Installation Results:
- AppImage file will be moved to ~/Applications
- A terminal command will be created with the application name
- Application will appear in GNOME menu
- If specified, the icon will be added to the application shortcut