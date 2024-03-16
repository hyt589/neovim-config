-- load plugins
require('packer.plugins')

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
