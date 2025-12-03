# Enterprise Java Development Setup for Neovim

## Overview
This configuration provides a complete, enterprise-grade Java development environment optimized for distributed systems and microservices development at top tech companies.

## Features

### Core Capabilities
- ✅ **nvim-java** - Batteries-included Java support with auto-configuration
- ✅ **JDTLS** - Eclipse JDT Language Server for LSP features
- ✅ **DAP Integration** - Full debugging support with visual UI
- ✅ **Neotest** - Advanced test runner with visual feedback
- ✅ **Spring Boot Tools** - Spring framework integration
- ✅ **Lombok Support** - Annotation processing
- ✅ **nvim-springtime** - Spring Boot project generator

### Language Server Features
- Auto-completion with intelligent suggestions
- Go-to-definition, references, implementations
- Hover documentation
- Signature help
- Code actions and quick fixes
- Organize imports automatically
- Format on save
- Inlay hints (parameter names)
- Code lens (reference and implementation counts)

### Build Tool Support
- Maven (pom.xml)
- Gradle (build.gradle, build.gradle.kts)
- Multi-module projects
- Monorepo architecture support

## Installation

### Prerequisites
1. **Java Development Kit (JDK 17 or 21)**
   ```bash
   # Install OpenJDK on Arch Linux
   sudo pacman -S jdk-openjdk jdk21-openjdk
   ```

2. **Build Tools** (at least one)
   ```bash
   # Maven
   sudo pacman -S maven

   # Gradle
   sudo pacman -S gradle
   ```

3. **Neovim 0.10+**
   ```bash
   nvim --version
   ```

### Plugin Installation

1. **Open Neovim and sync plugins**:
   ```
   :PackerSync
   ```

2. **Wait for all plugins to install** (may take 2-3 minutes)

3. **Restart Neovim**

4. **Open a Java file** - nvim-java will auto-install:
   - jdtls (language server)
   - java-test (test runner)
   - java-debug-adapter (debugger)
   - spring-boot-tools (Spring support)
   - lombok-nightly (annotation processor)

5. **Verify Installation**:
   ```
   :checkhealth java
   ```

## Keybindings Reference

**Leader Key: `<Space>`**

### Build Operations
| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>jb` | JavaBuildWorkspace | Build entire workspace |
| `<leader>jc` | JavaBuildCleanWorkspace | Clean and rebuild |

### Run Operations
| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>jr` | JavaRunnerRunMain | Run main class |
| `<leader>jR` | JavaRunnerRunMain (with args) | Run with arguments (prompts) |
| `<leader>js` | JavaRunnerStopMain | Stop running application |
| `<leader>jl` | JavaRunnerToggleLogs | Toggle log window |

### Test Operations (Built-in)
| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>jt` | JavaTestRunCurrentClass | Run all tests in current file |
| `<leader>jm` | JavaTestRunCurrentMethod | Run test at cursor |
| `<leader>jT` | JavaTestViewLastReport | View test results |

### Test Operations (Neotest)
| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>jtn` | NeotestRunNearest | Run nearest test |
| `<leader>jtf` | NeotestRunFile | Run all tests in file |
| `<leader>jts` | NeotestSummary | Toggle test summary panel |
| `<leader>jto` | NeotestOutput | Open test output |
| `<leader>jtw` | NeotestWatchToggle | Toggle watch mode |

### Debug Operations
| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>jdc` | JavaDebugCurrentClass | Debug test class |
| `<leader>jdm` | JavaDebugCurrentMethod | Debug test method |
| `<leader>jdd` | JavaDapConfig | Configure DAP |
| `<leader>db` | DapToggleBreakpoint | Toggle breakpoint |
| `<leader>dB` | DapConditionalBreakpoint | Conditional breakpoint |
| `<leader>dlp` | DapLogPoint | Log point |
| `<F5>` | DapContinue | Continue execution |
| `<F10>` | DapStepOver | Step over |
| `<F11>` | DapStepInto | Step into |
| `<F12>` | DapStepOut | Step out |
| `<leader>dr` | DapRepl | Open REPL |
| `<leader>dl` | DapRunLast | Run last debug config |
| `<leader>du` | DapUiToggle | Toggle debug UI |
| `<leader>de` | DapEval | Evaluate expression |

### Refactoring Operations (Visual Mode)
| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>jrv` | ExtractVariable | Extract variable |
| `<leader>jra` | ExtractVariableAll | Extract all occurrences |
| `<leader>jrc` | ExtractConstant | Extract constant |
| `<leader>jrm` | ExtractMethod | Extract method |
| `<leader>jrf` | ExtractField | Extract field (normal mode) |

