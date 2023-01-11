{ config, lib, pkgs, ... }:

let
  confFile = ''
    theme = "tokyonight"

    [editor]
    line-number = "relative"
    mouse = false
    
    [editor.cursor-shape]
    insert = "bar"
    normal = "block"
    select = "underline"
    
    [editor.file-picker]
    hidden = false
    
    [editor.whitespace.render]
    newline = "none"
    tab = "all"
    
    [editor.whitespace.characters]
    tab = "·"
    tabpad = "·"
    
    [editor.indent-guides]
    render = true
    skip-levels = 1
    '';
in
{
  xdg.configFile."helix/config.toml".text = confFile;
}
