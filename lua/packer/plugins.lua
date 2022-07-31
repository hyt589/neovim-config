vim.cmd [[packadd packer.nvim]]

local info = debug.getinfo(1, 'S')
local thisFile = string.sub(info.source, 2)

vim.api.nvim_create_user_command(
  'NvimPluginConfig',
  'e ' .. thisFile,
  {bang = true}
)

return require('packer').startup(function()

 use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        patterns = { ".git", "Makefile", "package.json", "CMakeLists.txt" },
      }
    end
  } 

	use 'wbthomason/packer.nvim'

	use {'neoclide/coc.nvim', branch = 'release'}

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'liuchengxu/vim-which-key'
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
  }

  use{
   'sonph/onehalf',
   rtp = 'vim',
   config = function()
     -- vim.cmd 'colorscheme onehalfdark'
   end
  }

  use {'kassio/neoterm'}

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
        -- If lualine is installed tabline will use separators configured in lualine by default.
        -- These options can be used to override those settings.
          section_separators = {'', ''},
          component_separators = {'', ''},
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = true, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        }
      }
      vim.cmd[[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  }

  use "terrortylor/nvim-comment"

  use "hyt589/nvim-window"

  use 'tpope/vim-fugitive'

  use 'navarasu/onedark.nvim'

  use 'rafcamlet/coc-nvim-lua'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {"ellisonleao/glow.nvim" }

  use {"tikhomirov/vim-glsl"}

  use "nvim-treesitter/playground"

  use "mhinz/vim-startify"

end)
