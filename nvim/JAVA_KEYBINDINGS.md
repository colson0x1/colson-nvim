# 🎹 Complete Java Keybindings Reference

> **Leader Key = `<Space>`** (Already configured in your setup)

---

## 📦 Build & Run Operations

| Keybinding | Mode | Action | Description |
|------------|------|--------|-------------|
| `<Space>jb` | Normal | Build Workspace | Compile entire Java workspace |
| `<Space>jc` | Normal | Clean Workspace | Clean and rebuild project |
| `<Space>jr` | Normal | Run Main | Execute main class |
| `<Space>jR` | Normal | Run with Args | Run main class with custom arguments (prompts) |
| `<Space>js` | Normal | Stop Application | Stop running Java application |
| `<Space>jl` | Normal | Toggle Logs | Show/hide application logs |

**Mnemonic**: `j` = Java, `b` = Build, `r` = Run, `c` = Clean, `s` = Stop, `l` = Logs

---

## 🧪 Testing Operations (Built-in)

| Keybinding | Mode | Action | Description |
|------------|------|--------|-------------|
| `<Space>jt` | Normal | Run Test Class | Run all tests in current file |
| `<Space>jm` | Normal | Run Test Method | Run single test at cursor |
| `<Space>jT` | Normal | View Test Report | Show last test execution results |

**Mnemonic**: `j` = Java, `t` = Test, `m` = Method

---

## 🔬 Testing Operations (Neotest - Advanced)

| Keybinding | Mode | Action | Description |
|------------|------|--------|-------------|
| `<Space>jtn` | Normal | Test Nearest | Run nearest test to cursor |
| `<Space>jtf` | Normal | Test File | Run all tests in current file |
| `<Space>jts` | Normal | Test Summary | Toggle test summary panel |
| `<Space>jto` | Normal | Test Output | Open test output window |
| `<Space>jtw` | Normal | Test Watch | Toggle watch mode (auto-run on save) |

**Mnemonic**: `jt` = Java Test, `n` = Nearest, `f` = File, `s` = Summary, `o` = Output, `w` = Watch

---

## 🐛 Debugging Operations

### Java Debug Controls

| Keybinding | Mode | Action | Description |
|------------|------|--------|-------------|
| `<Space>jdc` | Normal | Debug Test Class | Debug all tests in current file |
| `<Space>jdm` | Normal | Debug Test Method | Debug single test at cursor |
| `<Space>jdd` | Normal | Configure DAP | Reconfigure debug adapter |

**Mnemonic**: `jd` = Java Debug, `c` = Class, `m` = Method, `d` = DAP

### General Debug Controls

| Keybinding | Mode | Action | Description |
|------------|------|--------|-------------|
| `<Space>db` | Normal | Toggle Breakpoint | Set/remove breakpoint at current line |
| `<Space>dB` | Normal | Conditional Breakpoint | Set breakpoint with condition (prompts) |
| `<Space>dlp` | Normal | Log Point | Set log point (prints without stopping) |
| `<F5>` | Normal | Continue | Start debugging or continue execution |
| `<F10>` | Normal | Step Over | Execute current line, skip function calls |
| `<F11>` | Normal | Step Into | Step into function call |
| `<F12>` | Normal | Step Out | Step out of current function |
| `<Space>dr` | Normal | REPL | Open debug REPL console |
| `<Space>dl` | Normal | Run Last | Repeat last debug configuration |
| `<Space>du` | Normal | Toggle Debug UI | Show/hide debug panels |
| `<Space>de` | Normal | Evaluate | Evaluate expression under cursor |

**Mnemonic**: `d` = Debug, `b` = Breakpoint, `r` = REPL, `l` = Last, `u` = UI, `e` = Eval

---

## 🔧 Refactoring Operations

| Keybinding | Mode | Action | Description |
|------------|------|--------|-------------|
| `<Space>jrv` | Visual | Extract Variable | Extract selection into variable |
| `<Space>jra` | Visual | Extract All | Extract all occurrences into variable |
| `<Space>jrc` | Visual | Extract Constant | Extract selection into constant |
| `<Space>jrm` | Visual | Extract Method | Extract selection into method |
| `<Space>jrf` | Normal | Extract Field | Extract value into class field |

**Mnemonic**: `jr` = Java Refactor, `v` = Variable, `a` = All, `c` = Constant, `m` = Method, `f` = Field

**Usage**: Select code in Visual mode first, then press keybinding

---

## 🌱 Spring Boot Operations

