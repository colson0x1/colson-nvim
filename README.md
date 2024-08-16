<div align="center">
<h1>
FullStack Neovim IDE by COLSON! 🚀
</h1>
<h2>Neovim IDE for TypeScript/JavaScript Software Engineers</h2>
<h3>Supports dozen different programming languages and technologies + DevOps Workflows (Kubernetes, Docker, Terraform and more)</h3>
<h2>🎯 Blazingly Fast as compared to VSCode and WebStorm 🔥</h2>

[![](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=for-the-badge&color=000F10&logo=Neovim&logoColor=green&labelColor=302D41)](https://github.com/colson0x1/nvim)

</div>

Step into the realm of excellence with my world-class Neovim (nvim) configuration! This comprehensive guide unveils a meticulously crafted zenful setup, meticulously designed for unparalleled efficiency, productivity, and visual splendor within Neovim.

Embark on a journey through a domain enriched with powerful features, plugins, and finely tuned key bindings, addressing a diverse range of coding/text-editing requirements. Welcome to a sublime Neovim experience tailored to elevate your coding endeavors to new heights! 🔥

**DEMO Screenshot**

## ✨ New Updated Zenful Look (COLSON NVIM)

## @ Neovim on Arch Linux

### Latest Fresh Look, July 2024 :)

![colson nvim](https://i.imgur.com/7davwV7.png)

![colson nvim](https://i.imgur.com/7V5XbMg.png)

![colson nvim](https://i.imgur.com/Xc3GtfT.png)

![colson nvim](https://i.imgur.com/pijyyi5.png)

![colson nvim](https://camo.githubusercontent.com/5c4cc76f4d149f2461e9d940bcdf1e525608a9bfe4051a369a725d276554816d/68747470733a2f2f692e696d6775722e636f6d2f755557666753302e706e67)

![colson nvim](https://camo.githubusercontent.com/f3483c209874c38d58ebbdc960f9219c05ba8099cf8422e5ddcd47c0ee2c6cb3/68747470733a2f2f692e696d6775722e636f6d2f333363686c55702e706e67)

![colson nvim](https://camo.githubusercontent.com/f0a88816cb1dad274d216215ca20bcdb0028b6e85c36fd4dcbdd24a3a88e58bc/68747470733a2f2f692e696d6775722e636f6d2f437a67434449742e706e67)

![colson nvim](https://camo.githubusercontent.com/44df6b18f09ec8eaaefae6c7d0522397b4153ce745d17ef59ffdfba4b9d24106/68747470733a2f2f692e696d6775722e636f6d2f6446474b4668442e706e67)

![colson nvim](https://i.imgur.com/NfBt78o.png)

---

## @ Neovim on macOS

### 2023/Early 2024 Look

![colson nvim](https://i.imgur.com/zPUZ8lo.png)

![colson nvim](https://i.imgur.com/ZssRfKy.png)

![colson nvim](https://i.imgur.com/uCgbasi.png)

![colson nvim](https://i.imgur.com/r4kWoOM.png)

![colson nvim](https://i.imgur.com/cpzqjmT.png)

## 🔥 Discord Presence for Neovim

![colson nvim](https://i.imgur.com/2vCNJ0w.png)

## ❕ Keeping Your Configuration Up-to-Date

I'm committed to consistently enhancing this Neovim setup with new features, optimizations, and additional plugins. To ensure you're making the most out of this dynamic configuration, I recommend checking for updates monthly!

As the configuration evolves, it's a good practice to sync your local repository with the latest changes. To do this, navigate to your Neovim configuration directory and run the following command:

```bash
cd ~/.config/nvim
git pull origin main
```

## **Prerequisites: Neovim 0.9.0 or Higher**

Ensure a seamless experience by confirming your Neovim version meets the requirements. Execute the following command to check your Neovim version:

```bash
nvim --version
```

Upgrade to Neovim 0.9.0 or higher if needed, and dive into an enhanced coding experience with this dynamic configuration! 🚀

## Table of Contents

- [✨ New Updated Zenful Look (COLSON NVIM)](#-new-updated-zenful-look-colson-nvim)
- [🔥 Discord Presence for Neovim](#-discord-presence-for-neovim)
- [❕ Keeping Your Configuration Up-to-Date](#-keeping-your-configuration-up-to-date)
- [**Prerequisites: Neovim 0.9.0 or Higher**](#prerequisites-neovim-090-or-higher)
- [Table of Contents](#table-of-contents)
- [Introduction](#introduction)
  - [💎 Old Look (COLSON NVIM)](#-old-look-colson-nvim)
- [Installation](#installation)
- [Features](#features)
  - [Global Key Bindings](#global-key-bindings)
    - [Leader Key](#leader-key)
    - [Netrw: File Explorer](#netrw-file-explorer)
    - [NvimTree (Left window pane file explorer)](#nvimtree-left-window-pane-file-explorer)
    - [Collaborative Editing](#collaborative-editing)
    - [Text Manipulation](#text-manipulation)
    - [Code Formatting](#code-formatting)
    - [Navigation](#navigation)
    - [](#)
    - [Miscellaneous](#miscellaneous)
  - [Normal Mode Key Bindings](#normal-mode-key-bindings)
    - [Line Manipulation](#line-manipulation)
    - [Scrolling](#scrolling)
    - [Code Navigation](#code-navigation)
    - [Ex Mode](#ex-mode)
    - [Git Integration](#git-integration)
    - [Harpoon Integration](#harpoon-integration)
    - [LSP Integration](#lsp-integration)
  - [**Telescope** Integration](#telescope-integration)
  - [TELESCOPE GREP Search](#telescope-grep-search)
- [🔥 NEW UPDATES](#-new-updates)
  - [**Bufferline**](#bufferline)
  - [**JSX/TSX \& Other Languages Commenting**](#jsxtsx--other-languages-commenting)
    - [**@ Commenting in Normal Mode**](#-commenting-in-normal-mode)
    - [**@ Commenting in Visual Mode**](#-commenting-in-visual-mode)
  - [**Discord Presence**](#discord-presence)
  - [Emmet (For HTML/JSX Autocompletion)](#emmet-for-htmljsx-autocompletion)
  - [Tailwind CSS IntelliSense](#tailwind-css-intellisense)
  - [Gen Lorem Ipsum](#gen-lorem-ipsum)
  - [Code Fold](#code-fold)
  - [Live Server](#live-server)
  - [System Clipboard Copy](#system-clipboard-copy)
- [🚀 React Snippets Autocompletion](#-react-snippets-autocompletion)
  - [🔥 React Snippets Guide](#-react-snippets-guide)
    - [Functional Components](#functional-components)
    - [Class Components](#class-components)
    - [General Redux + Redux Toolkit](#general-redux--redux-toolkit)
- [🎯 TypeScript/JavaScript Engine: Cool Features](#-typescriptjavascript-engine-cool-features)
- [Cool Pre-Configured Themes](#cool-pre-configured-themes)
  - [**@ Github Themes** - Has flavors](#-github-themes---has-flavors)
  - [**@ Jetbrains IDE Theme**](#-jetbrains-ide-theme)
  - [**@ Tokyo Night Theme** - Has flavors](#-tokyo-night-theme---has-flavors)
  - [**@ Catppuccin Theme** - Has flavors](#-catppuccin-theme---has-flavors)
  - [**@ Rose Pine Theme** - Has flavors](#-rose-pine-theme---has-flavors)

## Introduction<a name="introduction"></a>

This Neovim configuration is a powerhouse of productivity enhancements and aesthetics. I've curated a selection of plugins, key bindings, and themes to provide a versatile and delightful text-editing experience. Whether you're a developer, writer, or anyone in need of a robust text editor, this setup has got you covered.

### 💎 Old Look (COLSON NVIM)

![nvim IDE colson](https://i.imgur.com/PhNfQ2g.png)

![colson nvim](https://i.imgur.com/yphli9e.png)

![colson nvim](https://i.imgur.com/ULq4jNp.png)

![colson nvim](https://i.imgur.com/PMUhbQC.png)

![colson nvim](https://i.imgur.com/hXArysH.png)

![colson nvim](https://i.imgur.com/ulMC4IJ.png)

![colson nvim](https://i.imgur.com/UB0osd5.png)

![colson nvim](https://i.imgur.com/O9IpfyV.png)

## Installation<a name="installation"></a>

To embark on this Neovim journey, follow these steps:

1. Clone this repository to your Neovim configuration directory:

   ```shell
   git clone https://github.com/colson0x1/nvim ~/.config/nvim
   ```

2. Install Packer.nvim for managing plugins:

   ```shell
   git clone https://github.com/wbthomason/packer.nvim \
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

3. Launch Neovim and run `:PackerSync` to install and update plugins.

Now, you're all set to unleash the power of this Neovim configuration!

![colson nvim](https://i.imgur.com/YffIPC6.png)

## Features<a name="features"></a>

### Global Key Bindings<a name="global-key-bindings"></a>

#### Leader Key

- **`<Space>`** serves as the leader key for most key bindings.

#### Netrw: File Explorer

![colson nvim netrw](https://i.imgur.com/cpzqjmT.png)

- **`<leader>pv`**: Open a file explorer with **Netrw**.

#### NvimTree (Left window pane file explorer)

- **`<leader>e`**: Toggle NvimTree

![colson nvim nvimtree](https://i.imgur.com/zPUZ8lo.png)

#### Collaborative Editing

- **`<leader>vwm`**: Start a Vim-With-Me collaborative editing session.
- **`<leader>svwm`**: Stop a Vim-With-Me collaborative editing session.

#### Text Manipulation

- **``**: Delete selected text in visual mode.
- **``**: Yank text to the system clipboard.
- **`Ctrl+y`**: Yank the entire line to the system clipboard.
- **``**: Delete text without clobbering the register.
- **`Ctrl+c`**: Exit insert mode.

#### Code Formatting

- **`<leader>f`**: Format code using LSP (Language Server Protocol).
- Even awesome: **`:w`** triggers Prettier for code formatting!

#### Navigation

- **`<C-k>`** and **`<C-j>`**: Navigate through the quickfix list.
- **`<leader>k`** and **`<leader>j`**: Navigate through the location list.

####

Search and Replace

- **`<leader>sr`**: Perform a search and replace using Telescope.

#### Miscellaneous

- **``**: Close the current buffer.
- **``**: Quit Neovim.

### Normal Mode Key Bindings<a name="normal-mode-key-bindings"></a>

#### Line Manipulation

- **`<leader>k`** and **`<leader>j`**: Move the current line up or down.
- **`<leader>K`** and **`<leader>J`**: Copy the current line up or down.
- **`<leader>dd`**: Delete the current line.
- **`<leader>cc`**: Duplicate the current line.

#### Scrolling

- **``** and **``**: Scroll down or up.

#### Code Navigation

- **`gd`**: Go to definition.
- **`gf`**: Go to file.
- **`gy`**: Go to type definition.
- **`gi`**: Go to implementation.
- **`gr`**: Show references.
- **``**: Rename symbol.

#### Ex Mode

- **`:W`**: Write the current file.
- **`:Wq`**: Write and quit.
- **`:WQ`**: Write and quit (forceful).
- **`:Wqa`**: Write all and quit.

#### Git Integration

- **`<leader>gs`**: Git status.
- **`<leader>gc`**: Git commit.
- **`<leader>gp`**: Git push.
- **`<leader>gl`**: Git log.

#### Harpoon Integration

- **`Ctrl+e`**: Harpoon open quick list.
- - **`<leader>a`**: Harpoon add buffer.
- **`Ctrl+t and Ctrl+h`**: Harpoon toggle buffer.

#### LSP Integration

- **`Shift+k`**: LSP hover.
- **`Ctrl+n`**: LSP toggle next in autocompletion.
- **`Ctrl+p`**: LSP toggle previous in autocompletion.
- **`Ctrl+k or Ctrl+y`**: LSP select in autocompletion.
- View Diagnostic Errors: **`<leader>dd` or `<leader>sd` or `<leader>vd`**

### **Telescope** Integration<a name="telescope-integration"></a>

![colson nvim telescope](https://i.imgur.com/TFnI6L3.png)

![colson nvim telescope](https://i.imgur.com/8zvfiNr.png)

![colson nvim telescope](https://i.imgur.com/uCgbasi.png)

![colson nvim telescope](https://i.imgur.com/n0fMcPh.png)

- **`<leader>pf`**: Find files in the current directory.

NOTE: **`<leader>`** is **SPACE**

### TELESCOPE GREP Search

Search by keyword in files!

![colson nvim telescope grep search](https://i.imgur.com/lzTtolO.png)

![colson nvim telescope grep search](https://i.imgur.com/LebP7Up.png)

- **`<leader>ps`**: Live grep files.

## 🔥 NEW UPDATES

### **Bufferline**

![colson nvim bufferline](https://i.imgur.com/vq02oU1.png)

To enable bufferline (Tab based file buffer like VSCode), Go to:
`$ ~/.config/nvim`
Open nvim: `$ nvim .`
Navigate to `packer.lua` and uncomment `Bufferline Plugin`
After that, write `:w` and source it: `:so` and run packer sync: `:PackerSync`
Now you're good to go!

- **`<leader>h`**: Goes to next tab.
- **`<leader>g`**: Goes to prev tab.
- **`<leader>btl`**: Move tab left.
- **`<leader>btr`**: Move tab right.
- **`<leader>bd`**: Delete current tab.
- **`<leader>bcl`**: Delete all tabs on left hand side.
- **`<leader>bcr`**: Delete all tabs on right hand side.
- **`<leader>abc`**: Close all tabs except currently opened one.

### **JSX/TSX & Other Languages Commenting**

#### **@ Commenting in Normal Mode**

- **`gcc`** - Toggles the current line using `linewise` comment.
- **`gbc`** - Toggles the current line using `blockwise` comment.
- **`[count]gcc`** - Toggles the number of line given as a prefix count
  using `linewise` comment.
- **`[count]gbc`** - Toggles the number of line given as a prefix count
  using `blockwise` comment.
- **`gc[count]{motion}`** - Toggles the region using `linewise` comment.
- **`gb[count]{motion}`** - Toggles the region using `blockwise` comment

#### **@ Commenting in Visual Mode**

- **`gc`** - Toggles the region using `linewise` comment.
- **`gb`** - toggles the region using `blockwise` comment.

### **Discord Presence**

- Open discord first and then, open your workspace from terminal: `nvim .`

### Emmet (For HTML/JSX Autocompletion)

- **`!<Ctrl+k>`** To generate HTML standard boilerplate
- **`.app-header<Ctrl+k>`**: Creates `div` with `classname` of `app-header`.
- **`#root<Ctrl+k>`**: Creates `div` with `id` of `root`.
- **`.flex.color-blue-600`**: Creates `div` with `classnames` - `flex color-blue-600`.
- **`div<Ctrl+k>`**: Creates `div` element.
- **`nav>ul>li*2<Ctrl+k>`**: Creates
  ```js
  <nav>
    <ul>
      <li></li>
      <li></li>
    </ul>
  </nav>
  ```
- **`p+span<Ctrl+k>**: Creates
  ```js
  <p></p>
  <span></span>
  ```
- **`.className<Ctrl+k>`**: Creates `div` with `prop` `className` which can be useful for styling with css modules, tailwind or mixing with style components.

### Tailwind CSS IntelliSense

- Use **`<Ctrl+k>`** to select when you use tailwind: Ex when you type `text-` in `className='text-'`, you get autocompletion!
- Use **`<Ctrl+k`** to select in autocompletion.
- Use **`<Ctrl+n`** to go to next in the occurrence.
- Use **`<Ctrl+p`** to go to prev in occurrence.

### Gen Lorem Ipsum

- To generate lorem ipsum paragraph: In normal mode, type `:Lorem`
- To generate specified constraint of words: `:Lorem 10` which generates 10 words.

### Code Fold

- To use code folding: First go to `Visual Line Mode` using `Shift+v`.
  After that use `j` or `k` to select block of code.
  Now use: `zf` to fold code.
  To unfold the code, go to the code fold line and use: `zo` to open the code fold.

### Live Server

- First install live server globally: `sudo npm install -g live-server`
- Now inside `Neovim`: Go to `index.html` and on `Normal Mode`, type:
  `:LiveServerStart` to start the server and `:LiveServerStop` to stop the server.

### System Clipboard Copy

First install `xclip` on your machine in order for the configurations to work:

```
$ sudo pacman -S xclip
```

Then open any workspace with `nvim .` in `Tmux` environment. Now you're ready to go!

- NORMAL OR VISUAL MODE: **`<leader>y`** - Copies to system clipboard.
- NORMAL MODE: **`<leader>Y`** - Copies text from cursor to the end of the line to the system clipboard.

## 🚀 React Snippets Autocompletion

For this to work, the main package depends upon this dependency `Ultisnips`
which requires `pynvim` installed on your machine.
First, let's verify if `python3` support is enabled inside your `nvim` environment.

```
cd ~/.config/nvim
```

```
nvim .
```

Open `packer.lua` and in normal mode: Type

```
:echo has('python3')
```

If it returns 1, we're good to go else we need to install the dependencies to enable the support inside the neovim environment.

Here's how to do it:

```
$ sudo pacman -S base-devel cmake unzip
$ sudo pacman -S python-pynvim
```

Now, again open that `packer.lua` file and verify if we've got access to the `python3` inside `neovim` environment.
This time, it should return `1` aka OKAY!

Now, make sure you're synced with my latest configuration!

```
$ cd ~/.config/nvim
```

```
nvim .
```

Open `packer.lua`

```
:so
```

```
:PackerSync
```

Yay, finally now we should be able to use `React Snippets`!

### 🔥 React Snippets Guide

> Use **`<Ctrl+l>`** after you type the trigger code!

#### Functional Components

| Trigger Code | What it does                               |
| ------------ | ------------------------------------------ |
| `fce`        | `Function Component Export`                |
| `fcde`       | `Function Component Default Export`        |
| `sfce`       | `Simple Function Component Export`         |
| `sfcde`      | `Simple Function Component Default Export` |
| `useS`       | `useState`                                 |
| `useE`       | `useEffect`                                |
| `useEA`      | `useEffect async`                          |
| `useC`       | `useContext`                               |
| `useRed`     | `useReducer`                               |
| `useCB`      | `useCallback`                              |
| `useM`       | `useMemo`                                  |
| `useR`       | `useRef`                                   |
| `useI`       | `useImperativeHandle`                      |
| `useL`       | `useLayoutEffect`                          |
| `useDV`      | `useDebugValue`                            |
| `useT`       | `useTransition`                            |

#### Class Components

| Trigger Code | What it does                              |
| ------------ | ----------------------------------------- |
| `rce`        | `React Class Component Export`            |
| `rcep`       | `React Class Export with Prop interface`  |
| `rceps`      | `React Class Export with Props and State` |
| `rcc`        | `React Class Component`                   |
| `rcon`       | `React Class Constructor`                 |
| `spt`        | `Static PropTypes`                        |
| `sdp`        | `Static Default Props`                    |
| `sdpt`       | `Static Default Props Typed`              |
| `cdm`        | `Component Did Mount`                     |
| `cdu`        | `Component Did Update`                    |
| `cdc`        | `Component Did Catch`                     |
| `cwum`       | `Component Will Unmount`                  |

#### General Redux + Redux Toolkit

| Trigger Code | What it does             |
| ------------ | ------------------------ |
| `useDS`      | `useDispatch`            |
| `useSL`      | `useSelector`            |
| `cs`         | `createSlice`            |
| `ecs`        | `export createSlice`     |
| `cpr`        | `create prepare reducer` |
| `cat`        | `createAsyncThunk`       |

### 🎯 TypeScript/JavaScript Engine: Cool Features

- **@ sorts and removes unused imports: `<leader>oi` or `<leader>soi`**
- **@ sorts imports: `<leader>si`**
- **@ removes unused imports: `<leader>ui` or `<leader>ri`**
- **@ adds imports for all statements that lack one and can be imported: `<leader>ai`**
- **@ fixes all fixable errors: `<leader>fe`**
- **@ goes to source definition (available since TS v4.7): `<leader>d`**
- **@ allow to rename current file and apply changes to connected files: `<leader>rr` or `<leader>rn` or `<leader>rf`**
- **@ find files that reference the current file (available since TS v4.2): `<leader>fr`**

---

## Cool Pre-Configured Themes<a name="cool-themes"></a>

The themes are configured already but I've commented out rest. Feel free to explore these themes and uncomment the one that resonates with your taste!

Preconfigured themes:

#### **@ Github Themes** - Has flavors

#### **@ Jetbrains IDE Theme**

#### **@ Tokyo Night Theme** - Has flavors

#### **@ Catppuccin Theme** - Has flavors

#### **@ Rose Pine Theme** - Has flavors

![colson nvim](https://i.imgur.com/b8CtR0m.png)

![colson nvim](https://i.imgur.com/3a7HR6X.png)

![colson nvim](https://i.imgur.com/WYT8wcG.png)

![colson nvim](https://i.imgur.com/kjXd12x.png)

![colson nvim](https://i.imgur.com/y0ynRkc.png)

![colson nvim](https://i.imgur.com/UfAYd7w.png)

END:
May your coding journey with Neovim be nothing short of stellar! 🚀

Peace! 🕊
