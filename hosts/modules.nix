{ pkgs, ... }:

{
  imports = [
    ../modules/fcitx5.nix
    ../modules/niri.nix
    ../modules/kitty.nix
  ];

  environment.systemPackages = with pkgs; [
    mpv
    google-chrome
    vscode
    v2rayn
  ];
}
