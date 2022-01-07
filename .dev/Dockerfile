FROM nixpkgs/nix:latest

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-env -iA nixpkgs.fzf
RUN nix-env -iA nixpkgs.gcc
RUN nix-env -iA nixpkgs.git
RUN nix-env -iA nixpkgs.gnugrep
RUN nix-env -iA nixpkgs.neovim
RUN nix-env -iA nixpkgs.ps
RUN nix-env -iA nixpkgs.ripgrep
RUN nix-env -iA nixpkgs.unzip

RUN nix-env -iA nixpkgs.lua51Packages.luacheck
RUN nix-env -iA nixpkgs.nodePackages.dockerfile-language-server-nodejs
RUN nix-env -iA nixpkgs.nodePackages.markdownlint-cli
RUN nix-env -iA nixpkgs.nodePackages.prettier
RUN nix-env -iA nixpkgs.stylua
RUN nix-env -iA nixpkgs.sumneko-lua-language-server

RUN mkdir /workspace
VOLUME [ "/workspace" ]

WORKDIR /root
RUN mkdir -p .config/ && ln -s /workspace .config/nvim

ENTRYPOINT [ "/bin/sh" ]
