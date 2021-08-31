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
    FULLPATH=$(realpath $0)
    BASEDIR=$(dirname $FULLPATH)

    # test environment
    alias tb="docker build -t nvim-te $BASEDIR/.dev"
    alias te="docker run -it -v $BASEDIR:/workspace nvim-te"

    # format and check -> fac :)
    alias fac="prettier --write README.md \
        && stylua init.lua lua/ \
        && luacheck init.lua lua/"
  '';
}
