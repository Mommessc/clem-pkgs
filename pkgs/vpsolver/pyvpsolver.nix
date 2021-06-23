{ stdenv, pkgs, python3Packages }:
let
    packageOverrides = pkgs.callPackage ./python-requirements.nix {};
    python = pkgs.python3.override { inherit packageOverrides; };
    pythonVPSPackages = python.withPackages (ps: [
        ps.future
        ps.six
        ps.flask
        ps.pympl
        ps.pytest
        ps.pytest-cov
        ps.coveralls
    ]);
in python3Packages.buildPythonPackage rec {
    pname = "pyvpsolver";
    version = "3.1.2";

    src = pkgs.python3Packages.fetchPypi {
        inherit pname version;
        sha256 = "aecac95fd8447e9b30c8b609fd1a15ae15f0d19e559d394724034ef480c65df3";
    };

    propagatedBuildInputs =  [
        #pkgs.gurobi
        pythonVPSPackages
    ];

    doCheck = false;
}