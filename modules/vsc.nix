# ~/nixy-sonako/modules/vscode.nix
{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {

      extensions = with pkgs.vscode-extensions; [
        enkia.tokyo-night
      ];

      userSettings = {
        "workbench.colorTheme" = "Tokyo Night";
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace";
        "editor.fontSize" = 16;
        "editor.tabSize" = 2;
        "files.autoSave" = "afterDelay";
        "editor.fontLigatures" = true;
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
