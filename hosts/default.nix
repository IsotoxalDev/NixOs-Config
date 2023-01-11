#
#
#

{ lib, inputs, nixpkgs, home-manager, nur, user, location, hyprland, ... }:

let
  system = "x86_64-linux";                                                # System Architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;                                            # Allow proprietary software
  };
  
  lib = nixpkgs.lib;
in
{
  tami = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs user location;
      host.hostName = "tami";
    };
    modules = [
      nur.nixosModules.nur
      hyprland.nixosModules.default
      ./tami
      ./configuration.nix
      
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
          host.hostName = "tami";
        };
        home-manager.users.${user} = {
          imports = [(import ./home.nix)] ++ [(import ./tami/home.nix)];
        };
      }
    ];
  };
}
