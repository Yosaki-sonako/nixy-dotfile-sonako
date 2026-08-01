# ~/nixy-sonako/hosts/home.nix
{ pkgs, lib, ... }:

{
  imports = [
    ../sonako/fastfetch.nix
    ../sonako/fcitx5-rime.nix
    ../sonako/konsole.nix

    ../modules/nixvim.nix
    ../modules/git.nix
    ../modules/fish.nix
    ../modules/vsc.nix
  ];

  nixpkgs.config.allowUnfree = true;
  home.username = "sonako";
  home.homeDirectory = "/home/sonako";

  home.stateVersion = "26.05";
  home.packages = with pkgs; [
    qq
    qqmusic
    obs-studio

    papirus-icon-theme
    papirus-folders
  ];
  xdg.dataFile = {
    "v2rayN/bin/sing_box/sing-box".source = "${pkgs.sing-box}/bin/sing-box";
    "v2rayN/bin/xray/xray".source = "${pkgs.xray}/bin/xray";
    "v2rayN/bin/geoip.dat".source = "${pkgs.v2ray-geoip}/share/v2ray/geoip.dat";
    "v2rayN/bin/geosite.dat".source = "${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat";
  };
  home.activation = {
    refreshkdeMenu = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD ${pkgs.kdePackages.kservice}/bin/kbuildsycoca6 || true 
    '';
  };
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.callPackage ../sonako/qogir-cursors.nix { };
    name = "Qogir";
    size = 24;
  };
}
