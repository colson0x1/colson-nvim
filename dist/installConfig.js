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
export const installConfig = async () => {
    console.log('Installing Neovim configuration...');
    // Ensure the config directory exists
    await fs.ensureDir(NVIM_CONFIG_PATH);
    // Copy the local nvim configuration files to ~/.config/nvim
    await fs.copy(LOCAL_NVIM_CONFIG, NVIM_CONFIG_PATH, {
        overwrite: true,
    });
    console.log('Neovim configuration copied to ~/.config/nvim');
};
