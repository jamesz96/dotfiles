local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local ok, packer = pcall(require, "packer")

if ok then
  local use = packer.use

  packer.init({
    git = {
      clone_timeout = 300
    },
    display = {
      open_cmd = '80vnew [packer]',
    }
  })

  local plugins = function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    use { 'andweeb/presence.nvim' } -- discord integration
    use {'neovim/nvim-lspconfig', opt = true} -- builtin lsp config
    use {'gruvbox-community/gruvbox', opt = false} -- nice colorscheme
    use {'cohama/lexima.vim', opt = false} -- autopairs brackets, braces etc
    use {'tomtom/tcomment_vim', opt = false} -- comment stuff easier
    use {'wakatime/vim-wakatime', opt = false} -- track usage time using wakatime
    use {'nvim-treesitter/nvim-treesitter', opt = false} -- better syntax highlighting
    use {'nvim-treesitter/playground', opt = true} -- playground for treesitter
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
      'hrsh7th/nvim-compe',
      opt = true,
      requires = {
        {'hrsh7th/vim-vsnip'}, -- integration with vim-vsnip
        {'hrsh7th/vim-vsnip-integ'} -- integration with vim-vsnip
      },
    } -- completion framework
    use {
      'dhruvasagar/vim-table-mode',
      ft = {'txt', 'markdown'},
      opt = true,
    } -- table alignment
    use {
      'kyazdani42/nvim-tree.lua',
      opt = false,
      requires = {
        {'kyazdani42/nvim-web-devicons', opt = false }
      },
    } -- super fast file tree viewer
    use {
      'akinsho/nvim-bufferline.lua',
      tag = "*",
      requires = { 'kyazdani42/nvim-web-devicons' }
    } -- snazzy bufferline
    use {
      'mattn/emmet-vim',
      cmd = 'EmmetInstall',
      opt = true
    } -- less typing for html code
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      },
    } -- extensible fuzzy finder
    use {
      'rhysd/git-messenger.vim',
      cmd = 'GitMessenger',
      opt = true
    } -- sort of like git blame but in floating window
    use {
      'mhinz/vim-sayonara',
      cmd = 'Sayonara',
      opt = true
    } -- better window and buffer management
    use { 'brooth/far.vim', opt = false } -- project wide search and replace
    use {"akinsho/toggleterm.nvim"}
  end

  return packer.startup(plugins)
end
