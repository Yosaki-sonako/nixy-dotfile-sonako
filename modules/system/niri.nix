#~/nixy-sonako/modules/niri.nix
{ pkgs, ... }:
{
  programs.niri.enable = true;
  environment.etc."niri/config.kdl".source = ../../sonako/config/niri.kdl;
}
