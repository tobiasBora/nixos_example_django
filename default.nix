{ pkgs ? import <nixpkgs> {} }:
# callPackage style is used for better integration with nixpkgs.

pkgs.callPackage ./derivation.nix {}
