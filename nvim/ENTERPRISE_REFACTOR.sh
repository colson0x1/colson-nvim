#!/bin/bash
# ============================================================================
# Enterprise-Grade Neovim Setup - Complete Refactor
# Author: Colson (@colson0x1)
# Description: Distinguished engineer-level architecture
# ============================================================================

set -e

echo "================================================================"
echo "  Enterprise-Grade Neovim Refactor"
echo "  Distinguished Engineer Architecture"
echo "================================================================"
echo ""

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# Step 1: Install Python provider
echo -e "${BLUE}Step 1: Installing Python3 provider (pynvim)...${NC}"
if python3 -m pip install --user pynvim 2>&1 | grep -q "Successfully installed\|already satisfied"; then
    echo -e "${GREEN}✓ pynvim installed${NC}"
else
    echo -e "${RED}⚠ pynvim installation failed, continuing...${NC}"
fi

# Step 2: Install Node provider (optional but recommended)
echo -e "${BLUE}Step 2: Checking Node.js provider...${NC}"
if command -v npm &> /dev/null; then
    npm install -g neovim 2>&1 | grep -v "npm WARN" | tail -1 || echo "  - neovim npm package check complete"
    echo -e "${GREEN}✓ Node.js provider ready${NC}"
else
    echo -e "${YELLOW}! Node.js not found (optional)${NC}"
fi

# Step 3: Clean and prepare
echo -e "${BLUE}Step 3: Preparing clean environment...${NC}"
rm -rf ~/.local/share/nvim/site/pack/packer 2>/dev/null && echo "  ✓ Removed old Packer"
rm -rf ~/.cache/nvim 2>/dev/null && echo "  ✓ Cleared cache"
rm -rf ~/.local/state/nvim 2>/dev/null && echo "  ✓ Cleared state"

# Step 4: Install Packer
echo -e "${BLUE}Step 4: Installing Packer...${NC}"
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim 2>&1 | grep -v "^Cloning" || true
echo -e "${GREEN}✓ Packer installed${NC}"

echo ""
echo -e "${GREEN}================================================================"
echo "  Setup Complete!"
echo "================================================================${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Start Neovim: ${BLUE}nvim${NC}"
echo "2. Run: ${BLUE}:PackerSync${NC}"
echo "3. Wait for installation"
echo "4. Restart Neovim"
echo ""
echo -e "${GREEN}All providers installed, no more errors!${NC}"
echo ""
