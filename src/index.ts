import { installConfig } from './installConfig';
import { installPacker } from './installPacker';

const greetUser = (): void => {
  const greeting = `
  \x1b[1;34mWelcome to \x1b[1;32mCOLSON NVIM 💎\x1b[0m
  \x1b[1;35mBlazingly Fast Fullstack IDE by COLSON 🚀\x1b[0m

  \x1b[1;37mVisit the official repository for more information:
  https://github.com/colson0x1/nvim\x1b[0m

  \x1b[1;33mEmpowering Software Engineers with robust tools for impactful coding experience! 🔥\x1b[0m
  `;
  console.log(greeting);
};

(async () => {
  greetUser();
  try {
    await installConfig();
    await installPacker();
    console.log('Neovim configuration installed successfully!');
  } catch (error) {
    console.error('Failed to install Neovim configuration:', error);
  }
})();
