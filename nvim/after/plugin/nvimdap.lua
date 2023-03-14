local dap = require("dap")

-- dap.adapters.go = {
--   type = 'executable';
--   command = 'node';
--   args = '/usr/local/lib/vscode-go/dist/debugAdapter.js';
-- }

-- dap.configurations.go = {
--   {
--     type = 'go';
--     name = 'Debug';
--     request = 'launch';
--     showLog = false;
--     program = "${file}";
--     dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
--   },
-- }

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}

vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', 'dn', function() require('dap').step_over() end)
vim.keymap.set('n', 'di', function() require('dap').step_into() end)
vim.keymap.set('n', 'du', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)

require("nvim-dap-virtual-text").setup()
require("dapui").setup()
