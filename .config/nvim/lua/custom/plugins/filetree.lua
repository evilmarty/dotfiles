-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup {}
    -- vim.cmd([[ nnoremap / :Neotree toggle current reveal_force_cwd<cr> ]])
    vim.cmd([[ nnoremap \| :Neotree toggle reveal<cr> ]])
    vim.cmd([[ nnoremap gd :Neotree float reveal_file=<cfile> reveal_force_cwd<cr> ]])
    vim.cmd([[ nnoremap <leader>b :Neotree toggle show buffers right<cr> ]])
    vim.cmd([[ nnoremap <leader>s :Neotree float git_status<cr> ]])
  end,
}
