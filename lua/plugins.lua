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
  view = { adaptive_size = true},
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

-- plugin config end


