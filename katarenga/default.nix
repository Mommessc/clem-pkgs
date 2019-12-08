{ stdenv
, cmake
, GLTK, glfw3
, cppzmq, zeromq, docopt_cpp
}:

stdenv.mkDerivation rec {
	name = "Katarenga-${version}";
	version = "1.0.0-alpha";

	# src = fetchGit {
	# 	ref = "master";
	# 	url = "https://github.com/Henry38/Katarenga.git";
	# };
	src = ~/Documents/Git/Katarenga;

	buildInputs = [
		cmake
		cppzmq
		zeromq
		docopt_cpp
		GLTK
	];

	enableParallelBuilding = true;

	# Since nothing is specified in the CMakeLists yet
	installPhase = ''
    	mkdir -p $out
    	mv katarenga $out/
    '';
}