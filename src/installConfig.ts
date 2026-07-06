import fs from 'fs-extra';
import path from 'path';
import { getHomeDirectory } from './utils.js';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const NVIM_CONFIG_PATH = path.join(getHomeDirectory(), '.config', 'nvim');
// CommonJS
// const LOCAL_NVIM_CONFIG = path.join(__dirname, '..', 'nvim');
// ESNext
const LOCAL_NVIM_CONFIG = path.join(__dirname, '..', 'nvim');

/**
 * Backs up any pre-existing ~/.config/nvim before overwriting, so users can
 * always roll back: an installer that silently clobbers a personal config is
 * not production-grade. Backups are timestamped and never overwritten.
 */
const backupExistingConfig = async (): Promise<void> => {
  if (!(await fs.pathExists(NVIM_CONFIG_PATH))) {
    return;
  }

  const stamp = new Date()
    .toISOString()
    .replace(/[:.]/g, '-')
    .replace('T', '-')
    .slice(0, 19);
  const backupPath = `${NVIM_CONFIG_PATH}.backup-${stamp}`;

  console.log(`Backing up existing Neovim config to ${backupPath}`);
  await fs.copy(NVIM_CONFIG_PATH, backupPath, { overwrite: false });
};

export const installConfig = async (): Promise<void> => {
  console.log('Installing Neovim configuration...');

  await backupExistingConfig();

  // Ensure the config directory exists
  await fs.ensureDir(NVIM_CONFIG_PATH);

  // Copy the local nvim configuration files to ~/.config/nvim
  await fs.copy(LOCAL_NVIM_CONFIG, NVIM_CONFIG_PATH, {
    overwrite: true,
  });

  console.log('Neovim configuration copied to ~/.config/nvim');
};
