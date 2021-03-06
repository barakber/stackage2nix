{ mkDerivation, base, stdenv, syspkgs }:
mkDerivation {
  pname = "magic";
  version = "1.1";
  sha256 = "10p0gjjjwr1dda7hahwrwn5njbfhl67arq3v3nf1jr3vymlkn75j";
  libraryHaskellDepends = [ base ];
  librarySystemDepends = [ syspkgs.magic ];
  description = "Interface to C file/magic library";
  license = stdenv.lib.licenses.bsd3;
}