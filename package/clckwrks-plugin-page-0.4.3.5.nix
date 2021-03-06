{ mkDerivation, acid-state, aeson, attoparsec, base, clckwrks
, containers, directory, filepath, happstack-hsp, happstack-server
, hsp, hsx2hs, ixset, mtl, old-locale, random, reform
, reform-happstack, reform-hsp, safecopy, stdenv, tagsoup
, template-haskell, text, time, time-locale-compat, tools, uuid
, uuid-orphans, web-plugins, web-routes, web-routes-happstack
, web-routes-th
}:
mkDerivation {
  pname = "clckwrks-plugin-page";
  version = "0.4.3.5";
  sha256 = "166lwlajsqlxma6zsdli06kbajqyskyr6vkqhzizs8n3a4vs2lpv";
  libraryHaskellDepends = [
    acid-state aeson attoparsec base clckwrks containers directory
    filepath happstack-hsp happstack-server hsp hsx2hs ixset mtl
    old-locale random reform reform-happstack reform-hsp safecopy
    tagsoup template-haskell text time time-locale-compat uuid
    uuid-orphans web-plugins web-routes web-routes-happstack
    web-routes-th
  ];
  libraryToolDepends = [ tools.hsx2hs ];
  homepage = "http://www.clckwrks.com/";
  description = "support for CMS/Blogging in clckwrks";
  license = stdenv.lib.licenses.bsd3;
}