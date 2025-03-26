# MATE/GNOME sets QT_FONT_DPI to 155 to scale Qt applications, but this messes up when logging into plasma.
# Set it back on every login.
echo 'export QT_FONT_DPI=96' >> /etc/xdg/plasma-workspace/env/env.sh
