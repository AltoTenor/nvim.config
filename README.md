```
apt update
export DEBIAN_FRONTEND=noninteractive
apt install -y neovim git gcc ripgrep
cd ~
git clone https://github.com/AltoTenor/nvim.config.git
mkdir .config
mkdir .config/nvim
mv nvim.config/* .config/nvim/
rm -rf nvim.config/
cd .config/nvim
git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim
```
