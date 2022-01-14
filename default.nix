{ stdenv, lib, theme ? "onedark" }:

stdenv.mkDerivation {
  pname = "neocode";
  version = "1.0.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out;

    echo ${theme} > $out/test.txt;
    echo 'test' > $out/test2.txt;

    cp -rf * $out;
  '';

  meta = with lib; {
    description = "Configuration for neovim";
    longDescription = ''
      Configuration for neovim, which aims to enable an equal workflow for vscode and neovim.
    '';
    homepage = "https://github.com/aserowy/neocode";
    license = licenses.mit;
    maintainers = [ maintainers.aserowy ];
    platforms = platforms.all;
  };
}
