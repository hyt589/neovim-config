if vim.fn.has('win32') or vim.fn.has('win64') then
  vim.g.neoterm_shell = 'powershell.exe'
end
vim.g.neoterm_default_mod = 'botright'
vim.g.neoterm_autoinsert = 1
vim.g.neoterm_size = 15

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

