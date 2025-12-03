# Colson's Enterprise-Grade Neovim Configuration

**Author:** Colson (@colson0x1)
**GitHub:** https://github.com/colson0x1
**Version:** 2.0.0
**Neovim:** 0.11.x+

---

## Overview

This is a **production-ready, enterprise-grade** Neovim configuration built with the same standards used at Google, Meta, and Amazon. It features:

- 🚀 **Zero errors on startup** - Comprehensive error handling
- ⚡ **Blazing fast** - Optimized with lazy-loading
- 🔧 **Highly modular** - Easy to customize and extend
- 🛡️ **Future-proof** - Compatible with Neovim 0.11.x and beyond
- 📦 **Complete tooling** - LSP, formatters, linters, Git, and more
- 🎨 **Beautiful UI** - Multiple themes with Lualine statusline
- 🔑 **Intuitive keybindings** - Carefully crafted for productivity

---

## Features

### Core Capabilities

- **LSP Integration** - Full Language Server Protocol support with auto-detection
- **Autocompletion** - Intelligent code completion with nvim-cmp
- **Fuzzy Finding** - Telescope for files, grep, symbols, and more
- **Syntax Highlighting** - Tree-sitter powered highlighting
- **Git Integration** - Fugitive, Diffview, and conflict resolution
- **File Explorer** - NvimTree with custom keybindings
- **Formatting/Linting** - none-ls (maintained null-ls fork)
- **Snippets** - React, JavaScript, TypeScript snippets
- **AI Assistants** - GitHub Copilot and Augment
- **Discord RPC** - Show what you're coding in Discord

### Language Support

- **TypeScript/JavaScript** - Dedicated TypeScript Tools
- **Python** - Pyright LSP
- **Go** - gopls with full tooling
- **Rust** - rust-analyzer
- **Lua** - lua_ls with Neovim integration
- **Web** - HTML, CSS, SCSS, Tailwind
- **DevOps** - Docker, Terraform, YAML
- **And many more...**

### Developer Tools

- **HTTP Client** - REST API testing with Resty
- **Live Server** - Web development server
- **Markdown Preview** - Real-time preview in browser
- **Image Preview** - Terminal image viewing with Chafa
- **Undo Tree** - Visual undo history
- **Auto-save** - Smart file auto-saving

---

## Installation

### Prerequisites

1. **Neovim 0.10.0+** (0.11.x recommended)
   ```bash
   nvim --version
   ```

2. **Git**
   ```bash
   git --version
   ```

3. **Node.js** (for LSP servers)
   ```bash
   node --version
   ```

4. **Ripgrep** (for Telescope)
   ```bash
   # Arch Linux
   sudo pacman -S ripgrep

   # Ubuntu/Debian
   sudo apt install ripgrep

   # macOS
   brew install ripgrep
   ```

5. **Optional: C compiler** (for some plugins)
   ```bash
   # Arch Linux
   sudo pacman -S base-devel

   # Ubuntu/Debian
   sudo apt install build-essential
   ```

### Quick Start

1. **Clone or copy this configuration** to `~/.config/nvim/`

2. **Launch Neovim**
   ```bash
   nvim
   ```

3. **Wait for plugins to install**
   - lazy.nvim will auto-install
   - Plugins will download automatically
   - This may take a few minutes

4. **Install LSP servers**
   ```vim
   :Mason
   ```
   Install the servers you need (lua_ls, tsserver, etc.)

5. **Install formatters**
   ```vim
   :Mason
   ```
   Install prettier, stylua, eslint_d, etc.

6. **Restart Neovim** and enjoy!

---

## Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── README.md                   # This file
├── MIGRATION_GUIDE.md          # Migration from old config
│
├── lua/colson/
│   ├── core/                   # Core configuration
│   │   ├── init.lua            # Core module with safe loading
│   │   ├── options.lua         # Neovim options
│   │   ├── keymaps.lua         # Core keybindings
│   │   ├── autocmds.lua        # Autocommands
│   │   └── startup.lua         # Startup behavior
│   │
│   └── plugins/                # Plugin ecosystem
│       ├── init.lua            # lazy.nvim plugin manager
│       ├── telescope.lua       # Fuzzy finder
│       ├── lsp/                # LSP configuration
│       ├── treesitter.lua      # Syntax highlighting
│       ├── none-ls.lua         # Formatting/linting
│       ├── nvim-tree.lua       # File explorer
│       ├── lualine.lua         # Status line
│       ├── typescript-tools.lua # TypeScript engine
│       ├── themes/             # Color schemes
│       └── [... 30+ plugin configs]
```

---

## Key Bindings

Leader key: `<Space>`

### File Operations

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>w` | Save all files |
| `<leader>q` | Save all and quit |
| `<leader>pv` | Open netrw explorer |

### Telescope Fuzzy Finder

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Search help tags |
| `<leader>fd` | Find diagnostics |
| `<leader>fw` | Workspace symbols |
| `<leader>fr` | LSP references |
| `<leader>gs` | Git status |
| `<leader>gc` | Git commits |
| `<leader>gb` | Git branches |

### LSP (Language Server)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<leader>vd` | Show diagnostics float |
| `[d` | Next diagnostic |
| `]d` | Previous diagnostic |
| `<leader>vca` | Code actions |
| `<leader>vrr` | Find references |
| `<leader>vrn` | Rename symbol |
| `<C-h>` | Signature help (insert mode) |
| `<leader>f` | Format buffer |

### TypeScript Tools

| Key | Action |
|-----|--------|
| `<leader>oi` | Organize imports |
| `<leader>si` | Sort imports |
| `<leader>ri` | Remove unused imports |
| `<leader>ai` | Add missing imports |
| `<leader>fe` | Fix all errors |
| `<leader>rn` | Rename file |
| `<leader>fr` | Find file references |

### Git Operations

| Key | Action |
|-----|--------|
| `<leader>gg` | Git status (Fugitive) |
| `<leader>gp` | Git push |
| `<leader>gP` | Git pull |
| `<leader>do` | Open diff view |
| `<leader>dc` | Close diff view |
| `<leader>co` | Choose ours (conflict) |
| `<leader>ct` | Choose theirs (conflict) |
| `<leader>cn` | Next conflict |
| `<leader>cp` | Previous conflict |

### Navigation

| Key | Action |
|-----|--------|
| `<C-d>` | Half page down (centered) |
| `<C-u>` | Half page up (centered) |
| `n` | Next search result (centered) |
| `N` | Previous search result (centered) |
| `J` (visual) | Move selection down |
| `K` (visual) | Move selection up |

### Window Management

| Key | Action |
|-----|--------|
| `<leader>+` | Increase window width |
| `<leader>-` | Decrease window width |
| `<leader>ww` | Show current window width |

### Utility

| Key | Action |
|-----|--------|
| `<leader>u` | Toggle undo tree |
| `<leader>s` | Replace word under cursor |
| `<leader>x` | Make file executable |
| `<leader><leader>` | Source current file |
| `<leader>y` | Yank to system clipboard |
| `<leader>p` | Paste without yanking |

**See [MIGRATION_GUIDE.md](./MIGRATION_GUIDE.md) for complete keybinding reference.**

---

## Customization

### Change Color Scheme

Edit `lua/colson/plugins/init.lua` and uncomment your preferred theme:

```lua
-- Available themes:
-- Tokyo Night (active)
-- GitHub Themes
-- Catppuccin
-- Rose Pine
-- JetBrains Darcula
-- Moonfly
-- Nord
-- One Dark Pro
```

### Enable/Disable Plugins

In `lua/colson/plugins/init.lua`, comment/uncomment plugins:

```lua
-- To disable:
--[[
{
  "plugin/name",
  config = function() ... end,
},
--]]

-- To enable:
{
  "plugin/name",
  config = function() ... end,
},
```

### Adjust Options

Edit `lua/colson/core/options.lua`:

