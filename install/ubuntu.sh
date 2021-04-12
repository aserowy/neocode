sudo apt -y update && sudo apt -y upgrade

sudo apt -y install \
    curl \
    git \
    nodejs \
    npm \
    ripgrep \
    software-properties-common \
    unzip

sudo npm install -g n
sudo n stable

sudo npm install -g \
    npm \
    prettier

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get -y update
sudo apt-get -y install neovim

rm -rf ~/.config/nvim/ && mkdir -p ~/.config/nvim
git clone git@github.com:aserowy/lualuampuyah.git ~/.config/nvim
