{ mkDerivation, acid-state, aeson, authenticate, base
, base64-bytestring, boomerang, bytestring, containers
, data-default, email-validate, filepath, happstack-hsp
, happstack-jmacro, happstack-server, hsp, hsx-jmacro, hsx2hs
, http-conduit, http-types, ixset-typed, jmacro, jwt, lens
, mime-mail, mtl, pwstore-purehaskell, random, safecopy
, shakespeare, stdenv, text, time, unordered-containers, userid
, web-routes, web-routes-boomerang, web-routes-happstack
, web-routes-hsp, web-routes-th
}:
mkDerivation {
  pname = "happstack-authenticate";
  version = "2.3.4.6";
  sha256 = "06k49mwcxqp5ld0rkgxb84q2kjmh93ikjkyvb9r37g92h7bb8gv3";
  libraryHaskellDepends = [
    acid-state aeson authenticate base base64-bytestring boomerang
    bytestring containers data-default email-validate filepath
    happstack-hsp happstack-jmacro happstack-server hsp hsx-jmacro
    hsx2hs http-conduit http-types ixset-typed jmacro jwt lens
    mime-mail mtl pwstore-purehaskell random safecopy shakespeare text
    time unordered-containers userid web-routes web-routes-boomerang
    web-routes-happstack web-routes-hsp web-routes-th
  ];
  homepage = "http://www.happstack.com/";
  description = "Happstack Authentication Library";
  license = stdenv.lib.licenses.bsd3;
}