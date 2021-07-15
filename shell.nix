with import <nixpkgs> { };
mkShell rec {
  name = "neocode";
  buildInputs = [
    stylua
    sumneko-lua-language-server
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
