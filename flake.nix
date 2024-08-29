{
  description = "Animated Framework logo for Plymouth";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = { self, nixpkgs, systems }: let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    packages = eachSystem (system: rec {
        framework-plymouth = nixpkgs.legacyPackages.${system}.callPackage ./framework-plymouth.nix { };
        default = framework-plymouth;
    });
  };
}
