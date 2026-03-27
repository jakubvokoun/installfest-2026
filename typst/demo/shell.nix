{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.typst
    pkgs.tinymist
    pkgs.just
  ];
}
