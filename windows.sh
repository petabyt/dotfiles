# Assumes normal msys2 installation

pacman -D
pacman -S git gcc make mingw-w64-gcc unzip

# Menu options
git clone https://github.com/njzhangyifei/msys2-mingw-shortcut-menus.git
cd msys2-mingw-shortcut-menus
bash install
cd ..
