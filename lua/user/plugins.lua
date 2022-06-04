-- Automatically installs packer when cloned
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- Automatically run :PackerCompile when this file is updated
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Open Packer in popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}

packer.startup(function(use)
  -- My plugins here
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colorscheme
  use 'navarasu/onedark.nvim'

  -- Completion
  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }

  -- Null-ls
  use 'jose-elias-alvarez/null-ls.nvim'

  --BufferLine
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

  -- AutoPairs
  use "jiangmiao/auto-pairs"

  -- Auto Close Tag and Auto Tag Rename
  use "windwp/nvim-ts-autotag"

  -- Commentary
  use "tpope/vim-commentary"

  -- Sneak
  use "justinmk/vim-sneak"

  -- Surround
  use "tpope/vim-surround"

  -- Easymotion
  use "easymotion/vim-easymotion"

  -- ToggleTerm
  use { "akinsho/toggleterm.nvim", tag = 'v1.*' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
