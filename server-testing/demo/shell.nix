{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.vagrant
    pkgs.ansible
    pkgs.just
    pkgs.goss
    pkgs.python3
    pkgs.python3Packages.pytest
    pkgs.python3Packages.pytest-testinfra
    pkgs.ruby
    pkgs.bundler
  ];
}
