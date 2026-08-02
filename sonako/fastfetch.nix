# ~/nixy-sonako/sonako/fastfetch.nix
{ ... }:

{
  programs.fastfetch = {
    enable = true;
    
    settings = {
      logo = {
        source = "nixos";
        padding = {
          right = 2;
        };
      };
      
      display = {
        color = {
          tile = "cyan";
          key = "blue";
        };
        separator = " - ";
      };
      
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "de"
        "wm"
	      "font"
        "terminal"
        "cpu"
        "gpu"
	      "disk"
        "memory"
	      "swap"
	      "battery"
        "break"
      	"colors"
      ];
    };
  };
}
