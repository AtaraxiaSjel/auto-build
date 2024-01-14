{
  description = "Automated builds for x86_64-linux";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    attic.url = "github:zhaofengli/attic";
    attic.inputs.nixpkgs.follows = "nixpkgs";
    attic.inputs.nixpkgs-stable.follows = "nixpkgs-stable";
  };
  outputs = { nixpkgs, ... }@inputs: rec {
    packages.x86_64-linux = {
      attic = inputs.attic.packages.x86_64-linux.attic-client;
      attic-server = inputs.attic.packages.x86_64-linux.attic-server;
    };
    overlays.default = final: prev: packages.x86_64-linux;
  };
}