# ~/nixy-sonako/module/fcitx5.nix
{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime            
      rime-data               
      qt6Packages.fcitx5-chinese-addons   
      fcitx5-gtk
      fcitx5-material-color
      ];
  };

  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "fcitx";
  };
}
