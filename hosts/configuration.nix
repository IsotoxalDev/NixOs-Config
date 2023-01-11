# tah tah tah
#
# Isotoxal's Main Nix Configuration !!!
#

{ config, lib, pkgs, inputs, user, location, ... }:

{
  imports = 
  ( import ../modules/shell );
  
  users.users.${user} = {                    # System User
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" "kvm"];
    shell = pkgs.zsh;
  };
  
  # Localisation
  time.timeZone = "Asia/kolkatta";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "caps:backspace";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };
  
  # Network Manager
  networking.networkmanager.enable = true;

  
  security.rtkit.enable = true;
  
  fonts.fonts = with pkgs; [
    mononoki
    iosevka
  ];
  
  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "hx";
    };
    systemPackages = with pkgs; [
      bat
      exa
      fd
      git
      helix
      wget
      zsh
      starship
    ];
  };
  
  services = {
    printing = {
      enable = true;
    };
    avahi = {
      enable = true;
      nssmdns = true;
      publish = {
        enable = true;
        addresses = true;
        userServices = true;
      };
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    openssh = {
      enable = true;
    };
  };
  
  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };
  nixpkgs.config.allowUnfree = true;
  
  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11";
  };
}
