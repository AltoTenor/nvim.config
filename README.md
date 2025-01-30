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
### Docker file
```
FROM ubuntu:latest

# Set noninteractive mode to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install necessary packages
RUN apt update && apt install -y \
    neovim \
    git \
    gcc \
    ripgrep \
    && rm -rf /var/lib/apt/lists/*

# Clone your Neovim configuration repository
RUN git clone https://github.com/AltoTenor/nvim.config.git ~/nvim.config \
    && mkdir -p ~/.config/nvim \
    && mv ~/nvim.config/* ~/.config/nvim/ \
    && rm -rf ~/nvim.config

# Clone lazy.nvim
RUN git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim

# Set Neovim as the default editor
ENV EDITOR=nvim

CMD ["nvim"]

```
To run 
```
  docker run -it --rm \
  --env DISPLAY=$DISPLAY \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  neovim-setup /bin/bash
```
