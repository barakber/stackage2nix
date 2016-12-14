{ mkDerivation, base, containers, deepseq, random, semigroups }:
mkDerivation {
  pname = "dpor";
  version = "0.2.0.0";
  sha256 = "1qn839lhnjsx2swq0ca8l2qr0szypdb2dsbfi1412m25p11cryvf";
  libraryHaskellDepends = [
    base containers deepseq random semigroups
  ];
  homepage = "https://github.com/barrucadu/dejafu";
  description = "A generic implementation of dynamic partial-order reduction (DPOR) for testing arbitrary models of concurrency";
  license = stdenv.lib.licenses.mit;
}