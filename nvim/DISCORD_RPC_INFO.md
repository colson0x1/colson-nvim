# 🎮 Discord Rich Presence Configuration

## ✅ Fixed: Timer No Longer Resets!

### What Was Changed
**File**: `~/.config/nvim/after/plugin/rpc.lua`
**Line 18**: Changed `global_timer = false` to `global_timer = true`

### What This Does
- ✅ Timer keeps counting when you switch files
- ✅ Shows total time in Neovim session
- ✅ Only resets when you close Neovim completely

---

## Current Configuration

### Display Settings
| Setting | Value | Description |
|---------|-------|-------------|
| `show_time` | `true` | Show elapsed time |
| `global_timer` | `true` | **Timer persists across file switches** |
| `main_image` | `language` | Show language icon (Java, JS, etc.) |
| `logo` | Custom URL | Your custom Neovim logo |
| `logo_tooltip` | "COLSON's NEOVIM IDE" | Tooltip text |

### Text Display
| Event | Format |
|-------|--------|
| Editing file | Shows filename |
| File explorer | "Browsing {name}" |
| Git commit | Shows commit info |
| Plugin manager | "Managing plugins" |
| Terminal | "Using Terminal" |
| Workspace | "root dir → /subdirs" |

---

## How It Works Now

### Before (Timer Reset Issue)
```
1. Open Neovim → Timer: 00:00
2. Edit file.js → Timer: 00:05
3. Switch to file.ts → Timer: 00:00 ❌ (RESET!)
4. Switch to file.java → Timer: 00:00 ❌ (RESET!)
```

### After (Fixed)
```
1. Open Neovim → Timer: 00:00
2. Edit file.js → Timer: 00:05
3. Switch to file.ts → Timer: 00:05 ✅ (CONTINUES!)
4. Switch to file.java → Timer: 00:10 ✅ (KEEPS COUNTING!)
5. Close Neovim → Timer resets for next session
```

---

## Discord Presence Display Format

### When Editing Java Files
```
🎮 Discord Display:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  COLSON's NEOVIM IDE – Engineered Excellence

  Editing Application.java
  java-test-project → /src/main/java

  ⏱️ Elapsed: 01:23:45
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### When Browsing Files
```
🎮 Discord Display:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  COLSON's NEOVIM IDE – Engineered Excellence

  Browsing nvim-tree
  java-test-project → /src

  ⏱️ Elapsed: 01:23:45
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Configuration Options

### Timer Behavior
```lua
show_time = true        -- Show timer (true/false)
global_timer = true     -- Persist across files (true/false)
```

**Recommendation**: Keep `global_timer = true` for accurate session tracking

### Debounce Timeout
```lua
debounce_timeout = 86400  -- 24 hours in seconds
```

This prevents Discord from rate-limiting you. Updates only happen when:
- You switch files
- You switch buffers
- After the debounce timeout

---

## Customization Options

### Change Logo
```lua
-- Option 1: Auto (uses Neovim logo)
logo = "auto"

-- Option 2: Custom URL (current)
logo = "https://i.imgur.com/RIq2lwF.png"

-- Option 3: Custom image from Discord assets
logo = "neovim"  -- Must upload to Discord app
```

### Change Main Image
```lua
-- Show language icon (Java, JS, Python, etc.)
main_image = "language"

-- Show your custom logo
main_image = "logo"
```

### Change Text Formats
```lua
-- Simple filename
editing_text = "%s"

-- With path
editing_text = "Editing %s"

-- Custom function
editing_text = function(filename)
    return "Hacking on " .. filename
end
```

---

## Advanced: Custom File Icons

Add custom icons for specific files:

```lua
file_assets = {
    -- Custom icon for specific files
    ["docker-compose.yml"] = { "Docker Compose", "docker" },
    ["Dockerfile"] = { "Docker", "docker" },

    -- Custom icon for file extensions
    [".env"] = { "Environment", "gear" },
    [".tsx"] = { "TypeScript React", "react" },
}
```

---

## Troubleshooting

### Timer Still Resets?
1. **Check config**: Verify `global_timer = true` in `rpc.lua`
2. **Restart Neovim**: Close completely and reopen
3. **Check Discord**: Make sure Discord is running

### Discord Not Showing?
1. **Check Discord settings**:
   - Settings → Activity Privacy
   - Enable "Display current activity as a status message"
2. **Restart Discord**: Quit and reopen Discord
3. **Check plugin**: `:lua print(package.loaded['neocord'] and 'loaded' or 'not loaded')`

### Want Different Timer Behavior?

**Option 1: Global Timer (Current - Recommended)**
```lua
global_timer = true  -- Timer persists across all files
```
- Shows total Neovim session time
- Best for showing how long you've been coding

**Option 2: Per-File Timer**
```lua
global_timer = false  -- Timer resets per file
```
- Shows time spent on current file
- Resets when switching files

**Option 3: No Timer**
```lua
show_time = false  -- Hide timer completely
```

---

## Manual Discord Update

If you want to manually trigger an update:

```vim
:lua require('neocord'):update()
```

---

## Configuration File Location

```
~/.config/nvim/after/plugin/rpc.lua
```

Edit with:
```bash
nvim ~/.config/nvim/after/plugin/rpc.lua
```

---

## Check Current Status

```vim
" Check if neocord is loaded
:lua print(vim.inspect(package.loaded['neocord']))

" Check config
:lua print(vim.inspect(require('neocord').config))
```

---

## Fun Customizations

### Show Project Type
```lua
workspace_text = function(project_name, filename)
    local project_type = "Project"

    -- Detect project type
    if vim.fn.filereadable("pom.xml") == 1 then
        project_type = "Maven Project"
    elseif vim.fn.filereadable("build.gradle") == 1 then
        project_type = "Gradle Project"
    elseif vim.fn.filereadable("package.json") == 1 then
        project_type = "Node.js Project"
    end

    return project_type .. " → " .. project_name
end
```

### Show Line Count
```lua
editing_text = function(filename)
    local line_count = vim.fn.line('$')
    return string.format("%s (%d lines)", filename, line_count)
end
```

### Show Git Branch
```lua
workspace_text = function(project_name, filename)
    local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
    if branch ~= "" then
        return project_name .. " [" .. branch .. "]"
    end
    return project_name
end
```

---

## Quick Reference

| What You Want | Setting |
|---------------|---------|
| Timer across files | `global_timer = true` ✅ |
| Timer per file | `global_timer = false` |
| No timer | `show_time = false` |
| Language icons | `main_image = "language"` ✅ |
| Custom logo | `main_image = "logo"` |
| Simple text | `editing_text = "%s"` ✅ |
| Custom text | `editing_text = function(f) ... end` |

---

## What's Currently Active

Your current setup shows:
- ✅ Custom Neovim logo with tooltip
- ✅ Language icons (Java, JS, Python, etc.)
- ✅ **Global timer (persists across files)**
- ✅ Clean filename display
- ✅ Project path with subdirectories
- ✅ 24-hour debounce timeout

---

**Status**: ✅ Timer fixed! Now it will keep counting as you switch between files in your Java projects!

**Test it**:
```bash
cd /tmp/java-test-project
nvim .
# Open multiple files and watch Discord - timer won't reset!
```
