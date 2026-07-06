import { execa } from 'execa';
import path from 'path';
import fs from 'fs-extra';
import { getHomeDirectory } from './utils.js';

/**
 * Pre-bootstraps lazy.nvim (the plugin manager) so the very first `nvim`
 * launch starts instantly instead of cloning at startup.
 *
 * This step is OPTIONAL by design: the shipped Neovim config bootstraps
 * lazy.nvim by itself (see nvim/lua/colson/lazy.lua), so a failure here is
 * never fatal - Neovim will self-heal on first launch.
 */
const LAZY_REPO = 'https://github.com/folke/lazy.nvim.git';

export const installLazy = async (): Promise<void> => {
  const lazyPath = path.join(
    getHomeDirectory(),
    '.local',
    'share',
    'nvim',
    'lazy',
    'lazy.nvim',
  );

  if (await fs.pathExists(lazyPath)) {
    console.log('lazy.nvim already installed.');
    return;
  }

  console.log('Installing lazy.nvim (plugin manager)...');

  try {
    await execa(
      'git',
      ['clone', '--filter=blob:none', '--branch=stable', LAZY_REPO, lazyPath],
      {
        stdio: 'inherit',
      },
    );
    console.log('lazy.nvim installed successfully.');
  } catch (error) {
    // Non-fatal: the Neovim config bootstraps lazy.nvim on first launch.
    console.warn(
      'Could not pre-install lazy.nvim - Neovim will bootstrap it on first launch.',
      error,
    );
  }
};
