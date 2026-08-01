# ~/nixy-sonako/sonako/fcitx5-rime.nix
{ ... }:

{
  home.file = {
    ".local/share/fcitx5/rime/default.custom.yaml".text = ''
      patch:
        schema_list: luna_pinyin_simp
          - schema: 
          "menu/page_size": 7      
    '';
  };
}
