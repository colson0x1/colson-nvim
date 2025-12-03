# Java Development Quick Reference

## Leader Key: `<Space>`

### Most Used Commands

```
BUILD & RUN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<leader>jb  →  Build workspace
<leader>jr  →  Run main class
<leader>js  →  Stop application

TESTING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<leader>jm  →  Run test at cursor
<leader>jt  →  Run all tests in file
<leader>jts →  Toggle test summary

DEBUGGING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<leader>db  →  Toggle breakpoint
<F5>        →  Start/Continue
<F10>       →  Step over
<F11>       →  Step into
<leader>du  →  Toggle debug UI

REFACTORING (Visual Mode)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<leader>jrv →  Extract variable
<leader>jrm →  Extract method
<leader>jrc →  Extract constant

LSP FEATURES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
gd          →  Go to definition
K           →  Show documentation
<leader>vca →  Code actions
<leader>vrn →  Rename symbol
<leader>vrr →  Find references

PROJECT CREATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<leader>jn  →  New Spring Boot project
```

## Auto-Features

- ✓ Auto-organize imports on save
- ✓ Auto-format code on save
- ✓ Auto-completion (type to activate)
- ✓ Real-time diagnostics
- ✓ 4-space indentation for Java

## Quick Commands

```vim
:JavaRestart          " Restart language server
:Mason                " Manage LSP packages
:LspInfo              " Show LSP status
:JavaProjectInfo      " Show project info
```

## Test Java Setup

```bash
# 1. Open test project
cd /tmp/java-test-project
nvim src/main/java/com/example/demo/Application.java

# 2. In Neovim:
#    - Type to see auto-completion
#    - Press 'gd' on a method to jump to definition
#    - Press '<leader>jb' to build
#    - Press '<leader>jr' to run

# 3. Open test file
:e src/test/java/com/example/demo/ApplicationTest.java

# 4. Run tests:
#    - Press '<leader>jt' to run all tests
#    - Press '<leader>jm' on a test method to run single test
```

## Common Issues

**Problem**: LSP not starting
**Solution**: `:LspRestart` or `:Mason` to check packages

**Problem**: No completions
**Solution**: Wait 5-10 seconds after opening file, or `:checkhealth`

**Problem**: Tests not found
**Solution**: Ensure JUnit is in pom.xml/build.gradle

## File Locations

- Config: `~/.config/nvim/after/plugin/java.lua`
- Docs: `~/.config/nvim/JAVA_SETUP.md`
- Cache: `~/.cache/nvim/jdtls/`

---
Press `<leader>jn` to create your first Spring Boot project!
