import os from 'os'

export const getHomeDirectory = (): string => {
  return os.homedir()
}
