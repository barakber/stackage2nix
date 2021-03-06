{ mkDerivation, base, bindings-DSL, HUnit, stdenv, template-haskell
, test-framework, test-framework-hunit, tools
}:
mkDerivation {
  pname = "bindings-GLFW";
  version = "3.1.2.2";
  sha256 = "1j9za3fikmy9x6iaypa7fn5hypnavhs58y4s1ycgd80cbfiqawsk";
  libraryHaskellDepends = [ base bindings-DSL template-haskell ];
  libraryToolDepends = [ tools.hsc2hs ];
  testHaskellDepends = [
    base HUnit test-framework test-framework-hunit
  ];
  description = "Low-level bindings to GLFW OpenGL library";
  license = stdenv.lib.licenses.bsd3;
}