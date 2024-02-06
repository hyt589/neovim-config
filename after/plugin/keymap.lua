local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local bash     = Terminal:new({ cmd = "bash", hidden = true, direction = "float", auto_scroll = false })

local function _lazygit_toggle()
    lazygit:toggle()
end

local function _bash_toggle()
    bash:toggle()
end

local wk             = require("which-key")
local space_keymap   = {
    f = {
        name = '+find',
        f = { '<cmd>Telescope find_files<cr>', 'files' },
        z = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'in current buffer' },
        c = { '<cmd>Telescope commands<cr>', 'commands' },
        b = { '<cmd>Telescope buffers<cr>', 'buffers' },
        g = { '<cmd>Telescope live_grep<cr>', 'live grep' },
        w = { "<cmd>lua require'telescope.builtin'.grep_string()<cr>", 'grep word' }
    },
    b = {
        name = '+buffers',
        d = { '<cmd>bp<bar>sp<bar>bn<bar>bd<cr>', 'close current buffer but leaves window open' },
        s = { '<C-^>', 'switch buffer' },
    },
    w = {
        name = '+windows',
        q = { '<cmd>wincmd q<cr>', 'close current window' },
        h = { '<cmd>wincmd h<cr>', 'move to window to the left' },
        j = { '<cmd>wincmd j<cr>', 'move to window to the up' },
        k = { '<cmd>wincmd k<cr>', 'move to window to the bottom' },
        l = { '<cmd>wincmd l<cr>', 'move to window to the right' },
        w = { '<cmd>lua require("nvim-window").pick()<cr>', 'pick a window' },
        v = { '<cmd>vsplit<cr>', 'split a window vertically' },
        e = { '<cmd>wincmd =<cr>', 'resize windows to even splits' },
        m = { '<cmd>lua require("maximize").toggle()<cr>', 'toggle window maximize' },
    },
    g = {
        name = '+git',
        s = { _lazygit_toggle, 'open git window' },
        b = { '<cmd>Git blame<cr>', 'show git blame' },
        l = {
            name = '+log',
            p = { '<cmd>Git log --graph --oneline --decorate --abbrev-commit<cr>', 'show history graph' }
        }
    },
    [' '] = {
        name = "+hop",
        a = { '<cmd>HopAnywhere<cr>', 'HopAnywhere' },
        w = { '<cmd>HopWord<cr>', 'HopWord' },
        ['1'] = { '<cmd>HopChar1<cr>', 'HopChar1' },
        ['2'] = { '<cmd>HopChar2<cr>', 'HopChar2' }
    }
}
local commands       = {
    win = {
        cmake = {
            -- this only works on windows if using msvc build tools
            generateCompileCommands =
            [[ cmake -DCMAKE_TRY_COMPILE_TARGET_TYPE="STATIC_LIBRARY" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_MAKE_PROGRAM=nmake -S . -B compile_db_temp -G "Unix Makefiles" && copy compile_db_temp\compile_commands.json . && @RD /S /Q compile_db_temp ]]
        }
    }
}

local chatgpt_keymap = {
    name = "+chatgpt",
    g = { '<cmd>ChatGPT<cr>', 'Open ChatGpt' },
    G = { '<cmd>ChatGPT<cr>', 'Open ChatGpt' },
    a = { '<cmd>ChatGPTActAs<cr>', 'Open ChatPgt with prompt' },
    A = { '<cmd>ChatGPTActAs<cr>', 'Open ChatPgt with prompt' },
    e = { '<cmd>ChatGPTEditWithInstructions<cr>', 'Edit Code with GPT' },
    E = { '<cmd>ChatGPTEditWithInstructions<cr>', 'Edit Code with GPT' },
    r = {
        e = { '<cmd>ChatGPTRun explain_code<cr>', "Explain Code" },
        E = { '<cmd>ChatGPTRun explain_code<cr>', "Explain Code" },
    },
    R = {
        e = { '<cmd>ChatGPTRun explain_code<cr>', "Explain Code" },
        E = { '<cmd>ChatGPTRun explain_code<cr>', "Explain Code" }
    }
}


local backslash_keymap = {
    t = { _bash_toggle, 'Toggle the neoterm window' },
    f = { '<cmd>NvimTreeFocus<cr>', 'Toggle nvim tree' },
    w = { '<cmd>lua require("nvim-window").pick()<cr>', 'pick a window' },
    ['1'] = { '<cmd>buffer 1<cr>', 'open buffer 1' },
    ['2'] = { '<cmd>buffer 2<cr>', 'open buffer 2' },
    ['3'] = { '<cmd>buffer 3<cr>', 'open buffer 3' },
    ['4'] = { '<cmd>buffer 4<cr>', 'open buffer 4' },
    ['5'] = { '<cmd>buffer 5<cr>', 'open buffer 5' },
    ['6'] = { '<cmd>buffer 6<cr>', 'open buffer 6' },
    ['7'] = { '<cmd>buffer 7<cr>', 'open buffer 7' },
    ['8'] = { '<cmd>buffer 8<cr>', 'open buffer 8' },
    ['9'] = { '<cmd>buffer 9<cr>', 'open buffer 9' },
    o = { '<cmd>CocCommand clangd.switchSourceHeader<cr>', 'switch header source cpp' },
    [';'] = { '<cmd>CocCommand clangd.inlayHints.toggle<cr>', 'toggle clangd inlayHints' },
    s = { '<cmd>Vista coc<cr>', 'Show symbol outline' },
    ['\\'] = {
        name = "+hop",
        a = { '<cmd>HopAnywhere<cr>', 'HopAnywhere' },
        w = { '<cmd>HopWord<cr>', 'HopWord' },
        ['1'] = { '<cmd>HopChar1<cr>', 'HopChar1' },
        ['2'] = { '<cmd>HopChar2<cr>', 'HopChar2' }
    },
}

local hop_keymap = {
    name = "+hop",
    a = { '<cmd>HopAnywhere<cr>', 'HopAnywhere' },
    A = { '<cmd>HopAnywhere<cr>', 'HopAnywhere' },
    w = { '<cmd>HopWord<cr>', 'HopWord' },
    W = { '<cmd>HopWord<cr>', 'HopWord' },
    ['1'] = { '<cmd>HopChar1<cr>', 'HopChar1' },
    ['!'] = { '<cmd>HopChar1<cr>', 'HopChar1' },
    ['@'] = { '<cmd>HopChar2<cr>', 'HopChar2' },
    ['2'] = { '<cmd>HopChar2<cr>', 'HopChar2' }
}

wk.register(space_keymap, { prefix = " " })
wk.register(backslash_keymap, { prefix = "\\" })
-- wk.register( hop_keymap)

vim.cmd [[ tnoremap <esc> <c-\><c-n> ]]
vim.cmd [[ nnoremap <silent>Q <cmd>qa<cr> ]]
vim.cmd [[ nnoremap <silent><c-s> <cmd>wa!<cr> ]]
vim.cmd [[ nmap <c-/> gcc]] -- comment line
vim.cmd [[ vmap <c-/> gc]]  -- comment block
vim.cmd [[ vnoremap < <gv ]]
vim.cmd [[ vnoremap > >gv ]]

vim.cmd [[ nnoremap <c-c> "*y ]]
vim.cmd [[ vnoremap <c-c> "*y ]]

-- vim.cmd [[ nnoremap <c-d> <c-d>zz]]
-- vim.cmd [[ nnoremap <c-u> <c-u>zz]]

-- vim.cmd [[ vnoremap <c-d> <c-d>zz]]
-- vim.cmd [[ vnoremap <c-u> <c-u>zz]]
