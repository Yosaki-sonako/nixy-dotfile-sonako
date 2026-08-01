# ❄️ Sonako's NixOS Dotfiles
    
    ![NixOS](https://img.shields.io/badge/NixOS-Unstable-blue?style=for-the-badge&logo=nixos)
    ![Wayland](https://img.shields.io/badge/Wayland-Niri-orange?style=for-the-badge&logo=wayland)
    ![DE](https://img.shields.io/badge/KDE-Plasma%206-cyan?style=for-the-badge&logo=kde)
    ![Editor](https://img.shields.io/badge/Editor-Nixvim-green?style=for-the-badge&logo=neovim)


Install NixOS

    $ git clone <repo>
    $ cd nixy-dotfile-sonako
    $ cp your hardware.config
    $ sudo nixos-generate-config --no-filesystems --show-hardware-config > ./hardware.nix
    $ sudo nixos-install --flake .#HOST
    $ sysrebuild
    $ rebuild
    $ reboot
