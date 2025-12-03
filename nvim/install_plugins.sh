#!/bin/bash
# ============================================================================
# Colson's Neovim - Plugin Installation Script
# Author: Colson (@colson0x1)
# Description: Bootstrap lazy.nvim and install all plugins
# ============================================================================

set -e

echo "========================================"
echo "Colson's Neovim Plugin Installation"
echo "========================================"
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if nvim is installed
if ! command -v nvim &> /dev/null; then
    echo -e "${RED}✗ Neovim is not installed!${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Neovim found: $(nvim --version | head -1)${NC}"
echo ""

# Clean old installations
echo "Cleaning old plugin installations..."
rm -rf ~/.local/share/nvim/site/pack/packer 2>/dev/null && echo "  - Removed Packer plugins"
rm -rf ~/.local/share/nvim/lazy 2>/dev/null && echo "  - Removed old lazy.nvim data"
rm -rf ~/.cache/nvim 2>/dev/null && echo "  - Cleared cache"
rm -rf ~/.local/state/nvim 2>/dev/null && echo "  - Cleared state"
echo -e "${GREEN}✓ Cleanup complete${NC}"
echo ""

# Bootstrap lazy.nvim
echo "Bootstrapping lazy.nvim..."
LAZY_PATH="$HOME/.local/share/nvim/lazy/lazy.nvim"

if [ ! -d "$LAZY_PATH" ]; then
    echo "  Cloning lazy.nvim..."
    git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_PATH"
    echo -e "${GREEN}✓ lazy.nvim installed${NC}"
else
    echo -e "${YELLOW}! lazy.nvim already exists${NC}"
fi
echo ""

# Install plugins
echo "Installing plugins..."
echo "This may take a few minutes on first run..."
echo ""

nvim --headless "+Lazy! sync" "+qa" 2>&1 | grep -v "^$" || true

echo ""
echo -e "${GREEN}✓ Plugin installation complete!${NC}"
echo ""

# Install LSP servers (optional)
echo "========================================"
echo "LSP Server Installation"
echo "========================================"
echo ""
echo "To install LSP servers, start Neovim and run:"
echo "  :Mason"
echo ""
echo "Recommended servers:"
echo "  - lua_ls (Lua)"
echo "  - tsserver (TypeScript/JavaScript)"
echo "  - html (HTML)"
echo "  - cssls (CSS)"
echo "  - bashls (Bash)"
echo "  - pyright (Python)"
echo "  - gopls (Go)"
echo ""
echo "Recommended formatters:"
echo "  - prettier (JS/TS/CSS/HTML)"
echo "  - stylua (Lua)"
echo "  - eslint_d (ESLint)"
echo ""

echo -e "${GREEN}========================================"
echo "Installation Complete!"
echo "========================================${NC}"
echo ""
echo "Start Neovim with: nvim"
echo ""
