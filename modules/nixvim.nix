{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true; # <boolean>default:false
    defaultEditor = true; # <boolean>default:false <Home-Manager Only>
    viAlias = true; # <boolean>default:false
    vimAlias = true; # <boolean>default:false
    withNodeJs = true; # <boolean>default:false
    withPerl = true; # <boolean>defualt:false
    withPython3 = true; # <boolean>default:true
    withRuby = true; # <boolean>default:true

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
      bash-language-server
      black
      clang-tools
      fd
      ghostscript
      gopls
      lua-language-server
      luaPackages.jsregexp
      mermaid-cli
      nixfmt
      nodejs
      prettierd
      python3
      ripgrep
      stylua
      shellcheck
      shfmt
      sqlite
      systemd-language-server
      tree-sitter
      wl-clipboard
    ];

    plugins = {
      lz-n.enable = true;

      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          bashls = {
            enable = true;
          };

          clangd = {
            enable = true;
          };

          fish_lsp = {
            enable = true;
          };

          html = {
            enable = true;
          };

          jsonls = {
            enable = true;
          };

          lua_lsp = {
            enable = true;
          };

          marksman = {
            enable = true;
          };

          nixd = {
            enable = true;
          };

          pyright = {
            enable = true;
          };

          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            installRustfmt = true;
          };

          texlab = {
            enable = true;
          };

          ts_ls = {
            enable = true;
          };

          tinymist = {
            enable = true;
          };

          vimdoc = {
            enable = true;
          };

          vimls = {
            enable = true;
          };

          yamlls = {
            enable = true;
          };
        };
      };

      which-key = {
        enable = true;
        settings = {
          # 设置窗口边框为圆角或单线（LazyVim 常用 rounded）
          win.border = "rounded";
          # 延迟显示菜单的时间（毫秒）
          delay = 200;
          # 在屏幕右下角显示菜单（默认行为，通过布局微调）
          layout = {
            align = "bottom_right";
            spacing = 3;
          };
          # 隐藏一些无关元素，让界面更简洁
          preset = "modern";
          # 显示图标（需要 nvim-web-devicons 插件支持）
          icons = {
            breadcrumb = "»";
            separator = "➜";
            group = "+";
          };
          spec = [
            {
              __unkeyed-1 = "<leader>b";
              group = "buffer";
            }
            {
              __unkeyed-1 = "<leader>c";
              group = "code";
            }
            {
              __unkeyed-1 = "<leader>f";
              group = "file/find";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "git";
            }
            {
              __unkeyed-1 = "<leader>q";
              group = "quit/session";
            }
            {
              __unkeyed-1 = "<leader>s";
              group = "search";
            }
            {
              __unkeyed-1 = "<leader>u";
              group = "ui";
            }
            {
              __unkeyed-1 = "<leader>w";
              group = "window";
            }
            {
              __unkeyed-1 = "<leader>x";
              group = "diagnostics/quickfix";
            }
          ];
        };
      };

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

      trouble.enable = true;

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "emoji"; }
            { name = "path"; }
            { name = "buffer"; }

            { name = "luasnip"; }
          ];
          mapping = {
            "<Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end, {'i', 's'})
            '';

            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };

      telescope = {
        enable = false;
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
        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          bash
          json
          lua
          make
          markdown
          nix
          regex
          toml
          vim
          vimdoc
          xml
          yaml
          css
          latex
          scss
          svelte
          typst
          vue
        ];

        settings = {
          highlight.enable = true;
        };

        nixvimInjections = true;
      };

      lualine = {
        enable = true;
        settings = {
          options = {
            component_separators = {
              left = "";
              right = "";
            };
            section_separators = {
              left = "";
              right = "";
            };
          };
        };
      };

      noice = {
        enable = true;
        settings = {
          lsp.override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.set_formatting_op" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "typing" = true;
            "cmp.entry.get_documentation" = true;
          };
          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
            lsp_doc_border = true;
          };
        };
      };

      snacks = {
        enable = true;
        settings = {
          bigfile = {
            enabled = true;
          };

          notifier = {
            enabled = true;
            timeout = 3000;
          };

          quickfile = {
            enabled = false;
          };

          statuscolumn = {
            enabled = false;
          };

          words = {
            debounce = 100;
            enabled = true;
          };

          dashboard = {
            enabled = true;
            sections = [
              {
                section = "header";
                content = ''
                  ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
                  ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
                  ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
                  ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
                  ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
                  ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                '';
              }
              {
                section = "keys";
                gap = 1;
                padding = 2;
              }
              {
                icon = " ";
                title = "最近文件";
                section = "recent_files";
                indent = 2;
                padding = 1;
              }
              {
                icon = " ";
                title = "项目";
                section = "projects";
                indent = 2;
                padding = 1;
              }
              # { section = "startup"; }
            ];

            preset = {
              keys = [
                {
                  icon = " ";
                  key = "f";
                  desc = "查找文件";
                  action = ":lua Snacks.dashboard.pick('files')";
                }
                {
                  icon = " ";
                  key = "n";
                  desc = "新建文件";
                  action = ":ene | startinsert";
                }
                {
                  icon = " ";
                  key = "g";
                  desc = "全局搜索";
                  action = ":lua Snacks.dashboard.pick('live_grep')";
                }
                {
                  icon = " ";
                  key = "c";
                  desc = "配置";
                  action = ":lua Snacks.dashboard.pick('files', {cwd = '~/.config/nvim'})";
                }
                {
                  icon = " ";
                  key = "q";
                  desc = "退出";
                  action = ":qa";
                }
              ];
            };
          };

          explorer = {
            enabled = true;
          };

          image = {
            enabled = true;
          };

          input = {
            enabled = true;
          };

          picker = {
            enabled = true;
          };

          scope = {
            enabled = true;
          };

          scroll = {
            enabled = true;
          };

          scratch = {
            enabled = true;
          };
        };
      };

      bufferline = {
        enable = true;
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters_by_ft = {
            lua = [ "stylua" ];
            python = [ "black" ];
            nix = [ "nixfmt" ];
            javascript = [ "prettierd" ];
          };
        };
      };

      nvim-autopairs = {
        enable = true;
      };

      schemastore = {
        enable = true;
        json.enable = true;
        yaml.enable = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-startuptime
      plenary-nvim
    ];
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
      # --- 1. 基础增强 (General) ---
      # 即使开启了 wrap 也能按视觉行上下移动
      {
        mode = [
          "n"
          "x"
        ];
        key = "j";
        action = "v:count == 0 ? 'gj' : 'j'";
        options = {
          expr = true;
          silent = true;
          desc = "Down";
        };
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "k";
        action = "v:count == 0 ? 'gk' : 'k'";
        options = {
          expr = true;
          silent = true;
          desc = "Up";
        };
      }

      # 移动代码块 (Alt + jk)
      {
        mode = "n";
        key = "<A-j>";
        action = "<cmd>m .+1<cr>==Standard";
        options.desc = "Move Down";
      }
      {
        mode = "n";
        key = "<A-k>";
        action = "<cmd>m .-2<cr>==Standard";
        options.desc = "Move Up";
      }
      {
        mode = "i";
        key = "<A-j>";
        action = "<esc><cmd>m .+1<cr>==gi";
        options.desc = "Move Down";
      }
      {
        mode = "i";
        key = "<A-k>";
        action = "<esc><cmd>m .-2<cr>==gi";
        options.desc = "Move Up";
      }
      {
        mode = "v";
        key = "<A-j>";
        action = ":m '>+1<cr>gv=gv";
        options.desc = "Move Down";
      }
      {
        mode = "v";
        key = "<A-k>";
        action = ":m '<-2<cr>gv=gv";
        options.desc = "Move Up";
      }

      # 清除搜索高亮
      {
        mode = [
          "i"
          "n"
        ];
        key = "<esc>";
        action = "<cmd>noh<cr><esc>";
        options.desc = "Escape and Clear hlsearch";
      }

      # 更好的缩进 (保持选中状态)
      {
        mode = "v";
        key = "<";
        action = "<gv";
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
      }

      # --- 2. 窗口管理 (Windows) ---
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Go to Left Window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Go to Lower Window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Go to Upper Window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Go to Right Window";
      }

      {
        mode = "n";
        key = "<leader>ww";
        action = "<C-w>p";
        options.desc = "Other Window";
      }
      {
        mode = "n";
        key = "<leader>wd";
        action = "<C-w>c";
        options.desc = "Delete Window";
      }
      {
        mode = "n";
        key = "<leader>w-";
        action = "<C-w>s";
        options.desc = "Split Window Below";
      }
      {
        mode = "n";
        key = "<leader>w|";
        action = "<C-w>v";
        options.desc = "Split Window Right";
      }

      # 窗口缩放
      {
        mode = "n";
        key = "<C-Up>";
        action = "<cmd>resize +2<cr>";
        options.desc = "Increase Window Height";
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = "<cmd>resize -2<cr>";
        options.desc = "Decrease Window Height";
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = "<cmd>vertical resize -2<cr>";
        options.desc = "Decrease Window Width";
      }
      {
        mode = "n";
        key = "<C-Right>";
        action = "<cmd>vertical resize +2<cr>";
        options.desc = "Increase Window Width";
      }

      # --- 3. 缓冲区管理 (Buffers) ---
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<cr>";
        options.desc = "Prev Buffer";
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<cr>";
        options.desc = "Next Buffer";
      }
      {
        mode = "n";
        key = "[b";
        action = "<cmd>bprevious<cr>";
        options.desc = "Prev Buffer";
      }
      {
        mode = "n";
        key = "]b";
        action = "<cmd>bnext<cr>";
        options.desc = "Next Buffer";
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>e #<cr>";
        options.desc = "Switch to Other Buffer";
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bd<cr>";
        options.desc = "Delete Buffer";
      }

      # --- 4. 文件查找与搜索 (Find/Search) ---
      # --- Picker (原来的 Telescope 增强版) ---
      {
        mode = "n";
        key = "<leader><space>"; # 这里的快捷键非常推荐，空格+空格直接搜文件
        action = "<cmd>lua Snacks.picker.smart()<CR>";
        options.desc = "Smart Find Files";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>lua Snacks.picker.files()<CR>";
        options.desc = "Find Files";
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<cmd>lua Snacks.picker.recent()<CR>";
        options.desc = "Recent Files";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>lua Snacks.picker.buffers()<CR>";
        options.desc = "Buffers";
      }
      {
        mode = "n";
        key = "<leader>sg";
        action = "<cmd>lua Snacks.picker.grep()<CR>";
        options.desc = "Grep (Global Search)";
      }
      {
        mode = "n";
        key = "<leader>sw";
        action = "<cmd>lua Snacks.picker.grep_word()<CR>";
        options.desc = "Search Word Under Cursor";
      }
      {
        mode = "n";
        key = "<leader>sk";
        action = "<cmd>lua Snacks.picker.keymaps()<CR>";
        options.desc = "Search Keymaps";
      }
      {
        mode = "n";
        key = "<leader>sq";
        action = "<cmd>lua Snacks.picker.qflist()<CR>";
        options.desc = "Quickfix List";
      }

      # --- 5. LSP 操作 (Code) ---
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua Snacks.picker.lsp_definitions()<cr>";
        options.desc = "Goto Definition";
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>lua Snacks.picker.lsp_references()<cr>";
        options.desc = "References";
      }
      {
        mode = "n";
        key = "gI";
        action = "<cmd>lua Snacks.picker.lsp_implementations()<cr>";
        options.desc = "Goto Implementation";
      }
      {
        mode = "n";
        key = "gy";
        action = "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>";
        options.desc = "Goto Type Definition";
      }
      {
        mode = "n";
        key = "K";
        action = "v:lua.vim.lsp.buf.hover";
        options.desc = "Hover";
      }
      {
        mode = "n";
        key = "<leader>ss";
        action = "<cmd>lua Snacks.picker.lsp_symbols()<cr>";
        options.desc = "LSP Symbols";
      }
      {
        mode = "n";
        key = "<leader>ca";
        action = "v:lua.vim.lsp.buf.code_action";
        options.desc = "Code Action";
      }
      {
        mode = "n";
        key = "<leader>cr";
        action = "v:lua.vim.lsp.buf.rename";
        options.desc = "Rename";
      }
      {
        mode = "n";
        key = "<leader>cd";
        action = "v:lua.vim.diagnostic.open_float";
        options.desc = "Line Diagnostics";
      }
      {
        mode = "n";
        key = "[d";
        action = "v:lua.vim.diagnostic.goto_prev";
        options.desc = "Prev Diagnostic";
      }
      {
        mode = "n";
        key = "]d";
        action = "v:lua.vim.diagnostic.goto_next";
        options.desc = "Next Diagnostic";
      }

      # --- 6. 工具与 UI (Tools/UI) ---
      # 文件树 (Snacks)
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>lua Snacks.explorer()<cr>";
        options.desc = "Explorer Snacks (Root Dir)";
      }
      {
        mode = "n";
        key = "<leader>fe";
        action = "<cmd>lua Snacks.explorer()<cr>";
        options.desc = "Explorer Snacks (Root Dir)";
      }
      {
        mode = "n";
        key = "<leader>E";
        action = "<cmd>lua Snacks.explorer({cwd = vim.fn.getcwd()})<cr>";
        options.desc = "Explorer Snacks (cwd)";
      }

      # 浮动终端 (Snacks 实现)
      {
        mode = "n";
        key = "<leader>ft";
        action = "<cmd>lua Snacks.terminal()<cr>";
        options.desc = "Terminal (Root Dir)";
      }
      {
        mode = "n";
        key = "<C-/>";
        action = "<cmd>lua Snacks.terminal()<cr>";
        options.desc = "Terminal (Root Dir)";
      }
      {
        mode = "t";
        key = "<C-/>";
        action = "<cmd>close<cr>";
        options.desc = "Hide Terminal";
      }

      # UI 切换 (Toggle)
      {
        mode = "n";
        key = "<leader>uf";
        action = "<cmd>lua vim.g.autoformat = not vim.g.autoformat<cr>";
        options.desc = "Toggle Auto Format (Global)";
      }
      {
        mode = "n";
        key = "<leader>us";
        action = "<cmd>set spell!<cr>";
        options.desc = "Toggle Spelling";
      }
      {
        mode = "n";
        key = "<leader>uw";
        action = "<cmd>set wrap!<cr>";
        options.desc = "Toggle Word Wrap";
      }
      {
        mode = "n";
        key = "<leader>ud";
        action = "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>";
        options.desc = "Toggle Diagnostics";
      }

      # 诊断列表 (Trouble)
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options.desc = "Diagnostics (Trouble)";
      }
      {
        mode = "n";
        key = "<leader>xX";
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        options.desc = "Buffer Diagnostics (Trouble)";
      }

      # Scratchpad (Snacks)
      {
        mode = "n";
        key = "<leader>ns"; # 也可以改成你喜欢的，LazyVim 默认有时是 <leader>.
        action = "<cmd>lua Snacks.scratch()<CR>";
        options.desc = "Toggle Scratchpad";
      }
      {
        mode = "n";
        key = "<leader>nS";
        action = "<cmd>lua Snacks.scratch.select()<CR>";
        options.desc = "Select Scratchpad";
      }
    ];

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "macchiato";
        # transparent_background = true;
      };
    };

    lsp = { };

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
