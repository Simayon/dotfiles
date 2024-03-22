{ config, pkgs, ... }:

let
  theme = config.colorScheme.palette;
in {
  programs.nixvim = {
    enable = true;

    globals.mapleader = " "; # Sets the leader key to space

    options = {
      clipboard="unnamedplus";
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;        # Tab width should be 2
      softtabstop = 2;
      smartindent = true;
      wrap = false;
      swapfile = false;
      backup = false;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      updatetime = 50;
    };

    colorschemes.base16.enable = true;
    colorschemes.base16.customColorScheme = {
      base00 = "#${theme.base00}";
      base01 = "#${theme.base01}";
      base02 = "#${theme.base02}";
      base03 = "#${theme.base03}";
      base04 = "#${theme.base04}";
      base05 = "#${theme.base05}";
      base06 = "#${theme.base06}";
      base07 = "#${theme.base07}";
      base08 = "#${theme.base08}";
      base09 = "#${theme.base09}";
      base0A = "#${theme.base0A}";
      base0B = "#${theme.base0B}";
      base0C = "#${theme.base0C}";
      base0D = "#${theme.base0D}";
      base0E = "#${theme.base0E}";
      base0F = "#${theme.base0F}";
    };

    plugins = {
      barbecue.enable = true;
      gitsigns.enable = true;
      noice.enable = true;

      # Snippets
      luasnip.enable = true;
      friendly-snippets.enable = true;

      # autocompletion
      cmp_luasnip.enable = true; #Snippets enable
      cmp-nvim-lsp.enable = true; #LSP Server for neovim
      cmp-nvim-lua.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>lg" = "live_grep";
        };
      };
      indent-blankline.enable = true;
      nvim-colorizer.enable = true;
      nvim-autopairs.enable = true;
      nix.enable = true;
      comment-nvim.enable = true;
      lualine = {
        enable = true;
      };
      startup = {
        enable = true;
        theme = "dashboard";
      };
      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
          bashls.enable = true;
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          nixd.enable = true;
          html.enable = true;
          ccls.enable = true;
          cmake.enable = true;
          csharp-ls.enable = true;
          cssls.enable = true;
          gopls.enable = true;
          jsonls.enable = true;
          pyright.enable = true;
          tailwindcss.enable = true;
        };
      };
      lsp-lines.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''cmp.mapping.select_next_item()'';
            modes = [ "i" "s" ];
          };
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      telescope-file-browser-nvim
      nvim-lspconfig
    ];

    # FOR NEOVIDE
    extraConfigLua = ''
    vim.opt.guifont = "JetBrainsMono\\ NFM,Noto_Color_Emoji:h14"
    vim.g.neovide_cursor_animation_length = 0.05

    local colors = {
      blue   = '#${theme.base0D}',
      cyan   = '#${theme.base0C}',
      black  = '#${theme.base00}',
      white  = '#${theme.base05}',
      red    = '#${theme.base08}',
      violet = '#${theme.base0E}',
      grey   = '#${theme.base02}',
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
      },
    }

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }

    -- import nvim-cmp plugin safely
    local cmp_status, cmp = pcall(require, "cmp")
    if not cmp_status then
    return
    end

    -- import luasnip plugin safely
    local luasnip_status, luasnip = pcall(require, "luasnip")
    if not luasnip_status then
    return
    end

    -- load VSCode-like snippets from plugins (e.g., friendly-snippets)

    require("luasnip/loaders/from_vscode").lazy_load()

    vim.opt.completeopt = "menu,menuone,noselect"

    cmp.setup({
      snippet = {
        expand = function(args)
        luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),

      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within the current buffer
        { name = "path" }, -- file system paths
      }),
    })

    '';

    extraConfigVim = ''
    set noshowmode
    inoremap jj <ESC>
    '';

    keymaps = [
      {
        mode = "n";
        key = "<space>fb";
        action = ":Telescope file_browser<CR>";
        options.noremap = true;
      }
      {
        key = "<Tab>";
        action = ":bnext<CR>";
        options.silent = false;
      }
      {
        key = "<S-Tab>";
        action = ":bprev<CR>";
        options.silent = false;
      }
      {
        key = "<Leader>y";
        action = "\"+y";  #yank into PRIMARY register
        options.silent = true;
      }
      {
        key = "<Leader>pp";
        action = "\"+p";  #paste from PRIMARY register
        options.silent = true;
      }
      {
        mode = "n";
        key = "<Leader>ph";
        action = ":Gitsigns preview_hunk<CR>";
        options.noremap = true;
        options.silent = true;
      }
    ];

    highlight.ExtraWhitespace.bg = "red";
    match.ExtraWhitespace = "\\s\\+$";
    autoCmd = [
      {
        event = "FileType";
        pattern = "nix";
        command = "setlocal tabstop=2 shiftwidth=2";
      }
      {
        event = "BufWritePre";  # The event at which the cmd is triggered
        pattern = "*"; # the pattern. Eg nix for only .nix files
        command = ":%s/\\s\\+$//e"; # command to run on event
      }
    ];
  };
}
