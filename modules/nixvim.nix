{ pkgs, inputs, ... }:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals = {
      mapleader = " ";
      maplocalleader = "\\";
      autoformat = true;
      snacks_animate = true;
      lazyvim_picker = "auto";
      lazyvim_cmp = "auto";
      ai_cmp = true;
      root_spec = [
        "lsp"
        [
          ".git"
          "lua"
        ]
        "cwd"
      ];
      root_lsp_ignore = [ "copilot" ];
      deprecation_warnings = false;
      trouble_lualine = true;
      markdown_recommended_style = 0;
    };

    opts = {
      autowrite = true;
      clipboard = {
        __raw = ''vim.env.SSH_CONNECTION and "" or "unnamedplus"'';
      };
      completeopt = "menu,menuone,noselect";
      conceallevel = 2;
      confirm = true;
      cursorline = true;
      expandtab = true;
      fillchars = {
        foldopen = "";
        foldclose = "";
        fold = " ";
        foldsep = " ";
        diff = "╱";
        eob = " ";
      };
      foldlevel = 99;
      foldmethod = "indent";
      foldtext = "";

      # formatexpr = { __raw = "v:lua.LazyVim.format.formatexpr()"; };
      # statuscolumn = { __raw = "v:lua.LazyVim.statuscolumn()"; };

      formatoptions = "jcroqlnt";
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      ignorecase = true;
      inccommand = "nosplit";
      jumpoptions = "view";
      laststatus = 3;
      linebreak = true;
      list = true;
      mouse = "a";
      number = true;
      pumblend = 10;
      pumheight = 10;
      relativenumber = true;
      ruler = false;
      scrolloff = 4;
      sessionoptions = [
        "buffers"
        "curdir"
        "tabpages"
        "winsize"
        "help"
        "globals"
        "skiprtp"
        "folds"
      ];
      shiftround = true;
      shiftwidth = 2;
      shortmess = "WlCcI";
      showmode = false;
      sidescrolloff = 8;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      smoothscroll = true;
      spelllang = [ "en" ];
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      tabstop = 2;
      termguicolors = true;
      timeoutlen = 300;
      undofile = true;
      undolevels = 10000;
      updatetime = 200;
      virtualedit = "block";
      wildmode = "longest:full,full";
      winminwidth = 5;
      wrap = false;
    };

    extraPackages = with pkgs; [
      stylua
      shellcheck
      shfmt
      pyright
      nodePackages.typescript-language-server

      wl-clipboard
    ];

    plugins = {
      lz-n.enable = true;

      which-key.enable = true;

      neorg = {
        enable = true;
        lazyLoad.settings.ft = [ "norg" ];
        settings.load."core.defaults" = { };
      };

      mini = {
        enable = true;
        modules.icons = {
          style = "default";
        };
        mockDevIcons = true;
      };

      dressing = {
        enable = true;
        lazyLoad.settings.event = [ "DeferredUIEnter" ];
      };

      treesj = {
        enable = true;
        lazyLoad.settings.keys = [ "J" ];
        settings = {
          use_default_keymaps = false;
          max_join_length = 150;
        };
      };

      dial = {
        enable = true;
        lazyLoad.settings.keys = [
          "<C-a>"
          "<C-x>"
        ];
      };

      trouble.enable = false;

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "emoji"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end, {'i', 's'})
            '';
          };
        };
      };

      telescope = {
        enable = true;
        settings = {
          defaults = {
            layout_strategy = "horizontal";
            layout_config = {
              prompt_position = "top";
            };
            sorting_strategy = "ascending";
            winblend = 0;
          };
        };
        keymaps = {
          "<leader>fp" = {
            action = "find_files";
            options = {
              desc = "Find Files (Root)";
            };
          };
        };
      };

      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [
            "bash"
            "html"
            "javascript"
            "json"
            "lua"
            "markdown"
            "markdown_inline"
            "python"
            "query"
            "regex"
            "tsx"
            "typescript"
            "vim"
            "yaml"
          ];
          highlight.enable = true;
        };

        nixvimInjections = true;
        grammarPackages = with pkgs.tree-sitter-grammars; [
          tree-sitter-norg
          tree-sitter-lua
          tree-sitter-vim
          tree-sitter-python
          tree-sitter-markdown
        ];
      };

      lualine = {
        enable = true;
        settings = {
          sections.lualine_x = [
            "encoding"
            "fileformat"
            "filetype"
            {
              __raw = ''
                function()
                  return "😄"
                end
              '';
            }
          ];
        };
      };

      noice = {
        enable = true;
        settings = {
          lsp.override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.set_formatting_op" = true;
            "typing" = true;
          };
          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
          };
        };
      };
    };

    extraPlugins = [ pkgs.vimPlugins.vim-startuptime ];
    extraConfigLua = ''
      vim.g.startuptime_tries = 10
      if vim.fn.exists(':StartupTime') == 0 then
        vim.api.nvim_create_user_command('StartupTime', function()
          vim.cmd('packadd vim-startuptime')
          vim.cmd('StartupTime')
        end, {})
      end
    '';

    keymaps = [
      {
        mode = "n";
        key = "J";
        action = "<cmd>TSJToggle<cr>";
        options.desc = "Join Toggle";
      }
    ];

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "macchiato";
        # transparent_background = true;
      };
    };

    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        pyright.enable = true;
        tsserver.enable = true;
        jsonls.enable = true;
      };
    };

    autoCmd = [
      {
        event = [ "BufReadPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            function()
              local mark = vim.api.nvim_buf_get_mark(0, '"')
              local lcount = vim.api.nvim_buf_line_count(0)
              if mark[1] > 0 and mark[1] <= lcount then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
              end
            end
          '';
        };
      }
    ];
  };
}
