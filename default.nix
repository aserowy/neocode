{ stdenv, theme ? "onedark" }:

stdenv.mkDerivation {
  name = "neocode";
  src = ./.;

  installPhase = "mkdir -p $out; cp -rf * $out";
}
