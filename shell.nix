{ pkgs ? import <nixpkgs> {} }:
#  A nix shell file is similar to a derivation, but just need to know dependencies
# Extra dependencies can be added like editors or development tools
# $ cd src
# $ django-admin startproject mydjangowebsite .
with pkgs;

stdenv.mkDerivation {
  name = "mydjangowebsite-env";
  buildInputs = [
    # Project dependencies
    (python36.withPackages (ps: with ps; [ django ]))

    # utilities
    git
  ];
}
