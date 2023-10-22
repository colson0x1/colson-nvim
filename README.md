# Neovim Configuration by COLSON!

Welcome to my Neovim (nvim) configuration! This comprehensive guide will walk you through the extensive list of features, plugins, and key bindings in my Neovim setup. I've curated this configuration to provide you with a highly efficient, productive, and visually pleasing Neovim experience.

**Please Note**: This documentation will cover all the plugins, key bindings, and themes, but feel free to customize and tailor the configuration to your liking.

**Cool Thing**: I will keep adding more features and plugins, so this repository will remain lively! 🔥

## Table of Contents
- [Neovim Configuration by COLSON!](#neovim-configuration-by-colson)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Features](#features)
    - [Global Key Bindings](#global-key-bindings)
      - [Leader Key](#leader-key)
      - [File Explorer](#file-explorer)
      - [Collaborative Editing](#collaborative-editing)
      - [Text Manipulation](#text-manipulation)
      - [Code Formatting](#code-formatting)
      - [Navigation](#navigation)
      - [Search and Replace](#search-and-replace)
      - [Miscellaneous](#miscellaneous)
    - [Normal Mode Key Bindings](#normal-mode-key-bindings)
      - [Line Manipulation](#line-manipulation)
      - [Scrolling](#scrolling)
      - [Code Navigation](#code-navigation)
      - [Ex Mode](#ex-mode)
      - [Git Integration](#git-integration)
      - [Harpoon Integration](#harpoon-integration)
      - [LSP Integration](#lsp-integration)
    - [Telescope Integration](#telescope-integration)
    - [Cool Themes](#cool-themes)

## Introduction<a name="introduction"></a>

This Neovim configuration is a powerhouse of productivity enhancements and aesthetics. I've put together a selection of plugins, key bindings, and themes that cater to a wide range of programming and text-editing needs. Whether you're a developer, a writer, or anyone in need of a versatile text editor, this setup has got you covered.

## Installation<a name="installation"></a>

To get started with my Neovim configuration, follow these steps:

1. Clone this repository to your Neovim configuration directory:
   ```shell
   git clone https://github.com/colson0x1/nvim ~/.config/nvim
   ```

2. Install Packer.nvim for managing plugins:
   ```shell
   git clone https://github.com/wbthomason/packer.nvim \
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

3. Launch Neovim and run `:PackerSync` to install and update plugins.

Now, you're all set to unleash the power of this Neovim configuration!

## Features<a name="features"></a>

### Global Key Bindings<a name="global-key-bindings"></a>

#### Leader Key
- **`<Space>`** serves as the leader key for most key bindings.

#### File Explorer
- **`<leader>pv`**: Open a file explorer with Telescope.

#### Collaborative Editing
- **`<leader>vwm`**: Start a Vim-With-Me collaborative editing session.
- **`<leader>svwm`**: Stop a Vim-With-Me collaborative editing session.

#### Text Manipulation
- **`<leader>p`**: Delete selected text in visual mode.
- **`<leader>y`**: Yank text to the system clipboard.
- **`<leader>Y`**: Yank the entire line to the system clipboard.
- **`<leader>d`**: Delete text without clobbering the register.
- **`<C-c>`**: Exit insert mode.

#### Code Formatting
- **`<leader>f`**: Format code using LSP (Language Server Protocol).

#### Navigation
- **`<C-k>`** and **`<C-j>`**: Navigate through the quickfix list.
- **`<leader>k`** and **`<leader>j`**: Navigate through the location list.

#### Search and Replace
- **`<leader>s`**: Search and replace with confirmation.
- **`<leader>x`**: Make the current file executable.

#### Miscellaneous
- **`<leader>vpp`**: Open Packer configuration file.
- **`<leader>mr`**: Run a command to make it rain (experimental).
- **`<leader><leader>`**: Source the init.lua file.

### Normal Mode Key Bindings

#### Line Manipulation
- **`J`** and **`K`**: Reorder lines in visual mode.
- **`J`**: Join lines and move the cursor to the end.

#### Scrolling
- **`<C-d>`** and **`<C-u>`**: Scroll down/up, keeping the cursor in place.

#### Code Navigation
- **`n`** and **`N`**: Jump to the next/previous search result, centering the screen.

#### Ex Mode
- **`Q`**: Disable Ex mode (no operation).

#### Git Integration
- **`<leader>gs`**: Run Git commands.

#### Harpoon Integration
- **`<leader>a`**: Mark the current file.
- **`<C-e>`**: Toggle Harpoon quick menu.
- **`<C-h>`, `<C-t>`, `<C-n>`, `<C-s>`: Navigate Harpoon marked files.

#### LSP Integration<a name="lsp-language-server-protocol"></a>
- **`gd`**: Go to definition.
- **`K`**: Show hover information.
- **`<leader>vws`**: Search for symbols in the workspace.
- **`<leader>vd`**: Open LSP diagnostic float window.
- **`[d`** and **`]d`**: Navigate through diagnostics.
- **`<leader>vca`**: Execute code actions.
- **`<leader>vrr`**: Find references.
- **`<leader>vrn`**: Rename symbol.
- **`<C-h>`**: Show signature help.

### Telescope Integration<a name="telescope"></a>
- **`<leader>pf`**: Find files in the current directory.
- **`<C-p`**: Search for Git files.
- **`<leader>ps`**: Grep for a specific string in the files.

### Cool Themes<a name="cool-themes"></a>

You can choose from several beautiful themes to customize your Neovim experience:

- **Tokyo Night Theme**: Activate with the following configuration:
   ```lua
   use({
      "folke/tokyonight.nvim",
      as = "tokyonight",
      config = function()
         vim.cmd("colorscheme tokyonight")
      end,
   })
   ```

My configuration also supports other themes like **Catppuccin**, **Rose Pine**, and **JetBrains IDE Theme**, though they are currently commented out. You can enable these themes by uncommenting the respective configuration blocks located at the bottom in the `packer.lua` file.

Now you're ready to embark on your coding journey with Neovim, utilizing this highly customizable and powerful configuration. Enjoy an enhanced coding experience! 🚀