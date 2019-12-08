{ stdenv
, cmake
, glfw3, assimp, glm
}:

stdenv.mkDerivation rec {
	name = "GLTK-${version}";
	version = "0.0.1";

	src = fetchGit {
		#url = "https://github.com/Henry38/GLTK/archive/v0.0.1.tar.gz";
		url = "https://github.com/Henry38/GLTK.git";
		#ref = "v0.0.1";
		ref = "master";
	};

	buildInputs = [
		cmake
		assimp
	];

	propagatedBuildInputs = [ glfw3 glm ];

	cmakeFlags = ''-DBUILD_EXAMPLES=OFF'';
	enableParallelBuilding = true;

	patches = [ ./patch.patch ];
}