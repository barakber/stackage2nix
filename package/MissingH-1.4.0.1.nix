{ mkDerivation, array, base, containers, directory
, errorcall-eq-instance, filepath, hslogger, HUnit, mtl, network
, old-locale, old-time, parsec, process, QuickCheck, random
, regex-compat, testpack, time, unix
}:
mkDerivation {
  pname = "MissingH";
  version = "1.4.0.1";
  sha256 = "0wcvgrmav480w7nf4bl14yi0jq2yzanysxwzwas9hpb28vyjlgr8";
  libraryHaskellDepends = [
    array base containers directory filepath hslogger HUnit mtl network
    old-locale old-time parsec process random regex-compat time unix
  ];
  testHaskellDepends = [
    array base containers directory errorcall-eq-instance filepath
    hslogger HUnit mtl network old-locale old-time parsec process
    QuickCheck random regex-compat testpack time unix
  ];
  homepage = "http://software.complete.org/missingh";
  description = "Large utility library";
  license = stdenv.lib.licenses.bsd3;
}