{
  description = "neocode flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;

      overlay = final: prev: { neocode = prev.pkgs.callPackage ./. { }; };
      name = "neocode";

      shell =
        { pkgs, ... }: with pkgs; mkShell {
          buildInputs = with nixpkgs; [
            gh
            lua51Packages.luacheck
            nil
            nixpkgs-fmt
            nodejs_20
            nodePackages.markdownlint-cli
            nodePackages.prettier
            stylua
            sumneko-lua-language-server
          ];
          shellHook = ''
            # format and check -> fac :)
            alias fac="prettier --write README.md \
                && stylua init.lua lua/ \
                && luacheck init.lua lua/"
          '';
        };
    };
}
