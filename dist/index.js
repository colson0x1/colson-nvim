#!/usr/bin/env node
import { installConfig } from './installConfig.js';
import { installPacker } from './installPacker.js';
const greetUser = () => {
    // \x1b[1;34mWelcome to \x1b[1;32mCOLSON NVIM 💎\x1b[0m
    const greeting = `
  \x1b[1;34m@ Introducing \x1b[38;5;32mCOLSON NVIM 💎\x1b[0m
  \x1b[1;35mBlazingly Fast Fullstack Code Editor/IDE for Software Engineers 🚀\x1b[0m
  \x1b[38;5;214mAuthor: Colson\x1b[0m

  \x1b[1;37mVisit the official repository for more information:
  https://github.com/colson0x1/nvim\x1b[0m

  \x1b[1;33mEmpowering Software Engineers with cutting-edge tools for a transformative coding experience! \x1b[0m
  `;
    console.log(greeting);
};
(async () => {
    greetUser();
    try {
        await installConfig();
        await installPacker();
        console.log('Neovim configuration installed successfully!');
    }
    catch (error) {
        console.error('Failed to install Neovim configuration:', error);
    }
})();
