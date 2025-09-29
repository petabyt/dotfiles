# MATE/GNOME sets QT_FONT_DPI to 155 to scale Qt applications, but this messes up when logging into plasma.
# Unset it on every login.
echo 'unset QT_QPA_PLATFORM' >> /etc/xdg/plasma-workspace/env/env.sh
echo 'unset QT_WAYLAND_RECONNECT' >> /etc/xdg/plasma-workspace/env/env.sh
echo 'unset QT_IM_MODULE' >> /etc/xdg/plasma-workspace/env/env.sh
echo 'unset QT_AUTO_SCREEN_SCALE_FACTOR' >> /etc/xdg/plasma-workspace/env/env.sh
echo 'unset QT_FONT_DPI' >> /etc/xdg/plasma-workspace/env/env.sh
echo 'unset QT_SCALE_FACTOR' >> /etc/xdg/plasma-workspace/env/env.sh
