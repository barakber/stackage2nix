# This has been taken from nixpkgs/pkgs/development/haskell-modules/default.nix
# and adapted to allow adjusting the package source and commonConfig.

{ pkgs, stdenv, ghc, all-cabal-hashes
, compilerConfig ? (self: super: {})
, packageSetConfig ? (self: super: {})
, overrides ? (self: super: {})
, packageSource ? (import <nixpkgs/pkgs/development/haskell-modules/hackage-packages.nix>)
, commonConfig ? (import <nixpkgs/pkgs/development/haskell-modules/configuration-common.nix>)
, extraScope ? {}
}:

let

  inherit (stdenv.lib) fix' extends;

  haskellPackages = self:
    let

      mkDerivation = pkgs.callPackage <nixpkgs/pkgs/development/haskell-modules/generic-builder.nix> {
        inherit stdenv;
        inherit (pkgs) fetchurl pkgconfig glibcLocales coreutils gnugrep gnused;
        inherit (self) ghc jailbreak-cabal;
        hscolour = overrideCabal self.hscolour (drv: {
          isLibrary = false;
          doHaddock = false;
          hyperlinkSource = false;      # Avoid depending on hscolour for this build.
          postFixup = "rm -rf $out/lib $out/share $out/nix-support";
        });
        cpphs = overrideCabal (self.cpphs.overrideScope (self: super: {
          mkDerivation = drv: super.mkDerivation (drv // {
            enableSharedExecutables = false;
            enableSharedLibraries = false;
            doHaddock = false;
            useCpphs = false;
          });
        })) (drv: {
            isLibrary = false;
            postFixup = "rm -rf $out/lib $out/share $out/nix-support";
        });
      };

      overrideCabal = drv: f: drv.override (args: args // {
        mkDerivation = drv: args.mkDerivation (drv // f drv);
      });

      callPackageWithScope = scope: drv: args: (stdenv.lib.callPackageWith scope drv args) // {
        overrideScope = f: callPackageWithScope (mkScope (fix' (extends f scope.__unfix__))) drv args;
      };

      mkScope = scope: pkgs // pkgs.xorg // pkgs.gnome2 // scope // extraScope;
      defaultScope = mkScope self;
      callPackage = drv: args: callPackageWithScope defaultScope drv args;

      withPackages = packages: callPackage <nixpkgs/pkgs/development/haskell-modules/with-packages-wrapper.nix> {
        inherit (self) llvmPackages;
        haskellPackages = self;
        inherit packages;
      };

      hackage2nix = name: version: pkgs.stdenv.mkDerivation {
        name = "cabal2nix-${name}-${version}";
        buildInputs = [ pkgs.cabal2nix ];
        phases = ["installPhase"];
        LANG = "en_US.UTF-8";
        LOCALE_ARCHIVE = pkgs.lib.optionalString pkgs.stdenv.isLinux "${pkgs.glibcLocales}/lib/locale/locale-archive";
        installPhase = ''
          export HOME="$TMP"
          mkdir $out
          hash=$(sed -e 's/.*"SHA256":"//' -e 's/".*$//' ${all-cabal-hashes}/${name}/${version}/${name}.json)
          cabal2nix --compiler=${self.ghc.name} --system=${stdenv.system} --sha256=$hash ${all-cabal-hashes}/${name}/${version}/${name}.cabal >$out/default.nix
        '';
      };

    in
      (packageSource { inherit pkgs stdenv callPackage; } self // {

        inherit mkDerivation callPackage;

        callHackage = name: version: self.callPackage (hackage2nix name version);

        ghcWithPackages = selectFrom: withPackages (selectFrom self);

        ghcWithHoogle = selectFrom:
          let
            packages = selectFrom self;
            hoogle = callPackage <nixpkgs/pkgs/development/haskell-modules/hoogle.nix> {
              inherit packages;
            };
          in withPackages (packages ++ [ hoogle ]);

        ghc = ghc // {
          withPackages = self.ghcWithPackages;
          withHoogle = self.ghcWithHoogle;
        };

      }) // { allPackageNames = builtins.attrNames (packageSource { inherit pkgs stdenv callPackage; } {}); };

  commonConfiguration = commonConfig { inherit pkgs; };

in

  fix'
    (extends overrides
      (extends packageSetConfig
        (extends compilerConfig
          (extends commonConfiguration haskellPackages))))
