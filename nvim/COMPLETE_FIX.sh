#!/bin/bash
# ============================================================================
# Complete Enterprise-Grade Neovim Fix
# Author: Colson (@colson0x1)
# Description: Comprehensive plugin installation and validation
# ============================================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${BOLD}"
echo "================================================================"
echo "  ENTERPRISE-GRADE NEOVIM COMPLETE FIX"
echo "  Distinguished Engineer Architecture"
echo "================================================================"
echo -e "${NC}"

# Step 1: Verify pynvim
echo -e "${BLUE}[1/5] Verifying Python3 provider...${NC}"
if python3 -c "import pynvim" 2>/dev/null; then
    echo -e "${GREEN}  ✓ pynvim installed${NC}"
else
    echo -e "${RED}  ✗ pynvim missing!${NC}"
    exit 1
fi

# Step 2: Clean environment
echo -e "${BLUE}[2/5] Cleaning environment...${NC}"
rm -rf ~/.cache/nvim 2>/dev/null && echo "  ✓ Cleared cache"
rm -f ~/.config/nvim/plugin/packer_compiled.lua 2>/dev/null && echo "  ✓ Removed old compiled"
rm -rf ~/.local/state/nvim/shada 2>/dev/null && echo "  ✓ Cleared shada"

# Step 3: Verify Packer is installed
echo -e "${BLUE}[3/5] Verifying Packer installation...${NC}"
if [ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
    echo -e "${GREEN}  ✓ Packer installed${NC}"
else
    echo -e "${YELLOW}  ! Installing Packer...${NC}"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    echo -e "${GREEN}  ✓ Packer installed${NC}"
fi

# Step 4: Run PackerSync
echo -e "${BLUE}[4/5] Installing plugins with PackerSync...${NC}"
echo -e "${YELLOW}  ⏳ This will take 3-5 minutes. Please wait...${NC}"
echo ""

# Use a Lua script to run PackerSync and wait for completion
cat > /tmp/packer_sync.lua << 'EOF'
-- Disable swap warning
vim.opt.swapfile = false

-- Track completion
local done = false

-- Function to exit after sync
local function finish_sync()
    done = true
    print("\n✓ PackerSync completed!\n")
    vim.defer_fn(function()
        vim.cmd("quitall!")
    end, 1000)
end

-- Run PackerSync
vim.cmd("PackerSync")

-- Wait for completion
vim.api.nvim_create_autocmd("User", {
    pattern = "PackerComplete",
    callback = function()
        finish_sync()
    end,
})

-- Timeout after 10 minutes
vim.defer_fn(function()
    if not done then
        print("\n⚠ Timeout reached\n")
        vim.cmd("quitall!")
    end
end, 600000)
EOF

nvim --headless -u /tmp/packer_sync.lua 2>&1 | tee /tmp/packer-install.log

# Step 5: Verify installation
echo ""
echo -e "${BLUE}[5/5] Verifying installation...${NC}"
PLUGIN_COUNT=$(find ~/.local/share/nvim/site/pack/packer/start/ -maxdepth 1 -type d 2>/dev/null | wc -l)
echo -e "  📦 Plugins installed: ${GREEN}$((PLUGIN_COUNT - 1))${NC}"

echo ""
if [ $PLUGIN_COUNT -gt 10 ]; then
    echo -e "${GREEN}================================================================"
    echo "  ✓ INSTALLATION SUCCESSFUL!"
    echo "================================================================${NC}"
    echo ""
    echo -e "${BOLD}Next Steps:${NC}"
    echo "1. ${BLUE}nvim${NC} - Start Neovim"
    echo "2. ${BLUE}:checkhealth${NC} - Verify health"
    echo "3. ${BLUE}:Mason${NC} - Install LSP servers"
else
    echo -e "${YELLOW}================================================================"
    echo "  ⚠ Only $((PLUGIN_COUNT - 1)) plugins found"
    echo "================================================================${NC}"
    echo ""
    echo "Check log: ${BLUE}cat /tmp/packer-install.log${NC}"
fi

echo ""
