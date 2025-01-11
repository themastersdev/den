# Author: Kevin Barreiro
# Description: This script sets up my development environment in a linux machine 
# using the ARM64 processor.

# update and upgrade apt
echo "updating and upgrading apt"
apt update 
apt upgrade

# update golang to latest
echo "updating golang to version 1.23.4"
rm -rf usr/local/bin/go
rm -rf usr/local/bin/gofmt
curl -LO https://go.dev/dl/go1.23.4.linux-arm64.tar.gz
tar -C /usr/local -xzf go1.23.4.linux-arm64.tar.gz
rm -rf go1.23.4.linux-arm64.tar.gz 
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

# install rust and cargo
echo "installing rust and cargo"
curl https://sh.rustup.rs -sSf | sh

# install node
echo "installing node"
curl -LO https://nodejs.org/dist/v22.13.0/node-v22.13.0-linux-arm64.tar.xz
tar -C /usr/local -xJf node-v22.13.0-linux-arm64.tar.xz
rm -rf tar -C /usr/local -xJf node-v22.13.0-linux-arm64.tar.xz
mv usr/local/node-v22.13.0-linux-arm64 usr/local/node
echo 'export PATH=$PATH:/usr/local/node/bin' >> ~/.bashrc

# install lua
echo "installing lua"
curl -LRO https://www.lua.org/ftp/lua-5.4.7.tar.gz
tar zxf lua-5.4.7.tar.gz
cd lua-5.4.7
make all test
make all install
cd ..
rm -rf lua-5.4.7
rm -rf lua-5.4.7.tar.gz

# install pip
echo "installing pip"
yes | apt-get install python3-pip

# setup my neovim config
git clone https://github.com/themastersdev/config.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# install ripgrap
echo "installing ripgrep"
apt-get install ripgrep
echo 'export RIPGREP_CONFIG_PATH=~/.config/nvim/.ripgreprc' >> ~/.bashrc

# build and install neovim from source
echo "installing neovim"
yes | apt-get install ninja-build gettext cmake unzip curl build-essential
cd usr/local
git clone https://github.com/neovim/neovim
cd neovim 
yes | make CMAKE_BUILD_TYPE=RelWithDebInfo
yes | make install 
cd ../
echo 'export PATH=$PATH:/usr/local/neovim/bin' >> ~/.bashrc