| Keybinding | Mode | Action | Description |
|------------|------|--------|-------------|
| `<Space>jn` | Normal | New Project | Create new Spring Boot project (Initializr) |
| `<Space>ju` | Normal | Update Versions | Update Spring Boot version list |

**Mnemonic**: `j` = Java, `n` = New, `u` = Update

---

## ☕ JDK Management

| Keybinding | Mode | Action | Description |
|------------|------|--------|-------------|
| `<Space>jv` | Normal | Change Version | Switch JDK version/runtime |

**Mnemonic**: `jv` = Java Version

---

## 🔍 LSP Features (Already in your config)

| Keybinding | Mode | Action | Description |
|------------|------|--------|-------------|
| `gd` | Normal | Go to Definition | Jump to symbol definition |
| `gD` | Normal | Go to Declaration | Jump to symbol declaration |
| `K` | Normal | Hover Info | Show documentation popup |
| `<Space>vws` | Normal | Workspace Symbols | Search symbols in workspace |
| `<Space>vd` | Normal | View Diagnostic | Show diagnostic float |
| `<Space>sd` | Normal | Show Diagnostic | Show diagnostic float (alias) |
| `<Space>dd` | Normal | Show Diagnostic | Show diagnostic float (alias) |
| `[d` | Normal | Next Diagnostic | Jump to next error/warning |
| `]d` | Normal | Previous Diagnostic | Jump to previous error/warning |
| `<Space>vca` | Normal | Code Actions | Show available code actions |
| `<Space>vrr` | Normal | References | Show all references |
| `<Space>vrn` | Normal | Rename | Rename symbol |
| `<Ctrl-h>` | Insert | Signature Help | Show function signature |

**Mnemonic**: `v` = View, `ws` = Workspace, `d` = Diagnostic, `ca` = Code Action, `rr` = References, `rn` = Rename

---

## 📊 Quick Summary Tables

### 🎯 Top 10 Most Used (Memorize These First!)

| # | Keybinding | What It Does | When to Use |
|---|------------|--------------|-------------|
| 1 | `<Space>jr` | Run main class | After writing code |
| 2 | `<Space>jb` | Build project | Before running |
| 3 | `<Space>jt` | Run all tests | Test entire class |
| 4 | `<Space>jm` | Run single test | Test one method |
| 5 | `gd` | Go to definition | Navigate code |
| 6 | `K` | Show docs | Learn about method |
| 7 | `<Space>vca` | Code actions | Quick fixes |
| 8 | `<Space>db` | Toggle breakpoint | Debugging |
| 9 | `<F5>` | Start/continue debug | Debugging |
| 10 | `<Space>jn` | New Spring project | Start new project |

---

### 🔤 All Keybindings by Category

#### Build Category (`j` prefix)
```
<Space>jb  →  Build
<Space>jc  →  Clean
<Space>jr  →  Run
<Space>jR  →  Run with args
<Space>js  →  Stop
<Space>jl  →  Logs
<Space>jv  →  Version (JDK)
<Space>jn  →  New (Spring project)
<Space>ju  →  Update (Spring versions)
```

#### Test Category (`jt` prefix)
```
<Space>jt   →  Test class
<Space>jm   →  Test method
<Space>jT   →  Test report
<Space>jtn  →  Test nearest
<Space>jtf  →  Test file
<Space>jts  →  Test summary
<Space>jto  →  Test output
<Space>jtw  →  Test watch
```

#### Debug Category (`jd` and `d` prefix)
```
<Space>jdc  →  Debug class
<Space>jdm  →  Debug method
<Space>jdd  →  Debug DAP config
<Space>db   →  Breakpoint
<Space>dB   →  Conditional breakpoint
<Space>dlp  →  Log point
<Space>dr   →  REPL
<Space>dl   →  Last config
<Space>du   →  UI toggle
<Space>de   →  Eval
<F5>        →  Continue
<F10>       →  Step over
<F11>       →  Step into
<F12>       →  Step out
```

#### Refactor Category (`jr` prefix, Visual mode)
```
<Space>jrv  →  Extract variable
<Space>jra  →  Extract all occurrences
<Space>jrc  →  Extract constant
<Space>jrm  →  Extract method
<Space>jrf  →  Extract field
```

#### LSP Category (`v` prefix)
```
gd          →  Go to definition
K           →  Hover info
<Space>vws  →  Workspace symbols
<Space>vd   →  View diagnostic
<Space>vca  →  Code actions
<Space>vrr  →  References
<Space>vrn  →  Rename
[d          →  Next diagnostic
]d          →  Previous diagnostic
```

