local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end
local status2, cmp = pcall(require, "cmp")
if (not status2) then return end

autopairs.setup({
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
})

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
