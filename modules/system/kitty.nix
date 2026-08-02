#~/modules/kitty.nix
{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.kitty
  ];
  environment.etc."xdg/kitty/kitty.conf".text = ''
    font_family      JetBrainsMono Nerd Font
    font_size        16.0

    shell fish

    background_opacity 0.85
    window_padding_width 12

    confirm_os_window_close 0
    enable_audio_bell no
    scrollback_lines 10000
    cursor_shape beam
    cursor_blink_interval 0
    wayland_enable_ime yes

    background #222436
    foreground #c8d3f5
    selection_background #2d3f76
    selection_foreground #c8d3f5
    url_color #4fd6be
    cursor #c8d3f5
    cursor_text_color #222436

    color0 #1b1d2b
    color1 #ff757f
    color2 #c3e88d
    color3 #ffc777
    color4 #82aaff
    color5 #c099ff
    color6 #86e1fc
    color7 #828bb8

    color8 #444a73
    color9 #ff757f
    color10 #c3e88d
    color11 #ffc777
    color12 #82aaff
    color13 #c099ff
    color14 #86e1fc
    color15 #c8d3f5
  '';
}