---

## 🎨 Visual Guide

### Prefix Meanings
```
<Space>j     →  Java operations
<Space>jt    →  Java Testing
<Space>jd    →  Java Debugging
<Space>jr    →  Java Refactoring
<Space>d     →  General Debugging
<Space>v     →  View/LSP operations
<F-keys>     →  Debug execution control
```

### Mnemonic System
```
b = Build       r = Run         c = Clean       s = Stop
t = Test        m = Method      n = New/Nearest f = File
d = Debug       u = UI/Update   v = Variable    a = All
e = Eval        l = Logs/Last   w = Watch       o = Output
```

---

## 🎯 Workflow Examples

### Example 1: Run Your Application
```
1. <Space>jb  →  Build the project
2. <Space>jr  →  Run main class
3. <Space>jl  →  View logs if needed
4. <Space>js  →  Stop when done
```

### Example 2: Test-Driven Development
```
1. Write a test method
2. <Space>jm  →  Run the test (it fails)
3. Write implementation code
4. <Space>jm  →  Run test again (passes!)
5. <Space>jt  →  Run all tests to verify
```

### Example 3: Debug a Test
```
1. <Space>db  →  Set breakpoint on line
2. <Space>jdm →  Debug test method
3. <F11>      →  Step into method
4. <Space>de  →  Evaluate variable
5. <F5>       →  Continue execution
6. <Space>du  →  Close debug UI
```

### Example 4: Refactor Code
```
1. Select code in Visual mode (v or V)
2. <Space>jrm →  Extract into method
3. Type new method name
4. <Space>vca →  Show code actions
5. Choose "Generate JavaDoc"
```

### Example 5: Create Spring Boot Project
```
1. <Space>jn  →  Open Spring Initializr
2. Select: Gradle, Java, Spring Boot 3.4.1
3. Add dependencies (type to search):
   - Spring Web
   - Spring Data JPA
   - PostgreSQL Driver
4. Press Enter to generate
5. Project opens automatically!
```

---

## 🚀 Pro Tips

### Speed Typing
- Type `sysout` then Tab → `System.out.println()`
- Type `psvm` then Tab → `public static void main(String[] args)`
- Type `fori` then Tab → `for (int i = 0; i < ; i++)`

### Quick Navigation
- `<Space>ff` → Find files (Telescope)
- `<Space>fg` → Find in files (grep)
- `<Space>fb` → Find buffers

### Code Actions (`<Space>vca`)
When you press this, you can:
- Generate constructor
- Generate getters/setters
- Generate toString()
- Generate equals() and hashCode()
- Organize imports
- Add JavaDoc
- Override methods
- Implement interface methods
- Suppress warnings

### Watch Mode Testing
```
<Space>jtw  →  Enable watch mode

Now every time you save a Java file:
✓ Tests run automatically
✓ See results instantly
✓ Perfect for TDD!
```

---

## 🎓 Learning Path

### Week 1: Master These
```
<Space>jr   (Run)
<Space>jb   (Build)
gd          (Go to definition)
K           (Hover docs)
```

### Week 2: Add These
```
<Space>jt   (Test class)
<Space>jm   (Test method)
<Space>vca  (Code actions)
<Space>vrn  (Rename)
```

### Week 3: Add These
```
<Space>db   (Breakpoint)
<F5>        (Debug)
<Space>jrm  (Extract method)
<Space>jn   (New Spring project)
```

### Month 1+: Master Everything!
By this point, your fingers will know all keybindings automatically!

---

## 📍 File Location

This file is located at:
```
~/.config/nvim/JAVA_KEYBINDINGS.md
```

All keybindings are defined in:
```
~/.config/nvim/after/plugin/java.lua
```

Lines 481-655 contain all the keybinding definitions.

---

## 🎉 Quick Command Reference

Need to run Vim commands? Here are common ones:

```vim
:JavaRestart              " Restart JDTLS
:Mason                    " Manage packages
:LspInfo                  " Show LSP status
:JavaProjectInfo          " Show project info
:checkhealth java         " Health check
:Springtime               " Same as <Space>jn
:JavaBuildBuildWorkspace  " Same as <Space>jb
:JavaRunnerRunMain        " Same as <Space>jr
```

---

**Pro Tip**: Print this page and keep it next to your keyboard for the first week!

After that, the keybindings will be muscle memory! 💪
