{
  pkgs ? import <nixpkgs> {},
  # use Clang instead of GCC
  useClang ? true
}:
let
  # Add libraries to the scope of callPackage
  #callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // self);
  
  self = rec {
    GLTK = pkgs.callPackage ./GLTK { };
    katarenga = pkgs.callPackage ./katarenga { inherit GLTK; };
    gnat = pkgs.callPackage ./gnat { };

    inherit pkgs;
  }
  // pkgs.stdenv.lib.optionalAttrs useClang { stdenv = pkgs.clangStdenv; };
in
  self
