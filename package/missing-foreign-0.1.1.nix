{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "missing-foreign";
  version = "0.1.1";
  sha256 = "11f8pknbarlj956nmalqhd2v704z7d7xbi61hs1q8vb2p36kc6wy";
  libraryHaskellDepends = [ base ];
  description = "Convenience functions for FFI work";
  license = stdenv.lib.licenses.bsd3;
}