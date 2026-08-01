{ pkgs, ... }:

{
  imports = [
    ../hardware-xiaoxin.nix
    ../configuration.nix
    ../modules/fonts.nix
    ./modules.nix
  ];

  networking.hostName = "yosaki-nixos";
  system.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;
  security.pam.services.sddm.enableKwallet = true;
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    # neovim
    vim
    nvd
    fish
    fastfetch
    git
    wget
    curl
    zip
    p7zip
    tree
    unzip
    unrar-free
  ];

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = false;
    configurationLimit = 3;
    gfxpayloadEfi = "text";
    extraEntries = ''
      menuentry "Windows Boot Manager" {
        insmod part_gpt
        insmod fat
        search --no-floppy --file --set=root /EFI/Microsoft/Boot/bootmgfw.efi
        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      }
    '';
  };
}
