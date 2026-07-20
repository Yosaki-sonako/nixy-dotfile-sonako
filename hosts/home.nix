# ~/nixy-sonako/hosts/home.nix
{ pkgs, lib, ... }:

{
  imports = [ 
    ../sonako/fastfetch.nix
    ../modules/nixvim.nix
    ../modules/git.nix
    ../modules/fish.nix
  ];

  nixpkgs.config.allowUnfree = true;
  home.username = "sonako";
  home.homeDirectory = "/home/sonako";

  home.stateVersion = "26.05"; 
  home.packages = with pkgs; [
    qq
    qqmusic

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
  home.file = {
      ".local/share/fcitx5/rime/default.custom.yaml".text = ''
      patch:
        schema_list:
          - schema: luna_pinyin_simp        
        "menu/page_size": 7
    '';

    ".local/share/fcitx5/rime/luna_pinyin_simp.custom.yaml".text = ''
      patch:
        "translator/enable_user_dict": true
    '';
  };
}
