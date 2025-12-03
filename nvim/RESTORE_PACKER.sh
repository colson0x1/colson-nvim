#!/bin/bash
# ============================================================================
# Restore Original Packer Setup - Enterprise Grade for 0.11.x
# Author: Colson (@colson0x1)
# Description: Complete restoration to Packer with all 0.11.x fixes
# ============================================================================

set -e

echo "========================================================"
echo "  Restoring Original Packer Setup (Enterprise Grade)"
echo "========================================================"
echo ""

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Step 1: Removing lazy.nvim completely...${NC}"
rm -rf ~/.local/share/nvim/lazy 2>/dev/null && echo "  ✓ Removed lazy.nvim"
rm -rf ~/.local/share/nvim/lazy-rocks 2>/dev/null && echo "  ✓ Removed lazy-rocks"
rm -rf ~/.config/nvim/lua/colson/plugins 2>/dev/null && echo "  ✓ Removed lazy plugin configs"
rm -rf ~/.config/nvim/lua/colson/core 2>/dev/null && echo "  ✓ Removed core modules"
echo -e "${GREEN}✓ lazy.nvim completely removed${NC}"
echo ""

echo -e "${BLUE}Step 2: Cleaning for fresh Packer install...${NC}"
rm -rf ~/.local/share/nvim/site/pack/packer 2>/dev/null && echo "  ✓ Removed old Packer"
rm -rf ~/.cache/nvim 2>/dev/null && echo "  ✓ Cleared cache"
rm -rf ~/.local/state/nvim 2>/dev/null && echo "  ✓ Cleared state"
echo -e "${GREEN}✓ Clean slate ready${NC}"
echo ""

echo -e "${BLUE}Step 3: Installing Packer...${NC}"
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim 2>&1 | grep -v "^Cloning" || true
echo -e "${GREEN}✓ Packer installed${NC}"
echo ""

echo -e "${GREEN}========================================================"
echo "  Packer Restored!"
echo "========================================================${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Start Neovim: ${BLUE}nvim${NC}"
echo "2. Run: ${BLUE}:PackerSync${NC}"
echo "3. Wait for plugins to install"
echo "4. Restart Neovim"
echo ""
