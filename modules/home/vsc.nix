# ~/nixy-sonako/modules/vsc.nix
{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        enkia.tokyo-night
        jnoortheen.nix-ide
      ];

      userSettings = {
        "workbench.colorTheme" = "Tokyo Night"; 
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace";
        "editor.fontSize" = 14;
        "editor.fontLigatures" = true;

        "editor.tokenColorCustomizations" = {
            "comments" = { 
            "foreground" = "#565f89"; 
            "fontStyle" = "italic"; 
          };
          "functions" = "#7aa2f7";
          "keywords" = "#bb9af7";
          "strings" = "#9ece6a";     
          "numbers" = "#ff9e64";     
          "variables" = "#7dcfff";   
          "types" = "#e0af68";       
        };

        "editor.bracketPairColorization.enabled" = true;
        "editor.guide.bracketPairs" = true;
        "editor.semanticHighlighting.enabled" = true;

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
          };
        };

        "editor.quickSuggestions" = {
          "other" = "on";
          "comments" = "on";
          "strings" = "on";
        };
        "editor.suggestOnTriggerCharacters" = true;
        "editor.acceptSuggestionOnEnter" = "on";
        "editor.snippetSuggestions" = "inline";
        "editor.wordBasedSuggestions" = "matchingDocuments";
        "editor.inlineSuggest.enabled" = true;
        "editor.suggest.showDetails" = true;

        "editor.autoClosingBrackets" = "always";
        "editor.autoClosingQuotes" = "always";

        "workbench.startupEditor" = "none";
        "editor.minimap.enabled" = false;
        "window.titleBarStyle" = "custom";
      };
    };
  };
}