{
  description = "neocode flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        name = "neocode";
        package = (with pkgs; (makeOverridable callPackage self { }));
      in
      {
        defaultPackage = package;
        packages.${name} = package;

        devShell =
          pkgs.mkShell {
            buildInputs = with pkgs; [
              gh
              lua51Packages.luacheck
              nil
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
      });
}
