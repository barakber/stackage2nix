{ mkDerivation, base, bytestring, containers, stdenv, syspkgs, text
, tools
}:
mkDerivation {
  pname = "haskell-gi-base";
  version = "0.18.4";
  sha256 = "05lfpbnsa52b9af080dmvw87dwlxcbhf9hs30sgx0s2nnv99pys5";
  libraryHaskellDepends = [ base bytestring containers text ];
  libraryPkgconfigDepends = [ syspkgs."gobject-2.0" ];
  libraryToolDepends = [ tools.hsc2hs ];
  homepage = "https://github.com/haskell-gi/haskell-gi-base";
  description = "Foundation for libraries generated by haskell-gi";
  license = stdenv.lib.licenses.lgpl21;
}