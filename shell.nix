with import <nixpkgs> { };
mkShell rec {
  name = "neocode";
  buildInputs = [
    stylua
    lua51Packages.luacheck
    nodePackages.prettier
  ];
  shellHook = ''
    # format and check -> fac :)
    alias fac="prettier --write README.md \
        && stylua init.lua lua/ \
        && luacheck init.lua lua/"
  '';
}
