{ stdenv
, cmake
, GLTK
, cppzmq, zeromq, docopt_cpp
}:

stdenv.mkDerivation rec {
	name = "Katarenga-${version}";
	version = "1.0.0-alpha";

	src = fetchGit {
		ref = "master";
		url = "https://github.com/Henry38/Katarenga.git";
	};

	nativeBuildInputs = [
		cmake
		GLTK
	];

	buildInputs = [
		cppzmq
		zeromq
		docopt_cpp
	];

	shellHook = ''GLTK_DIR=${GLTK}/lib/cmake'';

	enableParallelBuilding = true;
}