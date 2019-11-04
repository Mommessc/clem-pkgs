{
  pkgs ? import <nixpkgs> {},
  # use Clang instead of GCC
  useClang ? true
}:
let
  # Add libraries to the scope of callPackage
  callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // self);
  
  self = rec {
    GLTK = callPackage ./GLTK { };
    katarenga = callPackage ./katarenga { };
    gnat = callPackage ./gnat { };

    inherit pkgs;
  }
  // pkgs.stdenv.lib.optionalAttrs useClang { stdenv = pkgs.clangStdenv; };
in
  self