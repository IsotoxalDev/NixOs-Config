{ config, lib, pkgs, ... }:

{
  services.dbus.enable = true;

  environment = {
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';                                   # Will automatically open Hyprland when logged into tty1

    variables = {
      XDG_CURRENT_DESKTOP="Hyprland";
      XDG_SESSION_TYPE="wayland";
      XDG_SESSION_DESKTOP="Hyprland";
    };
    systemPackages = with pkgs; [
      grim
      mpvpaper
      slurp
      swappy
      wl-clipboard
      wlr-randr
    ];
  };

  programs = {
    hyprland.enable = true;
  };
}
