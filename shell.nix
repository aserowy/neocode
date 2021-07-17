with import <nixpkgs> { };
mkShell rec {
  name = "neocode";
  buildInputs = [
    lua51Packages.luacheck
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
}
