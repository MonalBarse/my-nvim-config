# 🚀 My Neovim Configuration

> A modern, feature-rich Neovim setup crafted for developers who want a powerful IDE experience without the bloat.

Welcome to my personal Neovim configuration! After years of tweaking, experimenting, and fine-tuning, I've built a setup that feels like home. Whether you're a web developer, Python enthusiast, Java coder, or polyglot programmer, this config has something for you.

## 🎯 Who Is This For?

This configuration is perfect for:

- **Developers** who want a blazing-fast, keyboard-driven workflow
- **Power users** transitioning from VSCode or JetBrains IDEs
- **Vim enthusiasts** looking for a modern, batteries-included setup
- **Anyone** who values aesthetics AND functionality

## ✨ What Makes This Special?

This isn't just another Neovim config. It's a carefully curated development environment that combines:

- 🎨 **Beautiful UI** with transparent backgrounds and the stunning TokyoNight theme
- 🧠 **Smart LSP integration** for multiple languages (TypeScript, JavaScript, Python, Java, Lua, HTML, CSS, and more)
- ⚡ **Lightning-fast fuzzy finding** with Telescope
- 🎯 **Intelligent code completion** powered by nvim-cmp
- 🌳 **Syntax highlighting on steroids** via Treesitter
- 🤖 **GitHub Copilot integration** for AI-assisted coding
- 📁 **Sleek file explorer** with NvimTree
- 🔍 **Advanced diagnostics** and linting
- 💅 **Auto-formatting** that just works
- 🎭 **Session management** to pick up right where you left off

## 🏗️ Configuration Structure

Here's how everything is organized:

```
my-nvim-config/
├── init.lua                    # Entry point - loads core and plugins
├── lazy-lock.json              # Plugin version lock file
└── lua/
    └── monal/
        ├── lazy.lua            # Lazy.nvim plugin manager setup
        ├── core/
        │   ├── init.lua        # Core module loader
        │   ├── options.lua     # Vim options (line numbers, tabs, etc.)
        │   └── keymaps.lua     # General keybindings
        └── plugins/
            ├── init.lua        # Essential plugins (plenary, tmux nav)
            ├── colorscheme.lua # TokyoNight theme with custom tweaks
            ├── telescope.lua   # Fuzzy finder configuration
            ├── treesitter.lua  # Syntax highlighting & parsing
            ├── nvim-cmp.lua    # Autocompletion engine
            ├── nvim-tree.lua   # File explorer
            ├── lualine.lua     # Statusline
            ├── bufferline.lua  # Buffer tabs
            ├── alpha.lua       # Start screen
            ├── copilot.lua     # GitHub Copilot
            ├── formatting.lua  # Code formatting (Conform)
            ├── linting.lua     # Code linting
            ├── gitsigns.lua    # Git integration
            ├── lazygit.lua     # LazyGit terminal UI
            ├── comment.lua     # Smart commenting
            ├── autopairs.lua   # Auto-close brackets
            ├── surround.lua    # Surround text objects
            ├── substitute.lua  # Enhanced substitution
            ├── which-key.lua   # Keybinding hints
            ├── dressing.lua    # Better UI elements
            ├── indent-blankline.lua  # Indentation guides
            ├── todo-comments.lua     # Highlight TODO comments
            ├── trouble.lua     # Pretty diagnostics list
            ├── auto-session.lua      # Session management
            ├── vim-maximizer.lua     # Window maximizer
            └── lsp/
                ├── mason.lua       # LSP installer
                └── lspconfig.lua   # LSP configurations
```

### How It All Works Together

1. **init.lua** is your starting point. It loads the core settings and initializes the plugin system.

2. **Core Module** (`lua/monal/core/`) sets up fundamental Vim behavior:
   - `options.lua`: Line numbers, indentation, search behavior, clipboard integration, and visual preferences
   - `keymaps.lua`: Leader key (Space), window management, tab navigation, and general shortcuts

3. **Lazy.nvim** (`lua/monal/lazy.lua`): A modern plugin manager that lazy-loads plugins for blazing fast startup times. It automatically installs and updates plugins.

4. **Plugins** (`lua/monal/plugins/`): Each plugin gets its own file with configuration, making it easy to enable, disable, or customize individual features.

5. **LSP Setup** (`lua/monal/plugins/lsp/`): Mason manages language server installations, while lspconfig sets up each language server with intelligent defaults.

## 🚀 Features Deep Dive

### 🎨 Theme & Aesthetics

The configuration uses the **TokyoNight** colorscheme with extensive customizations:

- Transparent backgrounds for a modern, floating window aesthetic
- Custom Telescope UI with borderless design
- Carefully tuned colors for maximum readability
- Visible line numbers with a bold, white cursor line number
- Subtle visual selections and cursor line highlighting

### 🔍 Telescope - Your Command Center

Telescope is the heart of file navigation:

- `<leader>ff` - Find files in your project
- `<leader>fr` - Browse recent files
- `<leader>fs` - Live grep (search text across files)
- `<leader>fc` - Find word under cursor
- `<leader>ft` - Search TODO comments

