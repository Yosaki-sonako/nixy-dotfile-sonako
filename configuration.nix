{ config, lib, pkgs, username, ... }:

let
  useNetworkManager = true;
in
{
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
    wireless.iwd.enable = true;
    wireless.enable = false;
    useNetworkd = (!useNetworkManager);
    useDHCP = (!useNetworkManager);
  };

  boot.kernelModules = [ "tcp_bbr" ];
  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "cake";
    "net.ipv4.tcp_congestion_control" = "bbr";
  };

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  nix = {
    settings = {
      download-attempts = 15;
      experimental-features = [ 
        "nix-command"
        "flakes"
        ];
      };
  };

  users.users.sonako = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];  };
}
