{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        utils.url = "github:numtide/flake-utils";
    };

    outputs = {self, nixpkgs, utils}:
    let out = system:
    let pkgs = nixpkgs.legacyPackages."${system}";
    in rec {

        devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
                python3Packages.poetry
            ];
        };

        packages.default = with pkgs.poetry2nix; mkPoetryApplication {
            projectDir = ./.;
            preferWheels = true;
        };

        apps.default = utils.lib.mkApp {
            drv = packages.default;
        };

    }; in with utils.lib; eachSystem defaultSystems out;

}
