{ stdenv, pkgs, fetchFromGitHub }:
stdenv.mkDerivation rec {
    pname = "vpsolver";
    version = "v3.1.2";

    src = pkgs.fetchFromGitHub {
        owner = "fdabrandao";
        repo = "vpsolver";
        rev = "${version}";
        sha256 = "00v4qyhbbqssiifa5nlskkpcr4bi6a67n1w4bcqyqqxsc85fs94x";
    };

    buildInputs = [];
}