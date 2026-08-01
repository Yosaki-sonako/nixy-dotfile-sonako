{ pkgs, ... }:

{
  imports = [
    ../modules/fcitx5.nix
    ../modules/system/niri.nix
    ../modules/system/kitty.nix
  ];

  environment.systemPackages = with pkgs; [
    mpv
    google-chrome
    vscode
    v2rayn
  ];
}
