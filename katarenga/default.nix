{ stdenv
, cmake
, GLTK, glfw3
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
		glfw3
	];

	buildInputs = [
		cppzmq
		zeromq
		docopt_cpp
	];

	cmakeFlags = "-DGLTK_DIR=${GLTK}/lib/cmake";

	enableParallelBuilding = true;
}