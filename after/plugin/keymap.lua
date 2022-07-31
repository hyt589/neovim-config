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
