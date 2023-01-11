{ config, lib, pkgs, ... }:

let
  confFile = ''
    general {
      sensitivity=1
    }
    bind=SUPER,Return,exec,${pkgs.alacritty}/bin/alacritty
    '';
in
{
  xdg.configFile."hypr/hyprland.conf".text = confFile;
}
