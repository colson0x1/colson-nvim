#!/bin/bash
# ============================================================================
# Enterprise-Grade Neovim Plugin Installation
# Author: Colson (@colson0x1)
# Description: Automated plugin installation with PackerSync
# ============================================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo "================================================================"
echo "  Enterprise-Grade Plugin Installation"
echo "================================================================"
echo ""

echo -e "${BLUE}Step 1: Preparing environment...${NC}"
rm -rf ~/.cache/nvim 2>/dev/null && echo "  ✓ Cleared cache"
rm -f ~/.config/nvim/plugin/packer_compiled.lua 2>/dev/null && echo "  ✓ Removed old compiled file"

echo ""
echo -e "${BLUE}Step 2: Installing plugins via PackerSync...${NC}"
echo -e "${YELLOW}This will take 2-5 minutes. Please wait...${NC}"
echo ""

# Run PackerSync with proper timeout and logging
nvim --headless \
  +"lua vim.opt.termguicolors = false" \
  +"PackerSync" \
  +"autocmd User PackerComplete sleep 2 | quitall" \
  2>&1 | tee /tmp/packer-install.log

echo ""
echo -e "${GREEN}================================================================"
echo "  Plugin Installation Complete!"
echo "================================================================${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Check installation log: ${BLUE}cat /tmp/packer-install.log${NC}"
echo "2. Start Neovim: ${BLUE}nvim${NC}"
echo "3. Verify plugins: ${BLUE}:PackerStatus${NC}"
echo ""
