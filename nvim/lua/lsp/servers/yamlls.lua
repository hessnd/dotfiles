local M = {}

M.settings = {
  yaml = {
    schemas = {
      ["https://json.schemastore.org/github-workflow.json"] = "/.github/*"
    }
  }
}

return M
