{ stdenv, fetchurl, glibc }:

stdenv.mkDerivation rec {
    pname = "gnat";
    version = "20170515-63";

    src = fetchurl {
        url = "http://mirrors.cdn.adacore.com/art/591c6d80c7a447af2deed1d7";
        sha256 = "1rjn15dq7742wgdrb09fxs6hmxhrjr6n52wznd49g8yy42nbqhmr";
    };
    #src = /opt/gnat-gpl-2017-x86_64-linux-bin.tar.gz;

    #propagatedBuildInputs = [ glibc.static ];
    buildInputs = [ glibc glibc.static ];

    unpackCmd = "tar xf $src";
    buildPhase = ''true'';

    # Yep, keep everything...
    installPhase = ''
    mkdir -p $out
    mv * $out/
    patchelf --set-interpreter \
        ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/bin/gnatmake
    patchelf --set-interpreter \
        ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/bin/gnatbind
    patchelf --set-interpreter \
        ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/bin/gnatlink
    patchelf --set-interpreter \
        ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/bin/gcc
    patchelf --set-interpreter \
        ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/libexec/gcc/x86_64-pc-linux-gnu/6.3.1/ld
    patchelf --set-interpreter \
        ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/libexec/gcc/x86_64-pc-linux-gnu/6.3.1/gnat1
    patchelf --set-interpreter \
        ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/libexec/gcc/x86_64-pc-linux-gnu/6.3.1/as
    patchelf --set-interpreter \
        ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/libexec/gcc/x86_64-pc-linux-gnu/6.3.1/collect2
    '';

    meta = with stdenv.lib; {
        description = "GNAT compiler for Ada, integrated into the GCC compiler system.";
        longDescription = ''
        GNAT is a free, high-quality, complete compiler for Ada, integrated into the GCC compiler system.
        '';
        homepage = https://www.gnu.org/software/gnat/;
        license = licenses.gpl3Plus;
        platforms = platforms.unix;
        broken = false;
    };
}
