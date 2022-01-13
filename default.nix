{ stdenv, theme ? "onedark" }:

stdenv.mkDerivation {
  name = "neocode";
  src = ./.;

  installPhase = ''
    mkdir -p $out 

    echo ${theme} > $out/test.txt
    echo 'test' > $out/test2.txt

    cp -rf * $out
  '';
}
