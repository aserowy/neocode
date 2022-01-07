with import <nixpkgs> { };
mkShell rec {
  name = "neocode";
  buildInputs = [
    gh
    lua51Packages.luacheck
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.markdownlint-cli
    nodePackages.prettier
    stylua
    sumneko-lua-language-server
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
}
