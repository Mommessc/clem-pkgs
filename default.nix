{
    pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/20.09.tar.gz") {},
    # use Clang instead of GCC
    #useClang ? true
}:
#let
# Add libraries to the scope of callPackage
#stdenv = pkgs.clangStdenv;
rec {
    inherit pkgs;
    
    GLTK = pkgs.callPackage ./pkgs/GLTK { };
    katarenga = pkgs.callPackage ./pkgs/katarenga { inherit GLTK; };
    gnat = pkgs.callPackage ./pkgs/gnat { };
}
