# ~/nixy-sonako/hosts/home.nix
{ pkgs, lib, ... }:

{
  imports = [
    ../sonako/fastfetch.nix
    ../sonako/fcitx5-rime.nix
    ../sonako/konsole.nix

    ../modules/home/nixvim.nix
    ../modules/home/git.nix
    ../modules/home/fish.nix
    ../modules/home/vsc.nix
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
    ayugram-desktop
  ];
  xdg.dataFile = {
    "v2rayN/bin/sing_box/sing-box".source = "${pkgs.sing-box}/bin/sing-box";
    "v2rayN/bin/xray/xray".source = "${pkgs.xray}/bin/xray";
    "v2rayN/bin/geoip.dat".source = "${pkgs.v2ray-geoip}/share/v2ray/geoip.dat";
    "v2rayN/bin/geosite.dat".source = "${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat";
  };
  xdg.desktopEntries = {
    qq = {
      name = "QQ";
      icon = "qq";
      comment = "Tencent QQ";
      terminal = false;
      categories = [
        "Network"
        "InstantMessaging"
      ];
      exec = "env PULSE_LATENCY_MSEC=30 qq --audio-buffer-size=2048 %U";
    };
    "com.ayugram.desktop" = {
      name = "AyuGram Desktop";
      exec = "AyuGram -- %u";
      icon = "Acom.ayugram.desktop";
      comment = "AyuGram Desktop Telegram Client";
      terminal = false;
      categories = [
        "Network"
        "InstantMessaging"
        "Chat"
      ];
    };
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
