{ mkDerivation, array, base, base64-bytestring, binary, bytestring
, containers, errors, HTF, mtl, random, vector, zlib
}:
mkDerivation {
  pname = "HPDF";
  version = "1.4.10";
  sha256 = "1m072rc03yx5y4djmvj87kn6n23d9378v3ipl8lj3vzfjgfzsayy";
  libraryHaskellDepends = [
    array base base64-bytestring binary bytestring containers errors
    mtl random vector zlib
  ];
  testHaskellDepends = [ base HTF ];
  homepage = "http://www.alpheccar.org";
  description = "Generation of PDF documents";
  license = stdenv.lib.licenses.bsd3;
}