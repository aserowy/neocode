{
  description = "neocode flake";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-parts }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.flake-parts.flakeModules.easyOverlay
      ];

      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          package = (with pkgs; (makeOverridable callPackage self { }));
        in
        {
          overlayAttrs = {
            inherit (config.packages) neocode;
          };

          packages.default = package;

          devShells.default = with pkgs; mkShell {
            buildInputs = [
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
    };
}
