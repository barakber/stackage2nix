{ mkDerivation, base, Cabal, gtk2hs-buildtools, stdenv, syspkgs }:
mkDerivation {
  pname = "webkitgtk3-javascriptcore";
  version = "0.14.2.1";
  sha256 = "0kcjrka0c9ifq3zfhmkv05wy3xb7v0cyznfxldp2gjcn1haq084j";
  setupHaskellDepends = [ base Cabal gtk2hs-buildtools ];
  libraryHaskellDepends = [ base ];
  libraryPkgconfigDepends = [ syspkgs."webkitgtk-3.0" ];
  description = "JavaScriptCore FFI from webkitgtk";
  license = stdenv.lib.licenses.bsd3;
}