All with fuzzy matching and beautiful previews!

### 🧠 LSP - Intelligent Code Understanding

Full LSP support for:

- **JavaScript/TypeScript** (ts_ls)
- **Python** (pyright)
- **Java** (jdtls)
- **Lua** (lua_ls) with Neovim API awareness
- **HTML/CSS** (html, cssls)
- **GraphQL** (graphql)
- **Emmet** for rapid HTML/CSS

Key LSP commands:
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Show references
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `[d` / `]d` - Navigate diagnostics

### 💬 Autocompletion

nvim-cmp provides VSCode-like completions with:

- LSP-based suggestions
- Snippet expansion (LuaSnip)
- Buffer and path completions
- Beautiful icons via lspkind

Navigate with `<C-j>` / `<C-k>`, accept with `<CR>`, abort with `<C-e>`.

### 🌳 Treesitter - Syntax Highlighting++

Treesitter provides:

- Accurate syntax highlighting
- Smart indentation
- Auto-tag closing for HTML/JSX/TSX
- Incremental selection with `<C-space>`

Supports 20+ languages out of the box!

### 📁 File Explorer

NvimTree gives you a VSCode-like sidebar:

- `<leader>ee` - Toggle explorer
- `<leader>ef` - Open explorer on current file
- `<leader>ec` - Collapse all folders
- `<leader>er` - Refresh explorer

Features:
- Git status integration
- Custom folder icons
- Relative line numbers
- Filters out `.DS_Store` and other junk

### ✍️ Formatting & Linting

**Formatting** (Conform.nvim):
- Auto-format on save
- Manual format with `<leader>mp`
- Supports: Prettier, Stylua, Black, isort, google-java-format
- Language-specific configurations

**Linting** (nvim-lint):
- Real-time linting as you type
- Manual trigger with `<leader>l`
- Supports: ESLint (JS/TS), Pylint (Python)

### 🎯 Git Integration

- **Gitsigns**: Inline git blame, hunk navigation, and staging
- **LazyGit**: Full-featured git UI with `<leader>lg`
- Visual git diff in the sign column

### 🤖 GitHub Copilot

AI-powered code suggestions right in your editor:

- Automatically loads in insert mode
- Accept with `<Tab>`
- Seamlessly integrated with completions

### 🎭 Productivity Boosters

- **Alpha**: Beautiful start screen with quick actions
- **Auto-session**: Automatically saves and restores your workspace
- **Which-key**: Pop-up hints for keybindings (just press Space and wait!)
- **Comment.nvim**: Toggle comments with `gcc` (line) or `gc` (visual)
- **Autopairs**: Auto-close brackets, quotes, and tags
- **Surround**: Manipulate surrounding characters (brackets, quotes, tags)
- **Bufferline**: Visual buffer tabs at the top
- **Lualine**: Informative statusline with git info and LSP status
- **Indent-blankline**: Subtle indentation guides
- **Todo-comments**: Highlights TODO, HACK, WARN, PERF, NOTE, and FIX
- **Trouble**: Pretty diagnostics panel for errors and warnings
- **Vim-maximizer**: Toggle window maximization

## 📦 Installation

### Prerequisites

Make sure you have:

