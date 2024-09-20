import os from 'os';
export const getHomeDirectory = () => {
    return os.homedir();
};
