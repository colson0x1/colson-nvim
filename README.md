<div align="center">
<h1>Colson Nvim (colson-nvim npm) 💎</h1>
<h2>FullStack Neovim IDE by COLSON! 🚀 </h2>
<h2>Neovim IDE for TypeScript/JavaScript Software Engineers</h2>
<h3>Supports dozen different programming languages and technologies + DevOps Workflows (Kubernetes, Docker, Terraform and more)</h3>
<h3>Engineered for large-scale distributed systems: polyglot LSPs, Java/JVM tooling, gRPC/proto workflows, and monorepo-fast fuzzy finding</h3>
<h2>🎯 Blazingly Fast as compared to VSCode and WebStorm 🔥</h2>
<h2>Worldclass Neovim Experience for Engineers 💎</h2>

<!-- <img src='https://i.imgur.com/nls1N1W.png' alt='colson nvim discord presence' /> -->
<img src='https://i.imgur.com/kpAiwYn.png' alt='colson nvim discord presence' />

<p>
<a href="https://www.npmjs.com/package/colson-nvim"><img src="https://img.shields.io/npm/v/colson-nvim?style=for-the-badge&logo=npm&color=cb3837" alt="npm version"></a>
<img src="https://img.shields.io/badge/Neovim-0.11%2B-57A143?style=for-the-badge&logo=neovim" alt="Neovim 0.11+">
<img src="https://img.shields.io/badge/Plugin%20Manager-lazy.nvim-2e2e2e?style=for-the-badge" alt="lazy.nvim">
<img src="https://img.shields.io/badge/Linux%20%7C%20macOS-supported-blue?style=for-the-badge" alt="Linux and macOS">
</p>
</div>

Step into the realm of excellence with my world-class Neovim (nvim) configuration! This comprehensive guide unveils a meticulously crafted zenful setup, meticulously designed for unparalleled efficiency, productivity, and visual splendor within Neovim.

Embark on a journey through a domain enriched with powerful features, plugins, and finely tuned key bindings, addressing a diverse range of coding/text-editing requirements. Welcome to a sublime Neovim experience tailored to elevate your coding endeavors to new heights! 🔥

## July, 2026 Preview 😆

