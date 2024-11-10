#!/bin/bash

# Check if argument exists
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/app.AppImage"
  exit 1
fi

APPIMAGE_PATH="$1"

# Check if .appImage file exists
if [ ! -f "$APPIMAGE_PATH" ]; then
  echo "Error: File not found!"
  exit 1
fi

# Extract filename and path
APPIMAGE_NAME=$(basename "$APPIMAGE_PATH")
APP_NAME="${APPIMAGE_NAME%.*}"
INSTALL_DIR="$HOME/Applications"

# Create applications folder if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Move .appImage to applications folder
mv "$APPIMAGE_PATH" "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/$APPIMAGE_NAME"
echo "$APPIMAGE_NAME has been moved to $INSTALL_DIR"

# Create symbolic link for console
sudo ln -sf "$INSTALL_DIR/$APPIMAGE_NAME" "/usr/local/bin/$APP_NAME"
echo "Symbolic link created: /usr/local/bin/$APP_NAME"

# Optionally specify path to icon
read -p "Enter the path to the icon file (or leave blank to skip): " ICON_PATH

# Create .desktop file for GNOME
DESKTOP_FILE="$HOME/.local/share/applications/$APP_NAME.desktop"

echo "[Desktop Entry]
Name=$APP_NAME
Exec=$INSTALL_DIR/$APPIMAGE_NAME
Type=Application
Terminal=false
Categories=Utility;Application;" > "$DESKTOP_FILE"

# Add icon if it was specified
if [ -n "$ICON_PATH" ] && [ -f "$ICON_PATH" ]; then
  echo "Icon=$ICON_PATH" >> "$DESKTOP_FILE"
  echo "Icon added to desktop file."
fi

# Update shortcuts cache
update-desktop-database "$HOME/.local/share/applications"
echo "Desktop entry created and added to GNOME menu."

echo "Installation complete. You can now launch $APP_NAME from the console or the GNOME menu."