### Spring Boot Project Creation
| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>jn` | Springtime | Create new Spring Boot project |
| `<leader>ju` | SpringtimeUpdate | Update Spring Boot versions |

### JDK Management
| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>jv` | JavaSettingsChangeRuntime | Switch JDK version |

### LSP Keybindings (Already configured in lsp.lua)
| Keybinding | Command | Description |
|------------|---------|-------------|
| `gd` | GoToDefinition | Jump to definition |
| `K` | Hover | Show documentation |
| `<leader>vws` | WorkspaceSymbol | Search workspace symbols |
| `<leader>vd` | OpenDiagnostic | Show diagnostics |
| `<leader>dd` | OpenDiagnostic | Show diagnostics (alias) |
| `[d` | NextDiagnostic | Next diagnostic |
| `]d` | PrevDiagnostic | Previous diagnostic |
| `<leader>vca` | CodeAction | Show code actions |
| `<leader>vrr` | References | Show references |
| `<leader>vrn` | Rename | Rename symbol |
| `<C-h>` | SignatureHelp | Show signature (insert mode) |

## Commands Reference

### Java Commands
```vim
:JavaBuildBuildWorkspace      " Build workspace
:JavaBuildCleanWorkspace      " Clean workspace
:JavaRunnerRunMain            " Run main class
:JavaRunnerStopMain           " Stop application
:JavaRunnerToggleLogs         " Toggle logs
:JavaTestRunCurrentClass      " Run test class
:JavaTestRunCurrentMethod     " Run test method
:JavaTestDebugCurrentClass    " Debug test class
:JavaTestDebugCurrentMethod   " Debug test method
:JavaTestViewLastReport       " View test report
:JavaDapConfig                " Configure DAP
:JavaSettingsChangeRuntime    " Change JDK version
:JavaProjectInfo              " Show project info
:JavaRestart                  " Restart JDTLS
```

### Spring Boot Commands
```vim
:Springtime                   " Create Spring Boot project
:SpringtimeUpdate             " Update Spring Boot versions
```

## Configuration Files

### Location
- **Main Config**: `/home/colson/.config/nvim/after/plugin/java.lua`
- **Packer Plugins**: `/home/colson/.config/nvim/lua/colson/packer.lua`

### Java Settings Optimized For:
- **Heap Size**: 2GB min, 8GB max (adjust in java.lua:82-85)
- **GC**: G1 garbage collector
- **JDK Versions**: Java 17 (default), Java 21
- **Indentation**: 4 spaces (enterprise standard)
- **Code Style**: Google Java Style Guide compatible

## Project Structure Support

### Supported Project Types
1. **Maven Single Module**
   ```
   project/
   ├── pom.xml
   └── src/
       ├── main/java/
       └── test/java/
   ```

2. **Maven Multi-Module**
   ```
   parent/
   ├── pom.xml (parent)
   ├── module1/
   │   └── pom.xml
   └── module2/
       └── pom.xml
   ```

3. **Gradle Single Module**
   ```
   project/
   ├── build.gradle
   ├── settings.gradle
   └── src/
   ```

4. **Gradle Multi-Module**
   ```
   parent/
   ├── build.gradle
   ├── settings.gradle
   ├── module1/
   │   └── build.gradle
   └── module2/
       └── build.gradle
   ```

### Spring Boot Projects
- Fully supported with live information
- Code lens for Spring components
- Application.properties/yaml completion
- REST endpoint detection

## Auto-Features

### On File Open (*.java)
- ✅ JDTLS language server auto-starts
- ✅ Treesitter syntax highlighting
- ✅ Auto-completion enabled
- ✅ Diagnostics enabled
- ✅ 4-space indentation set

### On File Save (*.java)
- ✅ Auto-organize imports
- ✅ Auto-format code
- ✅ Remove unused imports

## Debugging Guide

### Setting Up Debugging
1. Open a Java file
2. Set breakpoints: `<leader>db`
3. Start debugging: `<F5>` (auto-discovers main classes)
4. Debug UI opens automatically

### Debug UI Layout
```
┌─────────────────────┬─────────────────────────────┐
│ Variables/Scopes    │                             │
│ Breakpoints         │   Source Code               │
│ Call Stack          │                             │
│ Watch Expressions   │                             │
├─────────────────────┴─────────────────────────────┤
│ REPL / Console                                    │
└───────────────────────────────────────────────────┘
```