```lua
-- Tab width
vim.opt.tabstop = 2        -- Change to 4 for Java/Python

-- Line numbers
vim.opt.relativenumber = true  -- Set to false to disable

-- Wrap
vim.opt.wrap = false       -- Set to true to enable line wrapping
```

### Custom Keybindings

Add to `lua/colson/core/keymaps.lua`:

```lua
-- Example: Map Ctrl+s to save
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
```

---

## Plugin Management

### lazy.nvim Commands

| Command | Action |
|---------|--------|
| `:Lazy` | Open lazy.nvim UI |
| `:Lazy sync` | Install/update/clean plugins |
| `:Lazy update` | Update plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy profile` | Show startup profiling |

### Mason Commands

| Command | Action |
|---------|--------|
| `:Mason` | Open Mason UI |
| `:MasonInstall <package>` | Install a package |
| `:MasonUninstall <package>` | Remove a package |
| `:MasonUpdate` | Update all packages |

---

## Included Plugins

### Core
- **lazy.nvim** - Modern plugin manager
- **plenary.nvim** - Lua utilities

### UI
- **lualine.nvim** - Beautiful statusline
- **nvim-web-devicons** - File icons
- **indentLine** - Indent guides
- **nvim-colorizer.lua** - Color preview
- **bufferline.nvim** - Buffer tabs (optional)

### Navigation
- **telescope.nvim** - Fuzzy finder
- **nvim-tree.lua** - File explorer
- **harpoon** - Quick file marks
- **vim-tmux-navigator** - Tmux integration

### LSP & Completion
- **lsp-zero.nvim** - LSP configuration framework
- **nvim-lspconfig** - LSP configs
- **mason.nvim** - LSP/tool installer
- **nvim-cmp** - Autocompletion
- **LuaSnip** - Snippet engine

### Editing
- **nvim-treesitter** - Syntax highlighting
- **Comment.nvim** - Smart commenting
- **nvim-autopairs** - Auto-close pairs
- **autosave.nvim** - Auto-save files
- **vim-matchtag** - HTML tag matching

### Git
- **vim-fugitive** - Git commands
- **diffview.nvim** - Diff viewer
- **git-conflict.nvim** - Conflict resolution

### Development Tools
- **typescript-tools.nvim** - TypeScript engine
- **none-ls.nvim** - Formatting/linting
- **resty.nvim** - HTTP/REST client
- **live-server.nvim** - Live preview server
- **markdown-preview.nvim** - Markdown preview
- **emmet-vim** - HTML/CSS expansion

### AI Assistants
- **copilot.vim** - GitHub Copilot
- **augment.vim** - Augment AI

### Utilities
- **undotree** - Undo history
- **nvim-pqf** - Quickfix enhancements
- **neocord** - Discord presence

**See `lua/colson/plugins/init.lua` for the complete list.**

---

## Performance

This configuration is optimized for speed:

- **Lazy loading** - Plugins load only when needed
- **Disabled built-ins** - Unused Neovim plugins disabled
- **Optimized runtime** - Minimal startup time
- **Smart caching** - lazy.nvim caching enabled

Typical startup time: **< 50ms** (after initial install)

---

## Troubleshooting

### General Issues

1. **Check health**
   ```vim
   :checkhealth
   ```

2. **View messages**
   ```vim
   :messages
   ```

3. **Check plugin status**
   ```vim
   :Lazy
   ```

4. **Check LSP status**
   ```vim
   :LspInfo
   ```

### Common Solutions

**Plugins not loading:**
```bash
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.cache/nvim
```

**LSP not working:**
```vim
:Mason
```
Install required language servers

**Telescope errors:**
Install ripgrep (see Prerequisites)

---

## Contributing

Found an issue or have an improvement? Open an issue or PR on GitHub!

---

## License

This configuration is provided as-is for personal and educational use.

---

## Acknowledgments

- ThePrimeagen for inspiration
- TJ DeVries for Neovim insights
- The Neovim community for amazing plugins

---

**Built with ❤️ by Colson** | **Refactored to enterprise standards**
