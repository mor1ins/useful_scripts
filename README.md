

# useful_scripts

Коллекция полезных скриптов для разработки.

## Установка pyenv (install_pyenv.sh)

Скрипт для автоматической установки pyenv и всех необходимых зависимостей. Поддерживает системы на базе Debian/Ubuntu и CentOS/RHEL/Fedora.

### Возможности скрипта:
- Автоматическое определение типа операционной системы
- Установка всех необходимых системных зависимостей
- Установка pyenv через официальный установщик
- Настройка переменных окружения
- Поддержка цветного вывода для лучшей читаемости

### Использование:
1. Сделайте скрипт исполняемым:
```bash
chmod +x install_pyenv.sh
```

2. Запустите скрипт:
```bash
./install_pyenv.sh
```

3. После установки перезапустите терминал или выполните:
```bash
source ~/.bashrc
```

### Установленные компоненты:
- pyenv
- pyenv-virtualenv
- pyenv-update
- pyenv-doctor
- pyenv-which-ext

### Системные зависимости

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

## Установка AppImage (install_appimage.sh)

Скрипт для удобной установки AppImage приложений в систему. Создает необходимые ярлыки и делает приложение доступным из командной строки.

### Возможности скрипта:
- Перемещение AppImage в директорию ~/Applications
- Создание символической ссылки в /usr/local/bin
- Создание .desktop файла для отображения в меню приложений
- Опциональное добавление иконки приложения
- Автоматическое обновление кэша ярлыков

### Использование:
1. Сделайте скрипт исполняемым:
```bash
chmod +x install_appimage.sh
```

2. Запустите скрипт, указав путь к AppImage файлу:
```bash
./install_appimage.sh /path/to/your/application.AppImage
```

3. При запросе, можно указать путь к иконке приложения (опционально)

### Результат установки:
- AppImage файл будет перемещен в ~/Applications
- Создастся команда в терминале с именем приложения
- Приложение появится в меню GNOME
- При указании иконки, она будет добавлена в ярлык приложения
