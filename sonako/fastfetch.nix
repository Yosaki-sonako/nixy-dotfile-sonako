# ~/nixy-sonako/sonako/fastfetch.nix
{ pkgs, ... }:

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
        color = "cyan";    
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
