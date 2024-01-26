vim.cmd [[packadd packer.nvim]]

local info = debug.getinfo(1, 'S')
local thisFile = string.sub(info.source, 2)

vim.api.nvim_create_user_command(
    'NvimPluginConfig',
    'e ' .. thisFile,
    { bang = true }
)

return require('packer').startup(function()
    use "kdheepak/lazygit.nvim"

    use {
        "ahmedkhalf/project.nvim"
    }

    use 'wbthomason/packer.nvim'

    use { 'neoclide/coc.nvim', branch = 'release' }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use 'liuchengxu/vim-which-key'
    -- use {
    --     'AckslD/nvim-whichkey-setup.lua',
    --     requires = { 'liuchengxu/vim-which-key' },
    -- }
    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        'sonph/onehalf',
        rtp = 'vim',
        config = function()
            -- vim.cmd 'colorscheme onehalfdark'
        end
    }

    use { "akinsho/toggleterm.nvim", tag = '*' }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly'                     -- optional, updated every week. (see issue #1193)
    }

    use {
        'kdheepak/tabline.nvim',
        config = function()
            require 'tabline'.setup {
                -- Defaults configuration options
                enable = true,
                options = {
                    -- If lualine is installed tabline will use separators configured in lualine by default.
                    -- These options can be used to override those settings.
                    section_separators = { '', '' },
                    component_separators = { '', '' },
                    max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
                    show_tabs_always = false,    -- this shows tabs only when there are more than one tab or if the first tab is named
                    show_devicons = true,        -- this shows devicons in buffer section
                    show_bufnr = true,           -- this appends [bufnr] to buffer section,
                    show_filename_only = false,  -- shows base filename only instead of relative path in filename
                    modified_icon = "+ ",        -- change the default modified icon
                    modified_italic = false,     -- set to true by default; this determines whether the filename turns italic if modified
                    show_tabs_only = false,      -- this shows only tabs instead of tabs + buffers
                }
            }
            vim.cmd [[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
        end,
        requires = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
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

    use { "tikhomirov/vim-glsl" }

    use "nvim-treesitter/playground"

    use "mhinz/vim-startify"

    -- use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    --   require("toggleterm").setup(){}
    -- end}

    use { "ellisonleao/glow.nvim", config = function() require("glow").setup() end }

    use 'liuchengxu/vista.vim'

    use {
        'declancm/maximize.nvim',
        config = function() require('maximize').setup() end
    }

    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require 'hop'.setup {}
        end
    }

    use 'karb94/neoscroll.nvim'

    use { 'echasnovski/mini.nvim', branch = 'stable' }

    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })
end)
