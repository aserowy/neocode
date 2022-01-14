{ stdenv, lib, theme ? "onedark", syncBuild ? false }:

stdenv.mkDerivation {
  name = "neocode";

  src = ./.;

  installPhase = ''
    mkdir -p $out;

    echo ${theme} > $out/test_theme.txt;
    echo ${syncBuild} > $out/test_syncBuild.txt;

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
