Install NixOS

    $ git clone <repo>
    $ cd nixy-dotfile-sonako
    $ cp your hardware.config
    $ sudo nixos-generate-config --no-filesystems --show-hardware-config > ./hardware.nix
    $ sudo nixos-install --flake .#HOST
    $ reboot
