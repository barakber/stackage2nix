{ mkDerivation, base, stdenv, transformers }:
mkDerivation {
  pname = "ObjectName";
  version = "1.1.0.1";
  sha256 = "046jm94rmm46cicd31pl54vdvfjvhd9ffbfycy2lxzc0fliyznvj";
  libraryHaskellDepends = [ base transformers ];
  homepage = "https://github.com/svenpanne/ObjectName";
  description = "Explicitly handled object names";
  license = stdenv.lib.licenses.bsd3;
}