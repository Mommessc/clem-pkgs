{ stdenv
, cmake
, glfw3, assimp, glm
}:

stdenv.mkDerivation rec {
	name = "GLTK-${version}";
	version = "1.0.0-alpha";

	src = fetchGit {
		ref = "master";
		url = "https://github.com/Henry38/OpenGL.git";
	};

	nativeBuildInputs = [
		cmake
	];

	buildInputs = [
		glfw3
		assimp
		glm
	];

	cmakeFlags = ''-DBUILD_EXAMPLES=OFF'';
	enableParallelBuilding = true;

	patches = [ ./patch.patch ];
}