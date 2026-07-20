# ~/nixy-sonako/modubles/fish.nix
{ pkgs, ... }:

{
  programs.fish = {
      enable = true;
      interactiveShellInit = ''
      set -g fish_greeting ""
    '';
      shellAbbrs = {
        v = "nvim";
        ff = "fastfetch";
        gs = "git status";
        gd = "git diff";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        gl = "git log --oneline --graph";
    };
    shellAliases = {
        ll = "ls -l";
        la = "ls -la";
        l = "cd ..";
        sysrebuild = "git -C ~/nixy-sonako add . && sudo nixos-rebuild switch --flake ~/nixy-sonako";

        rebuild = ''git -C ~/nixy-sonako add . && nix run nixpkgs#home-manager -- switch --flake ~/nixy-sonako#sonako && sh -c 'echo "---- User Changes (Home Manager) ----"; if [ -d /nix/var/nix/profiles/per-user/sonako ]; then PATHS=$(ls -d /nix/var/nix/profiles/per-user/sonako/home-manager-*-link 2>/dev/null); else PATHS=$(ls -d $HOME/.local/state/nix/profiles/home-manager-*-link 2>/dev/null); fi; if [ -n "$PATHS" ]; then nvd diff $(echo "$PATHS" | tail -2); fi' '';

        sysdiff = ''sh -c 'echo "---- Software Version Changes (nvd) ----" && nvd diff $(ls -d /nix/var/nix/profiles/system-*-link | tail -2) && echo "---- Disk Changes (Size) ----" && nix store diff-closures $(ls -d /nix/var/nix/profiles/system-*-link | tail -2)' '';
    };
    plugins = with pkgs.fishPlugins; [
        { name = "done"; src = done.src; }
        { name = "colored-man-page"; src = colored-man-pages.src; }
      ];
    };
  programs.starship = {
        enable = true;
        settings = {
          add_newline = false;
          line_break = {
            disabled = false;
          };
          character = {
            success_symbol = "[ ➜](bold cyan) ";
            error_symbol = "[ ➜](bold red) ";
          };
        };
      };
}