### Remote Debugging (Microservices)
Create `.vscode/launch.json`:
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "java",
      "name": "Remote Debug Microservice",
      "request": "attach",
      "hostName": "localhost",
      "port": 5005
    }
  ]
}
```

Then start your service with:
```bash
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005 -jar app.jar
```

## Testing Guide

### Running Tests
1. **Single Test Method**
   - Place cursor on test method
   - Press `<leader>jm`

2. **All Tests in Class**
   - Open test class
   - Press `<leader>jt`

3. **Watch Mode** (continuous testing)
   - Press `<leader>jtw`
   - Tests run automatically on save

### Test Frameworks Supported
- ✅ JUnit 4
- ✅ JUnit 5 (Jupiter)
- ✅ TestNG
- ✅ Spring Boot Test

## Spring Boot Project Creation

### Using nvim-springtime
1. Press `<leader>jn` to open Spring Initializr
2. Fill in project details:
   - Project Type: Gradle/Maven
   - Language: Java/Kotlin
   - Spring Boot Version
   - Group ID
   - Artifact ID
   - Dependencies (with autocomplete!)
3. Press Enter to generate
4. Project downloads and opens

### Popular Dependencies
- Spring Web
- Spring Data JPA
- Spring Security
- Spring Boot DevTools
- Lombok
- PostgreSQL Driver
- MySQL Driver
- H2 Database
- Actuator

## Performance Tuning

### For Large Projects (500+ classes)
Edit `/home/colson/.config/nvim/after/plugin/java.lua`:

```lua
cmd = {
  'jdtls',
  '-Xms4g',   -- Increase to 4GB
  '-Xmx16g',  -- Increase to 16GB
  -- ... rest of config
}
```

### For Slow Imports
Add more exclusions:
```lua
imports = {
  exclusions = {
    "**/node_modules/**",
    "**/target/**",
    "**/build/**",
    "**/.gradle/**",
    "**/out/**",  -- Add your build output dirs
  }
}
```

## Troubleshooting

### 1. JDTLS Not Starting
```vim
:LspInfo                    " Check LSP status
:JavaRestart                " Restart JDTLS
:Mason                      " Check installed packages
```

### 2. No Auto-completion
```vim
:checkhealth nvim-cmp       " Check completion health
:checkhealth java           " Check Java health
```

### 3. Tests Not Running
- Ensure JUnit is in pom.xml/build.gradle
- Check Maven/Gradle dependencies are downloaded
- Run `:JavaTestViewLastReport` for errors

### 4. Debugger Not Working
```vim
:lua require('java').config_dap()  " Reconfigure DAP
```

### 5. Spring Boot Tools Not Working
- Ensure Spring Boot is in dependencies
- Check Spring Boot version >= 2.7
- Restart Neovim

### 6. Clean Restart (Nuclear Option)
```bash
# Delete caches
rm -rf ~/.cache/nvim/jdtls
rm -rf ~/.cache/jdtls
rm -rf ~/.local/share/nvim/jdtls

# Restart Neovim
nvim
```

## Best Practices

### Code Organization
1. Use packages properly: `com.company.product.feature`
2. Follow naming conventions: `UserService`, `userRepository`
3. Keep classes focused (Single Responsibility)

### Testing
1. Write tests first (TDD)
2. Use descriptive test names: `shouldReturnUserWhenValidIdProvided`
3. Use `@DisplayName` for better test reports

### Microservices Development
1. Use project-specific JDK versions (`:JavaSettingsChangeRuntime`)
2. Create separate workspace per service
3. Use remote debugging for deployed services
4. Leverage Spring Boot Tools for service discovery

### Git Integration
Add to `.gitignore`:
```
.classpath
.project
.settings/
.factorypath
bin/
target/
build/
.gradle/
```

## Advanced Features

### Custom Formatters
Place your formatter config at:
```
~/.config/google-java-format.xml
```

Then update `java.lua:135`:
```lua
format = {
  settings = {
    url = vim.fn.expand("~/.config/google-java-format.xml"),
    profile = "GoogleStyle",
  },
}
```

### Multiple JDK Versions
Configured JDKs in `java.lua:107-118`:
- Java 17 (default) - `/usr/lib/jvm/java-17-openjdk`
- Java 21 - `/usr/lib/jvm/java-21-openjdk`

Switch at runtime: `<leader>jv`

### Code Generation
Available via LSP code actions (`<leader>vca`):
- Generate constructors
- Generate getters/setters
- Generate toString()
- Generate equals() and hashCode()
- Generate delegate methods
- Override methods

## Resources

### Documentation
- nvim-java: https://github.com/nvim-java/nvim-java
- JDTLS: https://github.com/eclipse/eclipse.jdt.ls
- nvim-dap: https://github.com/mfussenegger/nvim-dap
- Neotest: https://github.com/nvim-neotest/neotest
- nvim-springtime: https://github.com/javiorfo/nvim-springtime

### Getting Help
```vim
:help java
:help lsp
:help dap
:help neotest
```

---

**Configuration Version**: 1.0.0
**Last Updated**: 2025-11-11
**Optimized For**: Enterprise Java, Distributed Systems, Microservices
**Author**: Configured for Distinguished Software Engineer at Top Tech Company
