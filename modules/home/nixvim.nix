{ pkgs, inputs, ... }:

{
  programs.nixvim = {
    enable = true;

    nixpkgs.source = inputs.nixpkgs;

    extraPackages = with pkgs; [
      nixfmt
    ];
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      ignorecase = true;
      termguicolors = true;
    };
    globals.mapleader = " ";
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "moon";
      };
    };

    plugins = {
      treesitter.enable = true;
      transparent.enable = true;
      alpha = {
        enable = true;
        settings = {
          layout = [
            {
              type = "padding";
              val = 2;
            }
            {
              type = "text";
              val = [
                "          ██╗  ██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗          "
                "          ███╗ ██║╚██╗██╔╝██║   ██║██║████╗ ████║          "
                "          ██╔██╗██║ ╚███╔╝ ██║   ██║██║██╔████╔██║          "
                "          ██║╚████║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║          "
                "          ██║ ╚███║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║          "
                "          ╚═╝  ╚══╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝          "
                "                                                            "
                "                      NIXOS NEOVIM IDE                      "
              ];
              opts = {
                hl = "AlphaHeader";
                position = "center";
              };
            }
            {
              type = "padding";
              val = 2;
            }
            {
              type = "group";
              val = [
                {
                  type = "button";
                  val = "    New file";
                  on_press.__raw = "function() vim.cmd('ene | startinsert') end";
                  opts = {
                    position = "center";
                    keymap = [
                      "n"
                      "e"
                      "<cmd>ene | startinsert<cr>"
                      { desc = "New file"; }
                    ];
                    shortcut = "e";
                    width = 30;
                    align_shortcut = "right";
                    hl_shortcut = "AlphaShortcut";
                  };
                }
                {
                  type = "button";
                  val = "    Find file";
                  on_press.__raw = "function() vim.cmd('Telescope find_files') end";
                  opts = {
                    position = "center";
                    keymap = [
                      "n"
                      "f"
                      "<cmd>Telescope find_files<cr>"
                      { desc = "Find file"; }
                    ];
                    shortcut = "SPC f f";
                    width = 30;
                    align_shortcut = "right";
                    hl_shortcut = "AlphaShortcut";
                  };
                }
              ];
            }
          ];
        };
      };
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "tokyonight";
          };
          sections = {
            lualine_x = [
              "encoding"
              {
                __unkeyed-1 = "fileformat";
                symbols = {
                  unix = "";
                };
              }
              "filetype"
            ];
          };
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
          formatters_by_ft = {
            nix = [ "nixfmt" ];
          };
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
        };
      };
      neo-tree = {
        enable = true;
        settings = {
          close_if_last_window = true;
        };
      };
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
        };
        keymaps.lspBuf = {
          "k" = "hover";
          "gd" = "definition";
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree toggle<R>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>fm";
        action = "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>";
        options.silent = true;
      }
    ];
  };
}
