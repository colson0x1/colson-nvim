# Neovim Configuration by COLSON!

Welcome to my Neovim (nvim) configuration! This docs will guide you through the key bindings, features, and the usefulness of my setup. This configuration is aimed at providing a highly productive and efficient Neovim experience.

Cool Thing: I will keep adding more features so this repo will be lively! 🔥

## Table of Contents
1. [Key Bindings](#key-bindings)
2. [Cool Features](#cool-features)
3. [Usage](#usage)

## Key Bindings<a name="key-bindings"></a>

### Global Key Bindings
- `<Space>` as the leader key.
- `<leader>pv`: Open a file explorer with Telescope.
- `<leader>vwm`: Start Vim-With-Me collaborative editing session.
- `<leader>svwm`: Stop Vim-With-Me collaborative editing session.
- `<leader>p`: Delete selected text in visual mode.
- `<leader>y`: Yank text to system clipboard.
- `<leader>Y`: Yank the entire line to system clipboard.
- `<leader>d`: Delete text without clobbering the register.
- `<C-c>`: Exit insert mode.
- `<leader>f`: Format code using LSP (Language Server Protocol).
- `<C-k>` and `<C-j>`: Navigate through quickfix list.
- `<leader>k>` and `<leader>j>`: Navigate through location list.
- `<leader>s`: Search and replace with confirmation.
- `<leader>x`: Make the current file executable.
- `<leader>vpp`: Open Packer configuration file.
- `<leader>mr`: Run a command to make it rain (experimental).

### Normal Mode Key Bindings
- `J` and `K`: Reorder lines in visual mode.
- `J`: Join lines and move cursor to the end.
- `<C-d>` and `<C-u>`: Scroll down/up, keeping the cursor in place.
- `n` and `N`: Jump to the next/previous search result, centering the screen.
- `Q`: Disable Ex mode (no operation).
- `<C-f>`: Split the current terminal into a new tmux session.
- `<leader><leader>`: Source the init.lua file.

### Git Key Bindings
- `<leader>gs`: Run Git commands.

### Harpoon Key Bindings
- `<leader>a`: Mark the current file.
- `<C-e>`: Toggle Harpoon quick menu.
- `<C-h>`, `<C-t>`, `<C-n>`, `<C-s>`: Navigate Harpoon marked files.

### LSP Key Bindings
- `gd`: Go to definition.
- `K`: Show hover information.
- `<leader>vws`: Search for symbols in the workspace.
- `<leader>vd`: Open LSP diagnostic float window.
- `[d` and `]d`: Navigate through diagnostics.
- `<leader>vca`: Execute code actions.
- `<leader>vrr`: Find references.
- `<leader>vrn`: Rename symbol.
- `<C-h>`: Show signature help.

### Telescope Key Bindings
- `<leader>pf`: Find files in the current directory.
- `<C-p>`: Search for Git files.
- `<leader>ps`: Grep for a specific string in the files.

## Cool Features<a name="cool-features"></a>

### Package Management
- Using Packer.nvim to manage plugins, with automatic installation and updates.

### Colorscheme
- Utilizing the beautiful "catppuccin" colorscheme with various styles and options to customize your experience.

### Presence
- Integration with Discord's Rich Presence feature to show what you're working on.

### Treesitter
- Enhanced syntax highlighting and code analysis for various languages.

### UndoTree
- Visualize and manage your undo history with ease.

### Harpoon
- Bookmark and navigate between your frequently used files.

### LSP Integration
- Seamless integration with the Language Server Protocol for advanced code analysis and editing.

## Usage<a name="usage"></a>

1. Clone this repository to your Neovim configuration directory.
   ```shell
   git clone https://github.com/colson0x1/nvim ~/.config/nvim
   ```

2. Install Packer.nvim for managing plugins.
   ```shell
   git clone https://github.com/wbthomason/packer.nvim \
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

3. Launch Neovim and run `:PackerSync` to install and update plugins.

4. Explore the provided key bindings to boost your productivity.

This Neovim configuration is designed for a rich coding experience and is highly customizable. Feel free to modify and adapt it to your own preferences.

Enjoy your coding journey with Neovim! 🚀