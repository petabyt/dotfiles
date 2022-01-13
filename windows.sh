# Assumes normal msys2 installation

pacman -D
pacman -S git gcc make

# Menu options
git clone https://github.com/njzhangyifei/msys2-mingw-shortcut-menus.git
cd msys2-mingw-shortcut-menus
bash install
cd ..
