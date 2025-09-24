# 💤 LazyVim

A personal Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim).

This repository contains my Neovim setup, plugins, and custom configurations.

## Prerequisites

- Neovim ≥ 0.8
- [stylua](https://github.com/JohnnyMorganz/StyLua) (formatter)
- [luacheck](https://github.com/luarocks/luacheck) (linter)
- [shellcheck](https://www.shellcheck.net/) (optional, for shell scripts)

## Installation

1. Clone this repo into your Neovim config directory:
   ```bash
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
   ```
2. Open Neovim; LazyVim will automatically install plugins and set up your environment.

## Development

### Git Hooks

This project uses a custom Git hook script in the `.githooks` directory to enforce formatting and linting on staged files. To enable it, run:

```bash
git config core.hooksPath .githooks
```

The pre-commit hook will automatically run `stylua --check`, `luacheck`, and `shellcheck` on staged Lua and shell script files.

### Manual Checks

- Format check: `stylua --check .`  
- Lint Lua: `luacheck .`  
- Lint shell scripts: `shellcheck <script>.sh`  
- Validate Neovim: `nvim --headless -u init.lua +checkhealth +qall`

## Continuous Integration

A GitHub Actions workflow (`.github/workflows/ci.yml`) runs on each push to `main`:
  - Formats: `stylua --check .`  
  - Lints: `luacheck .`  
  - Validates Neovim setup: `nvim --headless -u init.lua +checkhealth +qall`

## Customization

- Add or modify plugins in `lua/plugins/`  
- Change keymaps, options, and autocommands in `lua/config/`  
- For managing LSP servers, consider using [mason.nvim](https://github.com/williamboman/mason.nvim)
