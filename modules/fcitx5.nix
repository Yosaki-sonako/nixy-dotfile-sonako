# ~/nixy-sonako/module/fcitx5.nix
{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
    waylandFrontend = true;
    addons = with pkgs; [
      fcitx5-rime            
      rime-data               
      qt6Packages.fcitx5-chinese-addons   
      fcitx5-gtk
      fcitx5-material-color
      ];
    };
  };
}
