{ clangStdenv
, cmake
, GLTK, glfw3
, zmqpp, docopt_cpp
}:

clangStdenv.mkDerivation rec {
	name = "Katarenga-${version}";
	version = "1.0.0-alpha";

	src = fetchGit {
		ref = "master";
		url = "https://github.com/Henry38/Katarenga.git";
	};

	buildInputs = [
		cmake
		zmqpp
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