![colson nvim npm](https://i.imgur.com/kxWDHFA.png)

![colson nvim npm](https://i.imgur.com/IqE3Iz6.png)

![colson nvim npm](https://i.imgur.com/CbRLoeu.png)

![colson nvim npm](https://i.imgur.com/xSLOIEc.png)

## 2025 Preview

![colson nvim npm](https://i.imgur.com/rAAkACt.png)

![colson nvim npm](https://i.imgur.com/RcETNS3.png)

![colson nvim npm](https://i.imgur.com/3PiJBBO.png)

![colson nvim npm](https://i.imgur.com/gLLVppX.png)

![colson nvim npm](https://i.imgur.com/L2aP14C.png)

![colson nvim npm](https://i.imgur.com/fCjMvn4.png)

![colson nvim npm](https://i.imgur.com/x08NThd.png)

![colson nvim npm](https://i.imgur.com/38UFOp7.png)

## ⚡ TL;DR — One Command

```shell
npx colson-nvim@latest
```

Then launch `nvim`. That's it. 🎉

lazy.nvim bootstraps itself, and every plugin restores to an **exact, tested
commit** from the committed `lazy-lock.json` — the same known-good setup on
every machine, every time. Your previous config (if any) is automatically
backed up to `~/.config/nvim.backup-<timestamp>` first.

## 🚀 What's New (July 2026) — The Future-Proof Release

![colson nvim npm](https://i.imgur.com/kxWDHFA.png)

![colson nvim npm](https://i.imgur.com/xSLOIEc.png)

This release is a ground-up modernization of the plugin infrastructure while
keeping every keybinding and workflow you know exactly the same:

- 🧩 **lazy.nvim plugin manager** — packer.nvim was archived upstream in 2023;
  the config now runs on the actively maintained industry standard. Your
  muscle memory survives: `:PackerSync`, `:PackerInstall`, `<leader>po`, and
  `<leader>pac` all still work as compatibility shims that delegate to lazy.
- 🔒 **Reproducible installs** — `lazy-lock.json` pins all ~64 plugins to
  exact commits. Fresh machine = identical editor. `:Lazy restore` puts
  everything back to the tested state at any time.
- 🖥️ **Dashboard start screen** ([dashboard-nvim](https://github.com/nvimdev/dashboard-nvim))
  with **BOTH layouts configured**: **DOOM** (default) and **HYPER** —
  switchable at runtime. See [Dashboard](#%EF%B8%8F-dashboard--start-screen).
- 🌲 **Treesitter `main` branch** — the only branch that supports Neovim 0.12+.
  Highlighting and indentation now use Neovim's native `vim.treesitter` APIs.
- 🔍 **telescope-fzf-native** — compiled C fuzzy matcher; instant fuzzy
  finding even on giant monorepos.
- 🩺 **fidget.nvim** — live LSP indexing progress (see tsserver/jdtls/gopls
  warm up on large codebases instead of guessing).
- 🧬 **gitsigns.nvim** — hunk-level change indicators in the gutter, tuned
  with large-repo safety limits.
- ☕ **Java stack repaired & modernized** — nvim-java 4.x with bundled
  components, mason-curated jdtls versions (no more dead download URLs), and
  the modern `vim.lsp.config()` API (no deprecated lspconfig framework calls).
- 🧯 **Startup hardening** — zero blocking errors on boot, stale server names
  fixed (`tsserver` → `ts_ls`), version-pin rot eliminated, undo directory
  auto-created on fresh machines.

## 🖥️ Dashboard — Start Screen

Launching `nvim` with no arguments now opens a beautiful start screen with the
COLSON banner, quick actions, and startup stats. Both official layouts ship
pre-configured:

| Command                 | What it does                               |
| ----------------------- | ------------------------------------------ |
| `:Dashboard`            | Open the dashboard (current theme)         |
| `:DashboardDoom`        | Switch to the **DOOM** layout (default) 💀 |
| `:DashboardHyper`       | Switch to the **HYPER** layout ⚡          |
| `:DashboardToggleTheme` | Toggle DOOM ↔ HYPER                       |

**DOOM layout (default)** — a focused vertical menu:

| Key | Action                      |
| --- | --------------------------- |
| `f` | Find File (Telescope)       |
| `r` | Recent Files                |
| `g` | Live Grep                   |
| `e` | File Explorer (NvimTree)    |
| `n` | New File                    |
| `c` | Browse this Neovim config   |
| `u` | Sync Plugins (`:Lazy sync`) |
| `q` | Quit                        |

**HYPER layout** — shortcut pills + recent projects + MRU files with hotkeys,
plus live startup time and plugin stats.

Every launch path does the right thing:

| You type                    | You get                                                                                                                                                                                               |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nvim`                      | The DOOM dashboard                                                                                                                                                                                    |
| `nvim .` / `nvim ~/project` | Straight into the project: session rooted there (`:cd`), netrw listing in the background, Telescope Find Files floating on top — zero keystrokes to your code, dismiss the picker and you're browsing |
| `nvim file.ts`              | The file, instantly — nothing in between                                                                                                                                                              |

The palette is a neon hacker set on true black: matrix-green banner
(`#00ff9f`), cyan icons, magenta hotkeys — reapplied automatically on every
`:colorscheme` change so it never washes out.

> 💡 Prefer the classic auto-Telescope-on-startup behavior? It's preserved
> behind a flag: set `vim.g.colson_startup_telescope = true` in
> `lua/colson/set.lua`.

## Installation through NPM

Ensure **Neovim ≥ 0.11** (0.12 recommended) and **Node.js** are installed on
your machine, then:

```shell
npx colson-nvim@latest
```

### Requirements

| Dependency                   | Why                                      | Required |
| ---------------------------- | ---------------------------------------- | -------- |
| Neovim ≥ 0.11                | Core editor (0.12 recommended)           | ✅       |
| git                          | Plugin manager + plugin installs         | ✅       |
| Node.js ≥ 18                 | LSP servers, markdown preview, Copilot   | ✅       |
| C compiler + make            | Treesitter parsers, telescope-fzf-native | ✅       |
| tree-sitter CLI              | Parser builds (treesitter `main` branch) | ✅       |
| ripgrep                      | Telescope live grep                      | ✅       |
| python + pynvim              | UltiSnips (React snippets)               | ✅       |
| JetBrainsMono Nerd Font      | Icons & glyphs                           | ✅       |
| xclip / wl-clipboard (Linux) | System clipboard integration             | ⭕       |
| jq, curl                     | HTTP REST client niceties                | ⭕       |

<details>
<summary><b>🐧 Arch Linux</b> (click to expand)</summary>

```shell
sudo pacman -S neovim nodejs npm git base-devel cmake unzip ripgrep python-pynvim xclip
npm install -g tree-sitter-cli
```

</details>

<details>
<summary><b>🐧 Debian / Ubuntu</b> (click to expand)</summary>

```shell
# Neovim from apt is often outdated - prefer the official release:
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc

sudo apt install nodejs npm git build-essential cmake unzip ripgrep python3-pynvim xclip
npm install -g tree-sitter-cli
```

</details>

<details>
<summary><b>🐧 Fedora / RHEL</b> (click to expand)</summary>

```shell
sudo dnf install neovim nodejs git gcc gcc-c++ make cmake unzip ripgrep python3-neovim xclip
npm install -g tree-sitter-cli
```

</details>

<details>
<summary><b>🐧 openSUSE</b> (click to expand)</summary>

```shell
sudo zypper install neovim nodejs git gcc gcc-c++ make cmake unzip ripgrep python3-pynvim xclip
npm install -g tree-sitter-cli
```

</details>

<details>
<summary><b>🍎 macOS</b> (click to expand)</summary>

```shell
xcode-select --install        # C toolchain (clang + make)
brew install neovim node git ripgrep
pip3 install pynvim
npm install -g tree-sitter-cli
```

Clipboard integration works out of the box via `pbcopy`/`pbpaste` — no extra
package needed.

</details>

<details>
<summary><b>🔤 JetBrainsMono Nerd Font</b> (click to expand)</summary>

Install the JetBrains Mono Nerd Font to render icons and language glyphs:

https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

On Arch: `sudo pacman -S ttf-jetbrains-mono-nerd` · on macOS:
`brew install --cask font-jetbrains-mono-nerd-font`

</details>

### First Launch

```shell
nvim
```

- lazy.nvim bootstraps automatically (if the installer didn't pre-clone it)
- All plugins restore to their **pinned commits** from `lazy-lock.json`
- Treesitter parsers compile in the background
- Mason installs language servers for the toolchains it detects on your machine

Give the first launch a couple of minutes, restart Neovim, and you're home. 🏡

### For the latest pull, do:

```shell
npx colson-nvim@latest
```

If it's not the first time, then after each pull open Neovim and run:

```
:Lazy restore
```

That checks out every plugin at the exact commits shipped with the release —
the tested, known-good state. (The old `<leader>pac` flow still works too —
it now syncs through lazy.nvim under the hood.)

`NOTE`: Leader key for Neovim -> **SPACE**

## 🏗️ Architecture

Distinguished-engineer discipline: declarations, configuration, and boot
orchestration live in separate, single-purpose layers.

```
~/.config/nvim/
├── init.lua                     # Entry point (banner + delegation only)
├── lazy-lock.json               # Exact commit pins - reproducible installs
├── lua/colson/
│   ├── init.lua                 # Staged boot orchestrator (4 stages)
│   ├── remap.lua                # Leader + all keymaps (loads FIRST)
│   ├── set.lua                  # Editor options
│   ├── startup.lua              # Startup behavior (dashboard-aware)
│   ├── lazy.lua                 # lazy.nvim bootstrap + Packer shims
│   ├── packer.lua               # LEGACY reference (not loaded)
│   └── plugins/                 # Plugin DECLARATIONS by domain
│       ├── editor.lua           #   telescope, harpoon, snippets, ...
│       ├── git.lua              #   fugitive, diffview, gitsigns, ...
│       ├── lsp.lua              #   lsp-zero, treesitter, typescript-tools
│       ├── java.lua             #   nvim-java, DAP, neotest
│       ├── tools.lua            #   HTTP clients, markdown, AI assistants
│       └── ui.lua               #   dashboard, lualine, themes
└── after/plugin/*.lua           # Plugin CONFIGURATIONS (one file each)
```

Every plugin spec that was ever commented out in the Packer era is preserved
in the new domain modules — translated to lazy.nvim syntax so re-enabling
anything is a pure uncomment.

## 🏢 Built for Large-Scale Distributed Systems

This config is daily-driven against a ~95-microservice polyglot monorepo.
What that means for you:

- **Polyglot LSP auto-detection** — mason inspects the toolchains on your
  machine (Go, Rust, Java, Python, Elixir, Scala, TS/JS, Terraform, Docker,
  YAML, proto/gRPC via `pbls`, and more) and installs only the matching
  language servers. No dead weight.
- **JVM tuned for monorepos** — jdtls runs with a 2g→8g G1GC heap profile,
  multi-JDK runtimes, Gradle/Maven root markers, and full DAP + neotest
  integration.
- **tsserver at scale** — typescript-tools.nvim with separate diagnostic
  server and configurable memory ceiling.
- **Monorepo-fast search** — telescope + ripgrep + compiled fzf native sorter.
- **Feedback under load** — fidget.nvim shows indexing progress; gitsigns has
  a 40k-line file guard so giant generated files never lag the gutter.

## ❕ Keeping Your Configuration Up-to-Date

I'm committed to consistently enhancing this Neovim setup with new features, optimizations, and additional plugins. To ensure you're making the most out of this dynamic configuration, I recommend checking for updates monthly!

As the configuration evolves, it's a good practice to sync your local repository with the latest changes. To do this, navigate to your Neovim configuration directory and run the following command:

```bash
cd ~/.config/nvim
git pull origin main
nvim +"Lazy restore" +q     # align plugins with the shipped lockfile
```

Or simply re-run the installer: `npx colson-nvim@latest` (your existing config
is backed up automatically first).

## **Prerequisites: Neovim 0.11.0 or Higher**

Ensure a seamless experience by confirming your Neovim version meets the requirements. Execute the following command to check your Neovim version:

```bash
nvim --version
```

Upgrade to Neovim 0.11.0 or higher if needed (0.12.x is what this config is
verified against), and dive into an enhanced coding experience with this
dynamic configuration! 🚀

## Table of Contents

- [⚡ TL;DR — One Command](#-tldr--one-command)
- [🚀 What's New (July 2026)](#-whats-new-july-2026--the-future-proof-release)
- [🖥️ Dashboard — Start Screen](#%EF%B8%8F-dashboard--start-screen)
- [Installation through NPM](#installation-through-npm)
  - [Requirements](#requirements)
  - [First Launch](#first-launch)
  - [For the latest pull, do:](#for-the-latest-pull-do)
- [🏗️ Architecture](#%EF%B8%8F-architecture)
- [🏢 Built for Large-Scale Distributed Systems](#-built-for-large-scale-distributed-systems)
- [❕ Keeping Your Configuration Up-to-Date](#-keeping-your-configuration-up-to-date)
- [✨ New Updated Zenful Look (COLSON NVIM)](#-new-updated-zenful-look-colson-nvim)
- [@ Neovim on Arch Linux](#-neovim-on-arch-linux)
  - [💎 NEW ZEN LOOK (Colson NVIM, March 19th, 2025)](#-new-zen-look-colson-nvim-march-19th-2025)
  - [💎 NEW LOOK (Colson NVIM, December 5th, 2024)](#-new-look-colson-nvim-december-5th-2024)
  - [New Modern Look, September 2024 💎](#new-modern-look-september-2024-)
  - [Latest Fresh Look, July 2024 :)](#latest-fresh-look-july-2024-)
- [@ Neovim on macOS](#-neovim-on-macos)
  - [2023/Early 2024 Look](#2023early-2024-look)
- [🔥 COOL NEW Discord Presence for Neovim (April, 2025)](#-cool-new-discord-presence-for-neovim-april-2025)
- [Introduction](#introduction)
  - [💎 Old Look (COLSON NVIM)](#-old-look-colson-nvim)
- [Installation (Manual, without npm)](#installation-manual-without-npm)
- [Features](#features)
  - [Global Key Bindings](#global-key-bindings)
  - [Normal Mode Key Bindings](#normal-mode-key-bindings)
  - [**Telescope** Integration](#telescope-integration)
  - [TELESCOPE GREP Search](#telescope-grep-search)
- [🔥 NEW UPDATES](#-new-updates)
  - [**Bufferline**](#bufferline)
  - [**JSX/TSX \& Other Languages Commenting**](#jsxtsx--other-languages-commenting)
  - [**Discord Presence**](#discord-presence)
  - [Emmet (For HTML/JSX Autocompletion)](#emmet-for-htmljsx-autocompletion)
  - [Tailwind CSS IntelliSense](#tailwind-css-intellisense)
  - [Gen Lorem Ipsum](#gen-lorem-ipsum)
  - [Code Fold](#code-fold)
  - [Live Server](#live-server)
  - [System Clipboard Copy](#system-clipboard-copy)
- [🎆 React Snippets Autocompletion](#-react-snippets-autocompletion)
- [Git Diff View 😆](#git-diff-view-)
- [🧬 Git Hunk Signs (gitsigns)](#-git-hunk-signs-gitsigns)
- [🛰️ HTTP REST Client](#️-http-rest-client)
- [🪐 HTTP Client](#-http-client)
- [🔄 Syncing Plugin Updates (lazy.nvim)](#-syncing-plugin-updates-lazynvim)
- [✅ Git Merge Conflicts Resolver](#-git-merge-conflicts-resolver)
- [🔭 Telescope 🔥](#-telescope-)
- [🤖 Augment Code – Enterprise Grade Configuration](#-augment-code--enterprise-grade-configuration)
- [🤖 Github Copilot Integration](#-github-copilot-integration)
- [🚀 **HTTP REST Client for Engineers**](#-http-rest-client-for-engineers)
- [📘 Markdown Preview ✨](#-markdown-preview-)
- [🩺 Troubleshooting](#-troubleshooting)
- [Cool Pre-Configured Themes](#cool-pre-configured-themes)

**DEMO Screenshot**

## ✨ New Updated Zenful Look (COLSON NVIM)

## @ Neovim on Arch Linux

### 💎 NEW ZEN LOOK (Colson NVIM, March 19th, 2025)

![colson nvim npm](https://i.imgur.com/rAAkACt.png)

### 💎 NEW LOOK (Colson NVIM, December 5th, 2024)

![colson nvim npm](https://i.imgur.com/3PiJBBO.png)

![colson nvim npm](https://i.imgur.com/RcETNS3.png)

![colson nvim npm](https://i.imgur.com/2GtP3Cr.png)

![colson nvim npm](https://i.imgur.com/WImI5ju.png)

![colson nvim npm](https://i.imgur.com/43qgLzP.png)

![colson nvim npm](https://i.imgur.com/38UFOp7.png)

![colson nvim npm](https://i.imgur.com/8sjLsBx.png)

![colson nvim npm](https://i.imgur.com/OHRaSIu.png)

![colson nvim npm](https://i.imgur.com/5oMjIwS.png)

![colson nvim npm](https://i.imgur.com/TwjGqaZ.png)

![colson nvim npm](https://i.imgur.com/Ul5EutQ.png)

![colson nvim npm](https://i.imgur.com/gLLVppX.png)

![colson nvim npm](https://i.imgur.com/6Ypo0Vj.png)

![colson nvim npm](https://i.imgur.com/L2aP14C.png)

![colson nvim npm](https://i.imgur.com/1CrOODl.png)

![colson nvim npm](https://i.imgur.com/JIVjMiy.png)

![colson nvim npm](https://i.imgur.com/BVLn5x5.png)

![colson nvim npm](https://i.imgur.com/fCjMvn4.png)

![colson nvim npm](https://i.imgur.com/yDP4Sde.png)

![colson nvim npm](https://i.imgur.com/nUdNVTC.png)

![colson nvim npm](https://i.imgur.com/TJEVab0.png)

![colson nvim npm](https://i.imgur.com/BoLPmPl.png)

![colson nvim npm](https://i.imgur.com/NkQ6Gkg.png)

![colson nvim npm](https://i.imgur.com/x08NThd.png)

![colson nvim npm](https://i.imgur.com/nkdXMib.png)

![colson nvim npm](https://i.imgur.com/Eb0E26y.png)

![colson nvim npm](https://i.imgur.com/x4MCfKM.png)

### New Modern Look, September 2024 💎

![colsonn nvim](https://i.imgur.com/m5UvL88.png)

![colson nvim](https://i.imgur.com/NZuX2Iv.png)

![colson nvim](https://i.imgur.com/YAk1zK9.png)

![colson nvim](https://i.imgur.com/1Kvdttn.png)

![colson nvim](https://i.imgur.com/7davwV7.png)

![colson nvim](https://i.imgur.com/WP1WOzQ.png)

![colson nvim](https://i.imgur.com/7dMcAux.png)

![colson nvim](https://i.imgur.com/kHBbyOg.png)

![colson nvim](https://i.imgur.com/kp3R48u.png)

![colson nvim](https://i.imgur.com/4I0Aio9.png)

![colson nvim](https://i.imgur.com/lWLvmmD.png)

### Latest Fresh Look, July 2024 :)

![colson nvim](https://i.imgur.com/7V5XbMg.png)

![colson nvim](https://i.imgur.com/Xc3GtfT.png)

![colson nvim](https://i.imgur.com/pijyyi5.png)

![colson nvim](https://i.imgur.com/uUWfgS0.png)

![colson nvim](https://i.imgur.com/33chlUp.png)

![colson nvim](https://i.imgur.com/CzgCDIt.png)

![colson nvim](https://i.imgur.com/dFGKFhD.png)

![colson nvim](https://i.imgur.com/NfBt78o.png)

---

## @ Neovim on macOS

### 2023/Early 2024 Look

![colson nvim](https://i.imgur.com/zPUZ8lo.png)

![colson nvim](https://i.imgur.com/ZssRfKy.png)

![colson nvim](https://i.imgur.com/uCgbasi.png)

![colson nvim](https://i.imgur.com/r4kWoOM.png)

![colson nvim](https://i.imgur.com/cpzqjmT.png)

## 🔥 COOL NEW Discord Presence for Neovim (April, 2025)

![colson nvim](https://i.imgur.com/kpAiwYn.png)

![colson nvim](https://i.imgur.com/nls1N1W.png)

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

## Installation (Manual, without npm)<a name="installation"></a>

To embark on this Neovim journey, follow these steps:

1. Clone this repository's `nvim` folder to your Neovim configuration directory
   (back up any existing `~/.config/nvim` first!):

   ```shell
   git clone https://github.com/colson0x1/colson-nvim /tmp/colson-nvim
   cp -r /tmp/colson-nvim/nvim ~/.config/nvim
   ```

2. Launch Neovim:

   ```shell
   nvim
   ```

   lazy.nvim bootstraps itself and restores all plugins from `lazy-lock.json`
   automatically — no manual plugin-manager installation step anymore. 🎉

3. Install JetBrainsMono Nerd Font:
   - Install the regular JetBrains Mono version to support Unicode and Programming Languages Icons in the Neovim IDE!
     <br />
     https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

Now, you're all set to unleash the power of this Neovim configuration!

![colson nvim](https://i.imgur.com/YffIPC6.png)

## Features<a name="features"></a>

### Global Key Bindings<a name="global-key-bindings"></a>

#### Leader Key

- **`<Space>`** serves as the leader key for most key bindings.

#### Netrw: File Explorer

![colson nvim netrw](https://i.imgur.com/cpzqjmT.png)

- **`<leader>pv`**: Open a file explorer with **Netrw**.

#### NvimTree (Right window pane file explorer)

- **`<leader>e`**: Toggle NvimTree

**NOTE: Make sure NvimTree is Opened!**

- **`<leader>+`** - Increase the NvimTree (or current window) width by 5 columns.
- **`<leader>-`** - Decrease the NvimTree (or current window) width by 5 columns.
- **`<leader>fp`** - Manually set the width of the Project Pane.

##### Save Files

**`<leader>w`** - Save all open files.

##### Save and Exit Nvim

**`<leader>q`**: - Exit Neovim

**NEW Look!**

![colson nvim nvimtree](https://i.imgur.com/SjKzoUx.png)

**Old Look**

![colson nvim nvimtree](https://i.imgur.com/zPUZ8lo.png)

#### Collaborative Editing (optional)

- **`<leader>vwm`**: Start a Vim-With-Me collaborative editing session.
- **`<leader>svwm`**: Stop a Vim-With-Me collaborative editing session.

> Requires the optional [vim-with-me](https://github.com/ThePrimeagen/vim-with-me)
> plugin — add it in `lua/colson/plugins/editor.lua` if you want this workflow.

#### Text Manipulation

- **`<leader>y`**: Yank to the system clipboard (normal & visual mode).
- **`<leader>Y`**: Yank from cursor to the end of the line.
- **`<leader>d`**: Delete without clobbering the yank register (normal & visual mode).
- **`<leader>p`**: Paste over a selection without losing the yanked text (visual mode).
- **`Ctrl+c`**: Exit insert mode.

#### Code Formatting

- **`<leader>f`**: Format code using LSP (Language Server Protocol).
- Even awesome: **`:w`** triggers Prettier for code formatting!

#### Navigation

- **`<C-k>`** and **`<C-j>`**: Navigate through the quickfix list.
- **`<leader>k`** and **`<leader>j`**: Navigate through the location list.

#### Search and Replace

- **`<leader>s`**: Search & replace the word under the cursor across the file
  (pre-fills a `:%s//gI` command — just edit the replacement and hit Enter).
- **`<leader>fs`**: Interactive string grep across the project (Telescope).

### Normal Mode Key Bindings<a name="normal-mode-key-bindings"></a>

#### Line Manipulation

- **`J`** and **`K`** (visual mode): Move the selected lines down / up —
  reindenting as they go.
- **`J`** (normal mode): Join the line below without moving the cursor.

#### Scrolling

- **`<C-d>`** and **`<C-u>`**: Half-page down / up — cursor stays centered.
- **`n`** and **`N`**: Next / previous search result — centered on screen.

#### Code Navigation

- **`ds`** or **`gd`**: Go to definition (Normal Mode).
- **`gf`**: Go to file under cursor.
- **`<leader>vca`**: Code actions.
- **`<leader>vrr`**: Show references.
- **`<leader>vrn`**: Rename symbol.
- **`<C-h>`** (insert mode): Signature help.

#### Saving & Quitting

- **`<leader>w`**: Write all open files (`:wall`).
- **`<leader>q`**: Write all and quit Neovim (`:wqa`).
- **`<leader>x`**: Make the current file executable (`chmod +x`).

#### Git Integration

- **`<leader>gs`**: Git status (Telescope).
- **`<leader>gc`**: Browse Git commits (Telescope).
- **`<leader>gb`**: Switch Git branches (Telescope).
- **`<leader>gf`**: Find Git-tracked files (Telescope).
- **`:Git <anything>`**: Full Git via Fugitive (`:Git commit`, `:Git push`, `:Git log`, ...).

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

> ⚡ Telescope now runs with **telescope-fzf-native** — a compiled C fuzzy
> sorter. Fuzzy matching stays instant even on monorepo-scale file counts.

## 🔥 NEW UPDATES

### **Bufferline**

![colson nvim bufferline](https://i.imgur.com/vq02oU1.png)

To enable bufferline (Tab based file buffer like VSCode), Go to:
`$ ~/.config/nvim`
Open nvim: `$ nvim .`
Navigate to `lua/colson/plugins/ui.lua` and uncomment the `Bufferline` spec.
After that, write `:w` and run `:Lazy sync`.
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

#### Normal Mode Tag Manipulation: tsx/jsx/html

- `vit`: Selects everything **inside the tag**, excluding the tags themselves.
- `vat`: Selects everything **including the tag** (inner and outer).
- `cit`: Deletes everything inside the tag and starts insert mode.
- `dit`: Deletes everything inside the tag without entering insert mode.
- `dat`: Deletes the tag and its contents.

### Tailwind CSS IntelliSense

- Use **`<Ctrl+k>`** to select when you use tailwind: Ex when you type `text-` in `className='text-'`, you get autocompletion!
- Use **`<Ctrl+k`** to select in autocompletion.
- Use **`<Ctrl+n`** to go to next in the occurrence.
- Use **`<Ctrl+p`** to go to prev in occurrence.

### Gen Lorem Ipsum (optional)

- To generate lorem ipsum paragraph: In normal mode, type `:Lorem`
- To generate specified constraint of words: `:Lorem 10` which generates 10 words.

> The `lorem.nvim` spec ships disabled — uncomment it in
> `lua/colson/plugins/tools.lua`, run `:Lazy sync`, and the pre-wired config
> in `after/plugin/loremipsum.lua` picks it up automatically.

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

First install `xclip` on your machine in order for the configurations to work
(Linux only — macOS works out of the box):

```
$ sudo pacman -S xclip        # Arch
$ sudo apt install xclip      # Debian/Ubuntu
$ sudo dnf install xclip      # Fedora
```

Then open any workspace with `nvim .` in `Tmux` environment. Now you're ready to go!

- NORMAL OR VISUAL MODE: **`<leader>y`** - Copies to system clipboard.
- NORMAL MODE: **`<leader>Y`** - Copies text from cursor to the end of the line to the system clipboard.

## 🎆 React Snippets Autocompletion

### Ultisnips Dependency Installation

For this to work, the main package depends upon this dependency `Ultisnips`
which requires `pynvim` installed on your machine.
First, let's verify if `python3` support is enabled inside your `nvim` environment.

```
cd ~/.config/nvim
```

```
nvim .
```

In normal mode, type:

```
:echo has('python3')
```

If it returns 1, we're good to go else we need to install the dependencies to enable the support inside the neovim environment.

Here's how to do it on **Arch Linux**:

```
$ sudo pacman -S base-devel cmake unzip
$ sudo pacman -S python-pynvim
```

`NOTE`: Make sure to use the package manager based on your distribution!!

- On **Arch-based** distros:
  ```bash
  sudo pacman -S <package-name>
  ```
- On Debian-based distros:
  ```bash
  sudo apt install <package-name>
  ```
- On Red Hat-based distros:
  ```bash
  sudo yum install <package-name>
  ```

**For macOS:**

```bash
brew install python3
pip3 install pynvim
```

Now, again open Neovim and verify we've got access to `python3` inside the
`neovim` environment. This time, it should return `1` aka OKAY!

Now, make sure you're synced with my latest configuration!

```
$ cd ~/.config/nvim
```

```
nvim .
```

Then run:

```
:Lazy restore
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
- **@ allow to rename current file and apply changes to connected files: `<leader>r` or `<leader>rn` or `<leader>rf`**
- **@ find files that reference the current file (available since TS v4.2): `<leader>fr`**

---

## Git Diff View 😆

These keymaps facilitate easy navigation and management of diffs in your codebase!

| Key Mapping      | Action                   |
| ---------------- | ------------------------ |
| **`<leader>do`** | Open diff view           |
| **`<leader>dc`** | Close diff view          |
| **`<leader>df`** | Toggle file panel        |
| **`<leader>dh`** | Focus file panel         |
| **`<leader>dr`** | Refresh files            |
| **`<leader>dp`** | Previous file entry      |
| **`<leader>dn`** | Next file entry          |
| **`<leader>dt`** | Select entry             |
| **`<leader>dh`** | Open file history panel  |
| **`<leader>dl`** | Close file history panel |

---

## 🧬 Git Hunk Signs (gitsigns)

Line-level change indicators live in the gutter — additions, changes, and
deletions at a glance, tuned with a 40k-line guard so huge generated files
never lag. No new keymaps were added (all your `<leader>g*` bindings are
untouched); drive it with commands:

| Command                               | Action                           |
| ------------------------------------- | -------------------------------- |
| `:Gitsigns preview_hunk`              | Preview the hunk under cursor    |
| `:Gitsigns reset_hunk`                | Revert the hunk under cursor     |
| `:Gitsigns blame_line`                | Blame the current line           |
| `:Gitsigns toggle_current_line_blame` | Toggle inline blame virtual text |
| `:Gitsigns diffthis`                  | Diff buffer against the index    |

---

## 🛰️ HTTP REST Client

### Keymaps

| **Action**                   | **Key Mapping**  |
| ---------------------------- | ---------------- |
| Send HTTP request            | **`<leader>rr`** |
| Preview HTTP request         | **`<leader>rp`** |
| Re-run last HTTP request     | **`<leader>rl`** |
| Toggle environment variables | **`<leader>re`** |

### Key Mapping Explanation

- **`<leader>rr`**: Sends the HTTP request located at the cursor position. Useful for quickly testing endpoints without leaving the editor.
- **`<leader>rp`**: Previews the HTTP request that will be sent. This is beneficial for verifying the request structure and headers before execution.
- **`<leader>rl`**: Re-runs the last executed HTTP request. This saves time when you need to test the same endpoint multiple times.
- **`<leader>re`**: Toggles environment variables from a `.env` file, allowing you to manage configurations effectively.

## Usage Example

Here’s an example of how to use **HTTP REST Client** in your workflow:

1. **Open a new buffer** in Neovim.
2. **Write your HTTP request** in the format supported in either one of these extension - **`.http`** or **`.rest`** . For example:

**API.http**

```http
POST http://localhost:3000/api/v1/users
Content-Type: application/json

{
 "name": "Colson",
 "currentYear": "2026",
 "age": "25"
}
```

3. **Place the cursor** anywhere within the request.
4. Press `<leader>rr` to **send the request**.
5. Check the response in a split window.

---

## 🪐 HTTP Client

This requires two dependencies: `pynvim` and `requests` library. Make sure these two dependencies are installed on your machine for it to work!

### pynvim Bindings:

- Install with `pip`:
  ```bash
  pip install pynvim
  ```
- On Arch-based distros:
  ```bash
  sudo pacman -S python-pynvim
  ```
- On Debian-based distros:
  ```bash
  sudo apt install python3-pynvim
  ```
- On Red Hat-based distros:
  ```bash
  sudo yum install python-pynvim
  ```

### requests Library:

- Install with `pip`:
  ```bash
  pip install requests
  ```
- On Arch-based distros:
  ```bash
  sudo pacman -S python-requests
  ```
- On Debian-based distros:
  ```bash
  sudo apt install python3-requests
  ```
- On Red Hat-based distros:
  ```bash
  sudo yum install python-requests
  ```

### ⚡ Execute Network Request

Use the extension **`.http`** to run HTTP API Requests!

1. Go to the `.http` file.
2. To initiate a network request, execute: **`:Http`**
3. To terminate the current request, execute: **`:HttpStop`**

> Note: **`<leader>api`** is bound to the Resty client (see
> [HTTP REST Client for Engineers](#-http-rest-client-for-engineers)) — the
> recommended day-to-day request runner.

## 🔄 Syncing Plugin Updates (lazy.nvim)

Plugin management now runs on **lazy.nvim** — with full backwards
compatibility for the old Packer muscle memory:

| Command / Keymap | Action                                                       |
| ---------------- | ------------------------------------------------------------ |
| `:Lazy`          | Open the lazy.nvim UI                                        |
| `:Lazy restore`  | Check out every plugin at the pinned commit (lazy-lock.json) |
| `:Lazy sync`     | Install missing + update all + clean unused                  |
| `:Lazy update`   | Update plugins and refresh the lockfile                      |
| `:Lazy profile`  | Startup time profiling per plugin                            |
| `<leader>po`     | Muscle-memory shim → `:Lazy sync` (was `:PackerSync`)        |
| `<leader>pac`    | Source current file + sync (works exactly like before)       |
| `:PackerSync`    | Compat shim → `:Lazy sync`                                   |
| `:PackerInstall` | Compat shim → `:Lazy install`                                |
| `:PackerStatus`  | Compat shim → `:Lazy home`                                   |

> 🔒 **Golden rule:** `:Lazy restore` = deterministic (the tested, pinned
> state). `:Lazy sync`/`update` = bleeding edge (rewrites the lockfile).
> When in doubt, restore.

## ✅ Git Merge Conflicts Resolver

| Key Mapping  | Command                   | Action                                     |
| ------------ | ------------------------- | ------------------------------------------ |
| `<leader>co` | `GitConflictChooseOurs`   | Choose your changes (`ours`).              |
| `<leader>ct` | `GitConflictChooseTheirs` | Choose incoming changes (`theirs`).        |
| `<leader>cb` | `GitConflictChooseBoth`   | Include both sides (`both`).               |
| `<leader>c0` | `GitConflictChooseNone`   | Discard both sides (`none`).               |
| `<leader>cn` | `GitConflictNextConflict` | Jump to the next conflict.                 |
| `<leader>cp` | `GitConflictPrevConflict` | Jump to the previous conflict.             |
| `<leader>cs` | `GitConflictListQf`       | List all conflicts in the quickfix window. |

---

## 🔭 Telescope 🔥

### Telescope Normal Mode Commands

| Keymap                     | Mode        | Description                          |
| -------------------------- | ----------- | ------------------------------------ |
| `<leader>pf or <leader>ff` | Normal Mode | Find files in the project            |
| `<leader>ps or <leader>fg` | Normal Mode | GREP Search: Search across all files |
| `<leader>fb`               | Normal Mode | Switch between buffers               |
| `<leader>fh`               | Normal Mode | Open help tags                       |
| `<leader>fs`               | Normal Mode | Interactive string search            |
| `<leader>fd`               | Normal Mode | View diagnostics for the workspace   |
| `<leader>fw`               | Normal Mode | Search workspace symbols             |
| `<leader>fr`               | Normal Mode | Find references to a symbol          |
| `<leader>fi`               | Normal Mode | Locate implementations               |
| `<leader>fc`               | Normal Mode | Quickly execute Neovim commands      |
| `<leader>ft`               | Normal Mode | Explore syntax tree using Treesitter |
| `<leader>gs`               | Normal Mode | View Git status                      |
| `<leader>gc`               | Normal Mode | Browse Git commits                   |
| `<leader>gb`               | Normal Mode | Switch Git branches                  |
| `<leader>gf`               | Normal Mode | Locate files tracked by Git          |

### Telescope Insert Mode Commands

| Keymap  | Mode        | Description               |
| ------- | ----------- | ------------------------- |
| `<C-n>` | Insert Mode | Move to the next item     |
| `<C-p>` | Insert Mode | Move to the previous item |
| `<C-c>` | Insert Mode | Close Telescope window    |
| `<CR>`  | Insert Mode | Select default item       |
| `<C-x>` | Insert Mode | Select horizontally       |
| `<C-v>` | Insert Mode | Select vertically         |

---

## 🤖 Augment Code – Enterprise Grade Configuration

Augment understands your codebase. I've configured and optimized for engineers working on large enterprise applications. The configuration provides:

- **Precise workspace context:** Workspace folders are explicitly set (or auto‑updated) so that Augment’s AI engine has full knowledge of your codebase.
- **Custom key mappings:** Quick keybindings for accepting AI suggestions, launching chat, and triggering enterprise workflows (e.g. code review and refactoring prompts).
- **User command aliases:** Short command aliases to quickly invoke Augment functions from the command line.

### Key Mappings

🚀 Goto command: Use **`Ctrl+j`** to accept the suggested inline code completion!

| Mode   | Key Binding   | Command Executed                                                               | Description                                                      |
| ------ | ------------- | ------------------------------------------------------------------------------ | ---------------------------------------------------------------- |
| Insert | `<C-j> `      | `call augment#Accept()`                                                        | Accept the current inline suggestion.                            |
| Insert | `<CR>`        | `call augment#Accept("\n")`                                                    | Accept suggestion; if none, insert a newline.                    |
| Normal | `<leader>as`  | `:Augment status`                                                              | Show Augment status (sign-in and workspace sync info).           |
| Normal | `<leader>asi` | `:Augment signin`                                                              | Start the sign-in flow for Augment.                              |
| Normal | `<leader>ao`  | `:Augment signout`                                                             | Sign out from Augment.                                           |
| Normal | `<leader>ae`  | `:Augment enable`                                                              | Globally enable AI suggestions.                                  |
| Normal | `<leader>ad`  | `:Augment disable`                                                             | Globally disable AI suggestions.                                 |
| Normal | `<leader>al`  | `:Augment log`                                                                 | Open the Augment log for errors and debugging.                   |
| Normal | `<leader>ac`  | `:Augment chat`                                                                | Start a chat session to ask questions about your codebase.       |
| Normal | `<leader>an`  | `:Augment chat-new`                                                            | Begin a new chat conversation (clears previous context).         |
| Normal | `<leader>at`  | `:Augment chat-toggle`                                                         | Toggle the visibility of the chat panel.                         |
| Normal | `<leader>acp` | `:Augment chat Please review the current function for potential improvements.` | Send a code review prompt for the current function.              |
| Normal | `<leader>acf` | `:Augment chat Suggest refactoring for this block of code.`                    | Request refactoring suggestions for the selected code block.     |
| Visual | `<leader>ac`  | `:Augment chat`                                                                | Send selected text to Augment chat for context‑specific queries. |
| Visual | `<leader>aq`  | `:Augment chat`                                                                | Alternative visual mapping to chat with the selected text.       |

### User Command Aliases

| Alias          | Executes Command      | Description                             |
| -------------- | --------------------- | --------------------------------------- |
| `:AStatus`     | `Augment status`      | Display Augment’s current status.       |
| `:ASignin`     | `Augment signin`      | Launch the sign‑in process.             |
| `:ASignout`    | `Augment signout`     | Sign out of Augment.                    |
| `:AEnable`     | `Augment enable`      | Enable AI suggestions globally.         |
| `:ADisable`    | `Augment disable`     | Disable AI suggestions globally.        |
| `:ALog`        | `Augment log`         | View Augment’s log output.              |
| `:AChat`       | `Augment chat`        | Open a chat session for code questions. |
| `:AChatNew`    | `Augment chat-new`    | Start a new chat conversation.          |
| `:AChatToggle` | `Augment chat-toggle` | Toggle the chat panel display.          |

### Workspace Configuration & Auto-Update

Optional since I've configured Augment to autodetect current working directory opened with **`$ nvim .`**.

| Feature                  | Behavior                                                            | Description                                                                                                                                                     |
| ------------------------ | ------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Workspace Folders        | `vim.g.augment_workspace_folders` set via `get_workspace_folders()` | Defines which project directories are indexed by Augment. Uses the `ENTERPRISE_WORKSPACES` env variable (colon-separated) or defaults to the current directory. |
| Auto-Update on DirChange | `DirChanged` autocmd triggers `update_workspace()`                  | Automatically adds new workspace folders when you change directories in Neovim, ensuring up-to-date context.                                                    |

---

## 🤖 Github Copilot Integration

🚀 Copilot for code completion.

| Mode   | Key Mapping   | Command/Action           | Description                        |
| ------ | ------------- | ------------------------ | ---------------------------------- |
| Normal | `<leader>csi` | `:Copilot setup`         | Authenticate and enable Copilot    |
| Normal | `<leader>cd`  | `:Copilot disable`       | Disable Copilot inline suggestions |
| Normal | `<leader>ce`  | `:Copilot enable`        | Enable Copilot inline suggestions  |
| Normal | `<leader>cso` | `:Copilot signout`       | Sign out of GitHub Copilot         |
| Normal | `<leader>cs`  | `:Copilot status`        | Check the Copilot status           |
| Insert | `<leader>j  ` | `copilot#Accept("<CR>")` | Accept the current suggestion      |
| Insert | `<leader>cn`  | `copilot#Next()`         | Cycle to the next suggestion       |
| Insert | `<leader>cp`  | `copilot#Previous()`     | Cycle to the previous suggestion   |

Note: Either enable **Augment** or **Copilot**, not both at the same time!

---

## 🚀 **HTTP REST Client for Engineers**

I've integrated a high-performance, enterprise-grade HTTP REST client plugin for Neovim written entirely in Lua. This configuration is designed for large-scale web application microservices and large code bases—ideal for software engineers at major tech companies or startups.

### Features

- **Dynamic Environment Integration:**
  Automatically retrieves dynamic variables (such as service endpoints, auth tokens, and database URLs) from environment variables, shell commands (with caching), or input prompts.

- **Inline Configuration Overrides:**
  Customize behavior on a per-request basis using inline `@cfg` directives in your HTTP files.

- **Rich Response Views:**
  Display HTTP response details (body, headers, and additional HTTP info) with dedicated result pane settings.

- **Advanced Scripting:**
  Execute inline Lua scripts as post-request hooks to process responses and set global variables.

- **Extensive Logging:**
  Enterprise-grade debugging with verbose log levels for comprehensive troubleshooting.

- **Telescope Integration:**
  Use Telescope to easily select and register dotenv files.

**Supported Neovim Versions:**

- Latest stable (0.12.x — what this config is verified against)
- 0.11.x

### Dependencies:

- `curl` (mandatory)
- `jq` (optional, recommended for JSON formatting)
- `nvim-telescope/telescope.nvim` (optional, for dotenv selection)
- `hrsh7th/nvim-cmp` (optional, for auto-completion)

### HTTP File Syntax Overview

When writing your HTTP request definitions (saved as `.http` or `.resty` files), you can leverage:

- **Variable Declarations:**
  - Global: `@[variable]=value`
  - Dynamic (environment, shell command, prompt):
    - `@hostname = {{$HOSTNAME}}`
    - `@hostname = {{> ./myscript.sh}}` (non-cached)
    - `@hostname = {{>> ./myscript.sh}}` (cached)
    - `@hostname = {{:prompt}}`
- **Configuration Variables:**
  Override defaults with:
  `@cfg.timeout = 2000`
  `@cfg.check_json_body = true`
- **Request Definition:**
  Specify HTTP method, URL (e.g., using dynamic `{{hostname}}`), headers, and body.
- **Inline Lua Scripting Hooks:**
  Use `# @lang=lua` above Lua script blocks to process responses.
  ```http
  # @lang=lua
  > {%
    local body = ctx.json_body()
    if body.token then
      ctx.set("login.token", body.token)
    end
  --%}
  ```
- **Favorites:**
  Mark requests with delimiters (e.g., `### #my favorite`) to easily recall them via Telescope.

### **Commands & Key Mappings Table**

| **User / Alias**            | **Command / Key Mapping**                         | **Description**                                                                                          |
| --------------------------- | ------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| **Run Request**             | `<leader>api` → `:Resty run`                      | Runs the HTTP request under the cursor or selected in visual mode.                                       |
| **Open Result Pane**        | `<leader>apo` → `:Resty open`                     | Opens the response/result pane in a new window.                                                          |
| **Run Last Request**        | `<leader>apl` → `:Resty last`                     | Re-runs the last successfully executed request.                                                          |
| **Show Favorites**          | `<leader>apf` → `:Resty favorite`                 | Displays a Telescope view listing all requests marked as favorites.                                      |
| **Run Specific Favorite**   | `<leader>apm` → `:Resty favorite my favorite`     | Runs the favorite request named "my favorite", regardless of cursor location.                            |
| **Edit Logs File**          | `<leader>aplgs` or `<leader>apil` → `:Resty logs` | Opens the log file to review detailed execution logs.                                                    |
| **Edit Cookies File**       | `<leader>aprc` → `:Resty cookies`                 | Opens the cookies file used for session management.                                                      |
| **Show Environment File**   | `<leader>apre` → `:Resty env show`                | Displays the dotenv file currently registered with the active HTTP file.                                 |
| **Select Environment File** | `<leader>aprs` → `:Resty env select`              | Launches a Telescope view to select and register a dotenv file.                                          |
| **Set Environment File**    | `<leader>aprt` → `:Resty env set {path}`          | Registers a specific dotenv file for the current HTTP file by appending the file path after the command. |

---

## 📘 Markdown Preview ✨

**Markdown preview** transforms your **plain markdown text** into **beautifully rendered
documents** in **real time**. It offers live updates as you type, supports syntax
highlighting for code blocks, and allows customization with themes and styles.
This feature enhances your writing **experience** by providing **immediate visual
feedback**, making it easier to create well-formatted content.

### Commands & Key Mappings

| Key Mapping  | Command                  | Command                            |
| ------------ | ------------------------ | ---------------------------------- |
| `<leader>mp` | `:MarkdownPreview`       | Start the Markdown preview         |
| `<leader>ms` | `:MarkdownPreviewStop`   | Stop the Markdown preview          |
| `<leader>mt` | `:MarkdownPreviewToggle` | Toggle the Markdown preview on/off |

---

## 🩺 Troubleshooting

<details>
<summary><b>Health check first</b></summary>

```
:checkhealth
:Lazy
:Mason
:messages
:LspInfo
```

`:checkhealth lazy` validates the plugin manager; `:Lazy profile` shows
per-plugin startup cost.

</details>

<details>
<summary><b>Plugins in a weird state</b></summary>

```
:Lazy restore
```

restores every plugin to the exact pinned commit from `lazy-lock.json`.
Nuclear option:

```bash
rm -rf ~/.local/share/nvim/lazy
nvim    # bootstraps and restores everything fresh
```

</details>

<details>
<summary><b>Treesitter parser errors</b></summary>

The treesitter `main` branch builds parsers with the `tree-sitter` CLI:

```bash
npm install -g tree-sitter-cli
```

then inside Neovim: `:TSUpdate`

</details>

<details>
<summary><b>LSP server missing</b></summary>

`:Mason` and install what you need. Servers are auto-detected from the
toolchains present on your machine — install the toolchain (e.g. `go`,
`rustc`, `rebar3`) and restart Neovim to get its LSP automatically.

</details>

<details>
<summary><b>Telescope grep returns nothing</b></summary>

Install ripgrep (`rg`) — see the Requirements table above.

</details>

---

## Cool Pre-Configured Themes<a name="cool-themes"></a>

The themes are configured already but I've commented out rest. Feel free to
explore these themes in `lua/colson/plugins/ui.lua` and uncomment the one
that resonates with your taste!

Preconfigured themes:

#### **@ Github Themes** - Has flavors

![colson nvim](https://i.imgur.com/b8CtR0m.png)

#### **@ Catppuccin Theme** - Has flavors

![colson nvim](https://i.imgur.com/3a7HR6X.png)

![colson nvim](https://i.imgur.com/WYT8wcG.png)

![colson nvim](https://i.imgur.com/kjXd12x.png)

#### **@ Rose Pine Theme** - Has flavors

![colson nvim](https://i.imgur.com/y0ynRkc.png)

#### **@ Jetbrains IDE Theme**

![colson nvim](https://i.imgur.com/UfAYd7w.png)

#### **@ MoonFly Theme**

![colson nvim](https://i.imgur.com/CMJSu8Z.png)

#### **@ One Dark Theme** - Has flavors

![colson nvim](https://i.imgur.com/TuYbDx0.png)

#### **@ Nord Theme** - Has flavors

![colson nvim](https://i.imgur.com/jBOksVC.png)

#### **@ Tokyo Night Theme** - Has flavors 💎

![colson nvim](https://i.imgur.com/rAAkACt.png)

![colson nvim](https://i.imgur.com/a6fYwaE.png)

![colson nvim](https://i.imgur.com/pPxAM5P.png)

END:
May your coding journey with Neovim be nothing short of stellar! 🚀

Peace! 🕊
