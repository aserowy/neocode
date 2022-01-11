{
  description = "neocode flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        packageName = "neocode";

        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.${packageName} = pkgs.stdenv.mkDerivation {
          name = "neocode";
          src = self;

          installPhase = "mkdir -p $out; cp -rf * $out";
        };

        devShell =
          pkgs.mkShell {
            buildInputs = with pkgs; [
              gh
              lua51Packages.luacheck
              nodePackages.dockerfile-language-server-nodejs
              nodePackages.markdownlint-cli
              nodePackages.prettier
              stylua
              sumneko-lua-language-server
              rnix-lsp
            ];
            shellHook = ''
              FULLPATH=$(realpath $0)
              BASEDIR=$(dirname $FULLPATH)

              # test environment
              alias tb="docker build -t nvim-te $BASEDIR/.dev"
              alias te="docker run -it -e 'TERM=xterm-256color' -v $BASEDIR:/workspace nvim-te"

              # format and check -> fac :)
              alias fac="prettier --write README.md \
                  && stylua init.lua lua/ \
                  && luacheck init.lua lua/"
            '';
          };
      });
}
