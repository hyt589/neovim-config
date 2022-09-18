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
    highlights = {
      TSField = {fg = '$red'},
      TSProperty = {fg = '$red'},
      TSVariable = {fg = '#fdff94'},
      TSParameter = {fg = '#3ae0a6'},
    }
-- vim.cmd [[highlight cppTSField guifg=#de4747]]
-- vim.cmd [[highlight cppTSProperty guifg=#de4747]]
}
require('onedark').load()

require('nvim-tree').setup {
  view = {
      -- width = "20%",
      adaptive_size = true
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
}

require('lualine').setup {
  options = {
    theme = 'onedark'
  },
}

require('nvim_comment').setup {
  comment_empty = false
}

require('nvim-treesitter.configs').setup{
  -- ensure_installed = {"cpp", "glsl"},
  highlight = {
    enable = true
  }
}

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
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

require("project_nvim").setup{
    detection_methods = { "pattern" },
    patterns = {".git", ".vim", "build"}
}

local Path = require('plenary.path')
require('tasks').setup({
  default_params = { -- Default module parameters with which `neovim.json` will be created.
    cmake = {
      cmd = 'cmake', -- CMake executable to use, can be changed using `:Task set_module_param cmake cmd`.
      build_dir = tostring(Path:new('{cwd}', 'build', '{os}-{build_type}')), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
      build_type = 'RelWithDebInfo', -- Build type, can be changed using `:Task set_module_param cmake build_type`.
      dap_name = 'lldb', -- DAP configuration name from `require('dap').configurations`. If there is no such configuration, a new one with this name as `type` will be created.
      args = { -- Task default arguments.
        configure = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Ninja' },
      },
    },
  },
  save_before_run = true, -- If true, all files will be saved before executing a task.
  params_file = 'neovim.json', -- JSON file to store module and task parameters.
  quickfix = {
    pos = 'botright', -- Default quickfix position.
    height = 12, -- Default height.
  },
  dap_open_command = function() return require('dap').repl.open() end, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
  })

-- plugin config end


