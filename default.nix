{ stdenv, lib, theme ? "onedark", style ? "", transparent ? false, syncBuild ? false }:

let
  boolToString = bool: if bool then "true" else "false";
in
stdenv.mkDerivation {
  name = "neocode";

  src = ./.;

  installPhase = ''
    mkdir -p $out;

    cp -rf * $out;

    sed -i 's/theme = "\w*",/theme = "${theme}",/' $out/lua/settings.lua
    sed -i 's/style = "\w*",/style = "${style}",/' $out/lua/settings.lua
    sed -i 's/transparent = \w*,/transparent = ${boolToString transparent},/' $out/lua/settings.lua

    sed -i 's/sync_install = \w*/sync_install = ${boolToString syncBuild}/' $out/lua/language/plugin_treesitter.lua;
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
