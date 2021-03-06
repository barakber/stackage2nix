{ mkDerivation, array, base, bytestring, case-insensitive, conduit
, conduit-extra, deepseq, http-types, httpd-shed, HUnit, mtl
, network, network-uri, parsec, pureMD5, split, stdenv
, test-framework, test-framework-hunit, time, wai, warp
}:
mkDerivation {
  pname = "HTTP";
  version = "4000.3.3";
  sha256 = "1wlvvqcxsnd2is3khsla0vd8i9cy12v1pg6d6i13ihcd131a7bdv";
  libraryHaskellDepends = [
    array base bytestring mtl network network-uri parsec time
  ];
  testHaskellDepends = [
    base bytestring case-insensitive conduit conduit-extra deepseq
    http-types httpd-shed HUnit mtl network network-uri pureMD5 split
    test-framework test-framework-hunit wai warp
  ];
  homepage = "https://github.com/haskell/HTTP";
  description = "A library for client-side HTTP";
  license = stdenv.lib.licenses.bsd3;
}