- **Neovim 0.9+** (`nvim --version`)
- **Git**
- **Node.js** (for language servers and Copilot)
- **Python 3** (for Python support)
- **A Nerd Font** (for icons) - I recommend [JetBrainsMono Nerd Font](https://www.nerdfonts.com/)
- **ripgrep** (`rg`) - for Telescope live grep
- **fd** (optional) - for faster file finding

### Setup Steps

1. **Backup your existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/MonalBarse/my-nvim-config.git ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```

4. **Let it cook!** 🍳
   - Lazy.nvim will automatically install all plugins
   - Mason will prompt to install language servers
   - Treesitter will download parsers

5. **Install language servers**:
   - Open Neovim
   - Run `:Mason`
   - Language servers should auto-install, but you can manually install more

6. **Set up GitHub Copilot** (optional):
   ```vim
   :Copilot setup
   ```
   Follow the prompts to authenticate.

### Post-Installation

After the initial setup:

- Run `:checkhealth` to verify everything is working
- Restart Neovim to ensure all plugins are loaded
- Press `<Space>` and wait to see Which-key hints
- Try `:Alpha` to see the start screen

## 🎮 Usage Guide

### Essential Keybindings

**Leader key**: `<Space>`

#### Navigation
- `jk` - Exit insert mode (instead of Esc)
- `<leader>nh` - Clear search highlights
- `<C-h/j/k/l>` - Navigate between splits (works with tmux!)

#### Window Management
- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<leader>se` - Make splits equal size
- `<leader>sx` - Close current split

#### Tabs
- `<leader>to` - Open new tab
- `<leader>tx` - Close tab
- `<leader>tn` - Next tab
- `<leader>tp` - Previous tab

#### File Explorer
- `<leader>ee` - Toggle NvimTree
- `<leader>ef` - Open on current file

#### Telescope
- `<leader>ff` - Find files
- `<leader>fr` - Recent files
- `<leader>fs` - Live grep
- `<leader>fc` - Find under cursor

#### Git
- `<leader>lg` - Open LazyGit

#### Formatting & Linting
- `<leader>mp` - Format file
- `<leader>l` - Lint current file

### Customizing the Config

#### Changing the Theme

Edit `lua/monal/plugins/colorscheme.lua`:

```lua
-- Try different TokyoNight variants
style = "Storm",  -- or "Night", "Moon", "Day"

-- Or use a different colorscheme entirely
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme catppuccin")
  end,
}
```

#### Adding a New Plugin

Create a new file in `lua/monal/plugins/` or add to an existing one:

```lua
return {
  "author/plugin-name",
  dependencies = { "optional-dependency" },
  config = function()
    -- Plugin configuration here
  end,
}
```

Restart Neovim, and Lazy.nvim will install it automatically!

#### Adjusting LSP Servers

Edit `lua/monal/plugins/lsp/mason.lua` to add/remove servers:

```lua
ensure_installed = {
  "html",
  "cssls",
  "rust_analyzer",  -- Add this!
  -- ... more servers
},
```

#### Modifying Keybindings

Edit `lua/monal/core/keymaps.lua`:

```lua
keymap.set("n", "<leader>yy", "<cmd>MyCommand<CR>", { desc = "My custom command" })
```

Or add plugin-specific keymaps in the respective plugin file.

## 🎨 Ricing & Customization Ideas

Want to take your setup to the next level? Here are some ideas:

### Visual Enhancements

1. **Different Colorschemes**: Try Catppuccin, Gruvbox, Kanagawa, or Rose Pine
2. **Transparency**: Already enabled! Tweak opacity in your terminal
3. **Custom statusline**: Modify the lualine theme in `lua/monal/plugins/lualine.lua`
4. **Dashboard art**: Change the ASCII art in `lua/monal/plugins/alpha.lua`
5. **Icons**: Install different Nerd Font variants for unique looks

### Functional Additions

1. **DAP (Debugger)**: Add `nvim-dap` for debugging support
2. **Testing**: Add `neotest` for running tests inside Neovim
3. **Markdown preview**: Add `markdown-preview.nvim` for live previews
4. **Terminal**: Add `toggleterm.nvim` for integrated terminals
5. **Database**: Add `vim-dadbod` for database management
6. **REST client**: Add `rest.nvim` for API testing
7. **Neorg/Obsidian**: Add note-taking capabilities

### Performance Tweaks

1. **Lazy loading**: Most plugins already lazy-load, but you can fine-tune more
2. **Disable unused features**: Comment out plugins you don't need
3. **Optimize Treesitter**: Adjust the file size limits in `treesitter.lua`

### Workflow Enhancements

1. **Tmux integration**: Already enabled! Works seamlessly with tmux
2. **Project-specific configs**: Use `.nvim.lua` in project roots
3. **Custom snippets**: Add your own in LuaSnip format
4. **Macros**: Record and save commonly used macros

### Terminal Integration

Make your terminal match your Neovim theme:

- **iTerm2/Alacritty/Kitty**: Import TokyoNight theme
- **Transparency**: Enable in terminal settings (already works with Neovim!)
- **Font**: JetBrainsMono Nerd Font Mono at size 13-14

## 🎯 Tips & Tricks

1. **Start screen**: Just run `nvim` without a file to see the Alpha dashboard
2. **Explore plugins**: Run `:Lazy` to see all plugins and their status
3. **Check health**: Run `:checkhealth` to diagnose issues
4. **Read docs**: Most plugins have extensive documentation - use `:h <plugin-name>`
5. **Experiment**: Don't be afraid to tweak! You can always revert changes with git
6. **Stay updated**: Run `:Lazy update` regularly to keep plugins fresh

## 🐛 Troubleshooting

**Plugins not installing?**
- Run `:Lazy clean` then `:Lazy install`

**LSP not working?**
- Run `:Mason` and ensure servers are installed
- Check `:LspInfo` to see active servers
- Try `:LspRestart`

**Treesitter errors?**
- Run `:TSUpdate` or `:TSInstall <language>`

**Slow startup?**
- Run `:Lazy profile` to see what's taking time
- Disable plugins you don't use

**Icons showing as boxes?**
- Install a Nerd Font and configure your terminal to use it

## 🙏 Credits & Inspiration

This configuration is built on the shoulders of giants:

- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Better syntax
- [LSP Config](https://github.com/neovim/nvim-lspconfig) - Language servers
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [TokyoNight](https://github.com/folke/tokyonight.nvim) - Beautiful theme
- And dozens of other amazing plugins!

Special thanks to the Neovim community for making this possible.

## 📝 License

This configuration is free to use, modify, and distribute. Feel free to fork it and make it your own!

---

**Enjoy your new Neovim setup!** 🎉

If you have questions, suggestions, or improvements, feel free to open an issue or PR. Happy coding! ⌨️✨
