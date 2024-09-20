import { execa } from 'execa';
import path from 'path';
import fs from 'fs-extra';
import { getHomeDirectory } from './utils.js';
const PACKER_INSTALL_COMMAND = 'git clone --depth 1 https://github.com/wbthomason/packer.nvim';
export const installPacker = async () => {
    const packerPath = path.join(getHomeDirectory(), '.local', 'share', 'nvim', 'site', 'pack', 'packer', 'start', 'packer.nvim');
    if (await fs.pathExists(packerPath)) {
        console.log('Packer.nvim already installed.');
        return;
    }
    console.log('Installing Packer.nvim...');
    try {
        await execa('git', [
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            packerPath,
        ], {
            stdio: 'inherit',
        });
        console.log('Packer.nvim installed successfully.');
    }
    catch (error) {
        console.error('Failed to install Packer.nvim:', error);
        throw error;
    }
};
