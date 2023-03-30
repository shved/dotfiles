-- TODO check neovim defaults and remove obs options
--
-- COLORS
--

vim.cmd('set background=dark')
-- vim.cmd('set background=light')

-- vim.cmd.colorscheme("oldbook8")
-- vim.cmd.colorscheme("newsprint")
-- vim.cmd.colorscheme("nofrils-light")
-- vim.cmd.colorscheme("nofrils-dark")
-- vim.cmd.colorscheme("atlas")
-- vim.cmd.colorscheme("mies")
-- vim.cmd.colorscheme("typewriter-night")
-- vim.cmd.colorscheme("off")
vim.cmd.colorscheme("darcula")

--
-- OPTIONS
--

vim.opt.termguicolors = true
vim.opt.guicursor = ""

vim.opt.number = true

vim.api.nvim_set_option("mouse","a")
vim.api.nvim_set_option("clipboard","unnamedplus")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/home/shvedchenko/.vim/undodir"
vim.opt.undofile = true
vim.opt.autoread = true
vim.opt.hidden = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.listchars = "tab:>–,trail:~,extends:>,precedes:<,nbsp:+"
vim.opt.list = true

vim.g.mapleader = ","

vim.g.rustfmt_autosave = 1

--
-- KEYMAPS
--

vim.keymap.set("n", "vv", vim.cmd.vsplit)
vim.keymap.set("n", "ss", vim.cmd.split)

-- vim.keymap.set("n", "<leader>r", ":so ~/.config/nvim/init.lua<CR>")

vim.keymap.set("n", "tn", vim.cmd.tabnew)
vim.keymap.set("n", "th", vim.cmd.tabprevious)
vim.keymap.set("n", "tl", vim.cmd.tabnext)
vim.keymap.set("v", "tn", "<Esc>:tabnew<CR>")
vim.keymap.set("v", "th", "<Esc>:tabprevious<CR>")
vim.keymap.set("v", "tl", "<Esc>:tabnext<CR>")

vim.keymap.set("n", "<C-\\>", ":NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<CR>", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<C-j>", "<C-W><C-j>")
vim.keymap.set("n", "<C-h>", "<C-W><C-h>")
vim.keymap.set("n", "<C-k>", "<C-W><C-k>")
vim.keymap.set("n", "<C-l>", "<C-W><C-l>")

-- Make 0 go to the first character rather than the beginning
-- of the line. When we're programming, we're almost always
-- interested in working with text rather than empty space. If
-- you want the traditional beginning of line, use ^
vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "^", "0")

--
-- PLUGINS
--

vim.g.gitblame_enabled = 0
vim.g.gitgutter_map_keys = 0

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'nvim-tree/nvim-tree.lua', requires='nvim-tree/nvim-web-devicons' }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- use("nvim-treesitter/nvim-treesitter-context")

  use { 'nvim-lualine/lualine.nvim', requires='kyazdani42/nvim-web-devicons' }

  use { 'kdheepak/tabline.nvim', requires = { { 'hoob3rt/lualine.nvim' }, {'kyazdani42/nvim-web-devicons'} } }
  -- use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}


  use { 'mfussenegger/nvim-dap' }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  -- use { 'theHamsta/nvim-dap-virtual-text' }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lua'},
    }
  }

  use 'fatih/vim-go'
  use 'rust-lang/rust.vim'

  use 'f-person/git-blame.nvim'
  use 'airblade/vim-gitgutter'
  use 'terrortylor/nvim-comment'
  use 'vim-scripts/ReplaceWithRegister'

  use 'doums/darcula'
  use 'arzg/vim-oldbook8'
  use 'jaredgorski/Mies.vim'
  use 'robertmeta/nofrils'
  use 'logico/typewriter'
  use 'huyvohcmc/atlas.vim'
  use 'bruth/vim-newsprint-theme'
  use 'pbrisbin/vim-colors-off'
end)
