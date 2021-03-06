{ mkDerivation, base, containers, data-default, directory
, extensible-exceptions, filepath, mtl, process, QuickCheck
, setlocale, stdenv, unix, utf8-string, X11
}:
mkDerivation {
  pname = "xmonad";
  version = "0.12";
  sha256 = "1mzx3p17ppgmi30q3phaj58x6kxn73pbbkn9v9gzgmd8skdlkxp8";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base containers data-default directory extensible-exceptions
    filepath mtl process setlocale unix utf8-string X11
  ];
  executableHaskellDepends = [ base mtl unix X11 ];
  testHaskellDepends = [
    base containers extensible-exceptions QuickCheck X11
  ];
  homepage = "http://xmonad.org";
  description = "A tiling window manager";
  license = stdenv.lib.licenses.bsd3;
}