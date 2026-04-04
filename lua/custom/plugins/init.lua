-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'echasnovski/mini.bufremove',
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    event = 'VeryLazy',
    init = function()
      vim.o.showtabline = 2
    end,
    opts = {
      options = {
        mode = 'buffers',
        always_show_bufferline = true,
        close_command = function(buffer_number) require('mini.bufremove').delete(buffer_number, false) end,
        right_mouse_command = function(buffer_number) require('mini.bufremove').delete(buffer_number, false) end,
        show_buffer_icons = vim.g.have_nerd_font,
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = 'thin',
        modified_icon = '[+]',
      },
    },
  },
  {
    'echasnovski/mini.bufremove',
    version = '*',
    keys = {
      {
        '<leader>bd',
        function() require('mini.bufremove').delete(0, false) end,
        desc = '[B]uffer [D]elete',
      },
      {
        '<leader>bD',
        function() require('mini.bufremove').delete(0, true) end,
        desc = '[B]uffer [D]elete!',
      },
    },
  },
}
