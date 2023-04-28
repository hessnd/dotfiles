local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end
local status2, cmp = pcall(require, "cmp")
if (not status2) then return end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string ' },
    javascript = { 'template_string' },
    java = false,
  },
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
})

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
