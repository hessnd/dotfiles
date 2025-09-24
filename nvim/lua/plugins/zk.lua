return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "snacks_picker",
      highlight = {
        additional_vim_regex_highlighting = { "markdown" },
      },
    })
  end,
}
