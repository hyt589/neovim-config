-- easy access to config files
local info = debug.getinfo(1,'S');
local thisFile = string.sub(info.source, 2)

vim.api.nvim_create_user_command(
  'NvimConfig',
  'e ' .. thisFile,
  {bang = true}
)

vim.api.nvim_create_user_command(
  'ReloadNvimConfig',
  'source ' .. thisFile,
  {bang = true}
)
-- load plugins
require('plugins')

-- plugin config start
require('coc_config')

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
  view = { width = 50}
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

-- plugin config end

if vim.fn.has('win32') or vim.fn.has('win64') then
  vim.g.neoterm_shell = 'powershell.exe'
end
vim.g.neoterm_default_mod = 'botright'
vim.g.neoterm_autoinsert = 1
vim.g.neoterm_size = 15

local wk = require('whichkey_setup')
wk.config{
  default_keymap_settings = {
    silent=true,
    noremap=true,
  },
  default_mode = 'n',
}
local space_keymap = {
  f = {
    name = '+find',
    f = {'<cmd>Telescope find_files<cr>', 'files'},
    z = {'<cmd>Telescope current_buffer_fuzzy_find<cr>', 'in current buffer'},
    c = {'<cmd>Telescope commands<cr>', 'commands'},
    b = {'<cmd>Telescope buffers<cr>', 'buffers'}
  },
  b = {
    name = '+buffers',
    d = {'<cmd>bp<bar>sp<bar>bn<bar>bd<cr>', 'close current buffer but leaves window open'},
    s = {'<C-^>', 'switch buffer'},
  },
  w = {
    name = '+windows',
    q = {'<cmd>wincmd q<cr>', 'close current window'},
    h = {'<cmd>wincmd h<cr>', 'move to window to the left'},
    j = {'<cmd>wincmd j<cr>', 'move to window to the up'},
    k = {'<cmd>wincmd k<cr>', 'move to window to the bottom'},
    l = {'<cmd>wincmd l<cr>', 'move to window to the right'},
    w = {'<cmd>lua require("nvim-window").pick()<cr>', 'pick a window'},
    v = {'<cmd>vsplit<cr>', 'split a window vertically'}
  },
  g = {
    name = '+git',
    s = {'<cmd>Git<cr>', 'open git window'},
    b = {'<cmd>Git blame<cr>', 'show git blame'},
    l = {
      name = '+log',
      p = {'<cmd>Git log --graph --oneline --decorate --abbrev-commit<cr>', 'show history graph'}
    }
  },
}
local commands = {
  cmake = {
    -- this only works on windows if using msvc build tools
    generateCompileCommands = [[ cmake -DCMAKE_TRY_COMPILE_TARGET_TYPE="STATIC_LIBRARY" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_MAKE_PROGRAM=nmake -S . -B compile_db_temp -G "Unix Makefiles" && copy compile_db_temp\compile_commands.json . && @RD /S /Q compile_db_temp ]]
  }
}
local backslash_keymap = {
  t = {'<cmd>Ttoggle<cr>', 'Toggle the neoterm window'},
  f = {'<cmd>NvimTreeFocus<cr>', 'Toggle nvim tree'},
  w = {'<cmd>lua require("nvim-window").pick()<cr>', 'pick a window'},
  ['1'] = {'<cmd>buffer 1<cr>', 'open buffer 1'},
  ['2'] = {'<cmd>buffer 2<cr>', 'open buffer 2'},
  ['3'] = {'<cmd>buffer 3<cr>', 'open buffer 3'},
  ['4'] = {'<cmd>buffer 4<cr>', 'open buffer 4'},
  ['5'] = {'<cmd>buffer 5<cr>', 'open buffer 5'},
  ['6'] = {'<cmd>buffer 6<cr>', 'open buffer 6'},
  ['7'] = {'<cmd>buffer 7<cr>', 'open buffer 7'},
  ['8'] = {'<cmd>buffer 8<cr>', 'open buffer 8'},
  ['9'] = {'<cmd>buffer 9<cr>', 'open buffer 9'},
  c = {
    name = '+cmake options',
    c = {'<cmd>!' .. commands.cmake.generateCompileCommands .. '<cr>', 'generate compile_commands.json'},
    b = {'<cmd>!cmake -S . -B build && cmake --build build --config Release<cr>', 'build cmake project'}
  },
  o = {'<cmd>CocCommand clangd.switchSourceHeader<cr>', 'switch header source cpp'},
  [';'] = {'<cmd>CocCommand clangd.inlayHints.toggle<cr>', 'toggle clangd inlayHints'}
}
wk.register_keymap(' ', space_keymap)
wk.register_keymap('\\', backslash_keymap)

vim.cmd [[ tnoremap <esc> <c-\><c-n> ]]
vim.cmd [[ nnoremap <silent>Q <cmd>qa<cr> ]]
vim.cmd [[ nnoremap <silent><c-s> <cmd>wa<cr> ]]
vim.cmd [[ nmap <c-_> gcc]] -- comment line
vim.cmd [[ vmap <c-_> gc]] -- comment block
vim.cmd [[ colorscheme onedark]]

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.mouse = 'a'

vim.cmd [[ autocmd! BufNewFile,BufRead *.vert,*.frag set ft=glslx ]]

if vim.g.neovide then
  vim.opt.guifont = "FiraCode NF:h11"
  local function toggle_fullscreen()
    if vim.g.neovide_fullscreen then
      vim.cmd [[let g:neovide_fullscreen = v:false]]
    else
      vim.cmd [[let g:neovide_fullscreen = v:true]]
    end
  end
  vim.keymap.set("", "<F11>", toggle_fullscreen)
end
