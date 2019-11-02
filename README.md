This repository contains a list of personal Nix recipes.

### How to use?

The `path/to/my-nixpkgs` in all the following commands can be given using different methods:
- Give directly a tarball: https://github.com/Mommessc/my-nixpkgs/archive/master.tar.gz
- Clone this repository on your machine and give the path

List available packages using:
```sh
nix-env -qaP -f /path/to/my-nixpkgs
```

Install a package using:
```sh
nix-env -f /path/to/my-nixpkgs -iA packageName
```

You can also enter a dev environment for a certain package with:
```sh
nix-shell /path/to/my-nixpkgs -A packageName

