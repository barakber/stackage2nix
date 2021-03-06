{ mkDerivation, attoparsec, base, blaze-builder, bytestring
, case-insensitive, conduit, conduit-extra, data-default, hspec
, HUnit, QuickCheck, resourcet, stdenv, text, transformers
, xml-conduit
}:
mkDerivation {
  pname = "tagstream-conduit";
  version = "0.5.5.3";
  sha256 = "1arlf7qil9bzcqykda8yyrnncm29jsfjvz5kbcdrbbhqpbqfi5mj";
  libraryHaskellDepends = [
    attoparsec base blaze-builder bytestring case-insensitive conduit
    conduit-extra data-default resourcet text transformers xml-conduit
  ];
  testHaskellDepends = [
    base bytestring conduit hspec HUnit QuickCheck resourcet text
  ];
  homepage = "http://github.com/yihuang/tagstream-conduit";
  description = "streamlined html tag parser";
  license = stdenv.lib.licenses.bsd3;
}