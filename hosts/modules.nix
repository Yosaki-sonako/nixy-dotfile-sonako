{ pkgs, ... }:

{
 imports = [
    ../modules/fcitx5.nix
   ];

environment.systemPackages = with pkgs; [
    google-chrome
    vscode
    v2rayn
  ];
}
