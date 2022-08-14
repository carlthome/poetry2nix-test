# Testing nix flakes with poetry2nix

## Created by

1. Installing `nix` with flakes enabled and installing `git`.
1. git init
1. nix flake init -t templates#poetry
1. git add .
1. direnv allow
1. poetry init

## Poetry

### Building

1. poetry build

Install resulting wheel in another environment and run it there.

### Installing application and running it

1. poetry install
1. poetry run trainer

## Nix

### Building

1. nix build

### Installing application and running it

1. nix run
