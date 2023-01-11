{ pkgs, lib, user, ... }:

{
  imports =
  [(import ./hardware-configuration.nix)] ++
  [(import ../../modules/desktop/hyprland/default.nix)] ++
  [(import ../../modules/hardware)];
  
  boot = {                                      # Boot options
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {                                  # For legacy boot:
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;                              # Grub auto select time
    };
  };
  
  services = {
    blueman.enable = true;                      # Bluetooth
  };
  
  nixpkgs.overlays = [                          # This overlay will pull the latest version of Discord
    (self: super: {
      discord = super.discord.overrideAttrs (
        _: { src = builtins.fetchTarball {
          url = "https://discord.com/api/download?platform=linux&format=tar.gz";
          sha256 = "1z980p3zmwmy29cdz2v8c36ywrybr7saw8n0w7wlb74m63zb9gpi";
        };}
      );
    })
  ];
  
}
