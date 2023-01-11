# Dun Dun Dun
# 
# Behold, Isotoxal's very own Nix Config !!!

{
  description = "Isotoxal's NixOS config";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;   # Nix Packages

    home-manager = {                                     # User Package Management
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {                                         # Hyperland!!!
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nur.url = "github:nix-community/NUR";                #NUR
  };

  outputs = inputs @ { self,  nixpkgs, nur, home-manager, hyprland, ... }:
    let
      user = "isotoxal";
      location = "$HOME/.setup";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager nur user location hyprland;
      }
    );
  };
}
