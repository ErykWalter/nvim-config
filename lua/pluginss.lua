--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]

require "helpers/globals"

return {
  -- Mason {{{
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "extensions.mason"
    end
  },
  -- }}}

  -- Neo Tree {{{ 
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require "extensions.neotree"
    end
  },
  -- }}}

  -- Telescope {{{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "extensions.telescope"
    end
  },
  -- }}}

  -- CMP {{{
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require "extensions.cmp"
    end
  },
  -- }}}

  -- Git Signs{{{
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require "extensions.gitsigns"
    end
  },
  -- }}}

  -- Trouble {{{
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "extensions.trouble"
    end,
  },
  -- }}}

  -- TreeSitter {{{
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "extensions.treesitter"
    end
  },
  -- }}}

  -- Theme: rose-pine {{{
  {
    "rose-pine/neovim",
    lazy = false,
    config = function ()
      require "extensions.colorscheme.rose-pine"
    end
  },
  -- }}}

  -- Colorizer {{{
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    config = function ()
      require "extensions.colorizer"
    end
  },
  -- }}}

  -- Window navigation with tmux-nvim-navigation {{{
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  -- }}}

  -- Which-key: menu with commands {{{
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    opt.timeout = true
    opt.timeoutlen = 300
  end,
  config = function ()
    require "extensions.which-key"
  end
  },
  -- }}}

  -- toggleterm: terminal emulator in nvim {{{
  {'akinsho/toggleterm.nvim', version = "*",
  config = function ()
    require "extensions.toggleterm"
  end},
  -- }}}

  -- Copilot.vim {{{
  {'github/copilot.vim', version = "*",
  lazy = false,}
  -- }}}
}
-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
