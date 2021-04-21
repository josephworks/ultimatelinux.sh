echo "Getting BuildTools"
sudo apt install tree

# Creating Directories
mkdir build
cd build
mkdir DEBIAN
mkdir usr
cd usr
mkdir local
cd local
mkdir bin
cd ../../../

# Move files over for building
cp ./uls.sh ./build/usr/local/bin
cp ./ulsrepeat.sh ./build/usr/local/bin
cp ./ultimatelinux.sh ./build/usr/local/bin
cp ./control ./build/DEBIAN/

# BUILDING ARTIFACT
dpkg-deb --build build
mv build.deb ./ultimatelinux.deb

# Map all build files
ls
tree

# Delete Temporary Build Workspace
rm -rf build