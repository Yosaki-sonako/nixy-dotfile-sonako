# ~/nixy-sonako/modules/fonts.nix
{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      noto-fonts-color-emoji

      wqy_microhei
      wqy_zenhei
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Sans CJK SC"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif CJK SC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
