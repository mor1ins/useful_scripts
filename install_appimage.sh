#!/bin/bash

# Проверка наличия аргумента
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/app.AppImage"
  exit 1
fi

APPIMAGE_PATH="$1"

# Проверка, существует ли файл .appImage
if [ ! -f "$APPIMAGE_PATH" ]; then
  echo "Error: File not found!"
  exit 1
fi

# Извлечение имени файла и пути
APPIMAGE_NAME=$(basename "$APPIMAGE_PATH")
APP_NAME="${APPIMAGE_NAME%.*}"
INSTALL_DIR="$HOME/Applications"

# Создание папки для приложений, если её нет
mkdir -p "$INSTALL_DIR"

# Перемещение .appImage в папку приложений
mv "$APPIMAGE_PATH" "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/$APPIMAGE_NAME"
echo "$APPIMAGE_NAME has been moved to $INSTALL_DIR"

# Создание символической ссылки для консоли
sudo ln -sf "$INSTALL_DIR/$APPIMAGE_NAME" "/usr/local/bin/$APP_NAME"
echo "Symbolic link created: /usr/local/bin/$APP_NAME"

# Опционально указать путь к иконке
read -p "Enter the path to the icon file (or leave blank to skip): " ICON_PATH

# Создание .desktop файла для GNOME
DESKTOP_FILE="$HOME/.local/share/applications/$APP_NAME.desktop"

echo "[Desktop Entry]
Name=$APP_NAME
Exec=$INSTALL_DIR/$APPIMAGE_NAME
Type=Application
Terminal=false
Categories=Utility;Application;" > "$DESKTOP_FILE"

# Добавление иконки, если она была указана
if [ -n "$ICON_PATH" ] && [ -f "$ICON_PATH" ]; then
  echo "Icon=$ICON_PATH" >> "$DESKTOP_FILE"
  echo "Icon added to desktop file."
fi

# Обновление кэша ярлыков
update-desktop-database "$HOME/.local/share/applications"
echo "Desktop entry created and added to GNOME menu."

echo "Installation complete. You can now launch $APP_NAME from the console or the GNOME menu."
