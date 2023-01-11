{ pkgs, ... }:

{
  imports =
    [
      ../../modules/desktop/hyprland/home.nix  # Window Manager
    ];

  services = {                            # Applets
    blueman-applet.enable = true;         # Bluetooth
  };
} 
