-- ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {

    "kdheepak/lazygit.nvim",

    "klen/nvim-config-local",

    "ahmedkhalf/project.nvim",

    { 'neoclide/coc.nvim',     branch = 'release' },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        tag = '0.1.6'
    },

    {
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
    },

    {
        'sonph/onehalf',
        config = function()
            -- vim.cmd 'colorscheme onehalfdark'
        end
    },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
    },

    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        branch = 'master'                   -- optional, updated every week. (see issue #1193)
    },

    {
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
        dependencies = { { 'hoob3rt/lualine.nvim', optional = true }, { 'kyazdani42/nvim-web-devicons', optional = true } }
    },

    "terrortylor/nvim-comment",

    "hyt589/nvim-window",

    'tpope/vim-fugitive',

    'navarasu/onedark.nvim',

    'rafcamlet/coc-nvim-lua',

    'nvim-treesitter/nvim-treesitter',

    { "ellisonleao/glow.nvim", config = function() require("glow").setup() end },

    'liuchengxu/vista.vim',

    {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    },

    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require 'hop'.setup {}
        end
    },

    'karb94/neoscroll.nvim',

    { 'echasnovski/mini.nvim', branch = 'stable' },

    {
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup()
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },

    { 'airblade/vim-gitgutter' },

    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
}

require("lazy").setup(plugins)

-- plugin config start
require('coc.config')

require('onedark').setup {
    style = 'darker',
    toggle_style_key = ' ts',
    code_style = {
        functions = 'none',
        keywords = 'none',
        comments = 'none'
    },
    colors = {
        bright_orange = "#ff8800", -- define a new color
    },
    highlights = {
        TSField             = { fg = '$red' },
        TSProperty          = { fg = '$red' },
        TSVariable          = { fg = '#fdff94' },
        TSParameter         = { fg = '#3ae0a6' },
        CocSemVariable      = { fg = '#ffffff' },
        CocSemProperty      = { fg = '$red' },
        CocSemMacro         = { fg = '$purple', fmt = 'bold,italic' },
        CocSemParameter     = { fg = '$red', fmt = 'bold' },
        CocSemTypeParameter = { fg = '$cyan', fmt = 'bold,italic' },
        CocSemNamespace     = { fg = '#32a852', fmt = 'italic' }
    }
    -- vim.cmd [[highlight cppTSField guifg=#de4747]]
    -- vim.cmd [[highlight cppTSProperty guifg=#de4747]]
}
require('onedark').load()

require('nvim-tree').setup {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
    filesystem_watchers = {
        enable = false
    },
    view = {
        float = {
            enable = true,
            -- width = table
        }
    }
}

require('lualine').setup {
    options = {
        theme = 'onedark'
    },
}

require('nvim_comment').setup {
    comment_empty = false
}

require('nvim-treesitter.configs').setup {
    -- ensure_installed = {"cpp", "glsl"},
    highlight = {
        enable = false
    }
}

require "nvim-treesitter.configs".setup {
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    }
}

require('glow').setup({
    -- your override config
    width = 160
})


require('auto-session').setup()

require('hop').setup()

require('neoscroll').setup({
    easing_function = "quadratic" -- Default easing function
    -- Set any other options as needed
})

require('mini.align').setup()

require("chatgpt").setup({
    api_key_cmd = "cat /root/hyt/openai",
    openai_params = {
        model = "gpt-3.5-turbo-16k",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 4096,
        temperature = 0,
        top_p = 1,
        n = 1,
    },
})

require("project_nvim").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    detection_methods = { "pattern" },
    patterns = { "!^build", "!=build", "!^include", ".git", "compile_commands.json", "build/compile_commands.json" },
    silent_chdir = false,
}

require('telescope').load_extension('projects')

require("toggleterm").setup {}

require('config-local').setup {
    -- Default options (optional)

    -- Config file patterns to load (lua supported)
    config_files = { ".nvim.lua", ".nvimrc", ".exrc" },

    -- Where the plugin keeps files data
    hashfile = vim.fn.stdpath("data") .. "/config-local",

    autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
    commands_create = true,     -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
    silent = true,              -- Disable plugin messages (Config loaded/ignored)
    lookup_parents = false,     -- Lookup config files in parent directories
}

require 'alpha'.setup(require 'alpha.themes.startify'.config)

-- plugin config end
