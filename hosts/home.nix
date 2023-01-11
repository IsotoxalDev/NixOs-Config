# file: home.nix
# 
# General Home-manager configuration
#

{ config, lib, pkgs, user, ... }:

{
  imports = [                                   # Home Manager Modules
    (import ../modules/editors)
    #(import ../modules/services)
    (import ../modules/programs)];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    
    packages = with pkgs; [
      # Terminal
      btop                # Resource Manager
      pfetch              # Minimal fetch
      
      # Audio/Video
      feh                 # Image Viewer
      mpv                 # Vidoe Playing
      pavucontrol         # Audio Control
      
      # Apps
      firefox             # Browser
      godot               # Game Engine
      gimp                # Raster Image
      inkscape            # Vector Image
      blender             # 3D Modelling
      zathura             # PDF Viewer
      discord             # Chat
      lutris              # Game Launcher
      vbam                # Visual Boy Advanced
      obs-studio          # Screen Recording
      wacomtablet         # Drawing Tablet
      
      # General Apps
      alacritty           # Terminal
      rofi                # Run Launcher
      udiskie             # Auto Mount Disks
      
      # Other
      blueman             # Bluetooth
      ffmpeg              # FFMPEG
      gmtp                # Mount Phone
    ];
    pointerCursor = {
      gtk.enable = true;
      name = "phinger-cursors";
      package = pkgs.phinger-cursors;
    };
    stateVersion = "22.11";
  };
  
  programs = {
    home-manager.enable = true;
  };
  
  gtk = {
    enable = true;
    theme = {
      name = "Amarena";
      package = pkgs.amarena-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
     name = "iosevka"; 
    };
  };
}

