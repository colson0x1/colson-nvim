# Colson's Enterprise-Grade Neovim Configuration

**Author:** Colson (@colson0x1)
**GitHub:** https://github.com/colson0x1/colson-nvim
**Version:** 3.0 (lazy.nvim edition)
**Neovim:** 0.11+ (verified on 0.12.x)

---

## Overview

This is the live configuration directory installed to `~/.config/nvim` by the
[`colson-nvim`](https://www.npmjs.com/package/colson-nvim) npm package.

**Full documentation — features, keybindings, installation across Linux
distros and macOS, troubleshooting — lives in the repository README:**
https://github.com/colson0x1/colson-nvim#readme

## Structure

```
.
├── init.lua                     # Entry point (delegates to lua/colson)
├── lazy-lock.json               # Exact plugin commit pins (reproducible)
├── lua/colson/
│   ├── init.lua                 # Staged boot orchestrator
│   ├── remap.lua                # Leader + keymaps (loads first)
│   ├── set.lua                  # Editor options
│   ├── startup.lua              # Startup behavior (dashboard-aware)
│   ├── lazy.lua                 # lazy.nvim bootstrap + Packer shims
│   ├── packer.lua               # LEGACY reference (not loaded)
│   └── plugins/                 # Plugin declarations by domain
│       ├── editor.lua  ├── git.lua   ├── lsp.lua
│       ├── java.lua    ├── tools.lua └── ui.lua
└── after/plugin/*.lua           # One config file per plugin
```

## Quick reference

- Plugin manager: **lazy.nvim** — `:Lazy restore` (pinned state),
  `:Lazy sync` (update). `:PackerSync` / `<leader>po` / `<leader>pac` still
  work as compatibility shims.
- Start screen: **dashboard-nvim**, DOOM layout by default —
  `:DashboardHyper` / `:DashboardDoom` / `:DashboardToggleTheme` to switch.
- Leader key: **Space**.
- LSP servers: `:Mason` (auto-detected from installed toolchains).
- Treesitter: `main` branch, parsers via `:TSUpdate`
  (requires the `tree-sitter` CLI: `npm i -g tree-sitter-cli`).

The historical `*.md` notes in this directory document past migrations and
fixes; the repository README is the canonical, current documentation.
