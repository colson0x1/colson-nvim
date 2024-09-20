import fs from 'fs-extra'
import path from 'path'
import { execSync } from 'child_process'
import { getHomeDirectory } from './utils'

const NVIM_CONFIG_PATH = path.join(getHomeDirectory(), '.config', 'nvim')
const LOCAL_NVIM_CONFIG = path.join(__dirname, '..', 'nvim')

export const installConfig = async (): Promise<void> => {
  console.log('Installing Neovim configuration...')

  // Ensure the config directory exists
  await fs.ensureDir(NVIM_CONFIG_PATH)

  // Copy the local nvim configuration files to ~/.config/nvim
  await fs.copy(LOCAL_NVIM_CONFIG, NVIM_CONFIG_PATH, {
    overwrite: true
  })

  console.log('Neovim configuration copied to ~/.config/nvim')
}
