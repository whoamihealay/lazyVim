# 🚀 Neovim Configuration

A personal Neovim configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim) with customizations for Python, TypeScript/JavaScript, Go, Terraform, and more.

## ✨ Features

- **LazyVim Base** - Modern Neovim distribution with sensible defaults and lazy-loading
- **AI-Powered Coding** - Integrated Copilot and Avante for AI assistance
- **Multi-Language Support** - LSP configurations for Python, TypeScript, Go, Terraform, YAML, and more
- **Beautiful UI** - Multiple colorscheme options (Tokyo Night, Rose Pine, Gruvbox)
- **Fast Navigation** - Harpoon for quick file switching, Snacks.nvim for fuzzy finding
- **Markdown Preview** - Live preview and render-markdown for enhanced markdown editing

## 📦 Plugin Highlights

### AI & Completion

- [**avante.nvim**](https://github.com/yetone/avante.nvim) - AI-powered code assistant with Copilot integration
- [**copilot.lua**](https://github.com/zbirenbaum/copilot.lua) - GitHub Copilot support
- [**blink.cmp**](https://github.com/saghen/blink.cmp) - Fast completion engine with multiple sources

### Navigation & Search

- [**harpoon**](https://github.com/ThePrimeagen/harpoon) - Quick file navigation (branch: harpoon2)
- [**snacks.nvim**](https://github.com/folke/snacks.nvim) - Fuzzy finder, file explorer, git integration, terminal

### LSP & Development

- **nvim-lspconfig** - Pre-configured LSP servers:
  - Python: `pyright`, `ruff`
  - TypeScript/JavaScript: `vtsls`
  - Go: `gopls`
  - Terraform: `terraformls`
  - YAML: `yamlls` with SchemaStore integration
  - Ansible: `ansiblels`
  - Tailwind CSS: `tailwindcss`
  - And more...

### Formatting & Linting

- [**conform.nvim**](https://github.com/stevearc/conform.nvim) - Code formatting with:
  - Lua: `stylua`
  - Go: `gofmt`
  - JavaScript/TypeScript: `prettier`
  - Python: `ruff`
  - Terraform: `terraform_fmt`
  - Markdown: `prettier`, `markdownlint-cli2`

### Syntax & Editing

- [**nvim-treesitter**](https://github.com/nvim-treesitter/nvim-treesitter) - Advanced syntax highlighting
- [**nvim-ts-autotag**](https://github.com/windwp/nvim-ts-autotag) - Auto close/rename HTML tags

### Colorschemes

- [**tokyonight.nvim**](https://github.com/folke/tokyonight.nvim) (default)
- [**rose-pine**](https://github.com/rose-pine/neovim)
- [**gruvbox.nvim**](https://github.com/ellisonleao/gruvbox.nvim)

## ⌨️ Key Bindings

### General

| Key          | Description           |
| ------------ | --------------------- |
| `<Space>`    | Leader key            |
| `<Tab>`      | Next window           |
| `<S-Tab>`    | Previous window       |
| `<leader>fd` | File explorer (netrw) |
| `<Esc><Esc>` | Exit terminal mode    |

### Navigation & Scrolling

| Key                       | Description                            |
| ------------------------- | -------------------------------------- |
| `<C-d>`                   | Scroll down and center                 |
| `<C-u>`                   | Scroll up and center                   |
| `n` / `N`                 | Next/Previous search result (centered) |
| `<C-k>` / `<C-j>`         | Next/Previous quickfix item            |
| `<leader>k` / `<leader>j` | Next/Previous location list item       |

### Harpoon

| Key           | Description               |
| ------------- | ------------------------- |
| `<leader>ha`  | Add file to harpoon       |
| `<leader>hp`  | Prepend file to harpoon   |
| `<leader>hm`  | Toggle harpoon quick menu |
| `<leader>1-9` | Jump to harpoon file 1-9  |

### Snacks Picker & Explorer

| Key          | Description            |
| ------------ | ---------------------- |
| `<leader>e`  | File Explorer          |
| `<leader>/`  | Grep (search in files) |
| `<leader>fb` | Find buffers           |
| `<leader>fc` | Find config files      |
| `<leader>fg` | Find git files         |
| `<leader>fr` | Recent files           |
| `<leader>fp` | Projects               |

### Git (Snacks)

| Key          | Description  |
| ------------ | ------------ |
| `<leader>gg` | Lazygit      |
| `<leader>gb` | Git branches |
| `<leader>gl` | Git log      |
| `<leader>gs` | Git status   |
| `<leader>gd` | Git diff     |
| `<leader>gf` | Git file log |

### LSP

| Key           | Description          |
| ------------- | -------------------- |
| `gd`          | Go to definition     |
| `gD`          | Go to declaration    |
| `gr`          | References           |
| `gI`          | Go to implementation |
| `<leader>zig` | Restart LSP          |

### AI (Avante)

| Key          | Description            |
| ------------ | ---------------------- |
| `<leader>aa` | Ask Avante             |
| `<leader>ac` | Chat with Avante       |
| `<leader>ae` | Edit with Avante       |
| `<leader>at` | Toggle Avante          |
| `<leader>am` | Select Avante model    |
| `<leader>ap` | Switch Avante provider |

### Editing

| Key                  | Description                          |
| -------------------- | ------------------------------------ |
| `J` / `K` (visual)   | Move selection down/up               |
| `<leader>p` (visual) | Paste over selection without yanking |
| `<leader>y`          | Yank to system clipboard             |
| `<leader>Y`          | Yank line to system clipboard        |
| `<leader>d`          | Delete to void register              |
| `<leader>s`          | Substitute word under cursor         |

### Misc

| Key          | Description              |
| ------------ | ------------------------ |
| `<C-p>`      | Toggle terminal          |
| `<leader>u`  | Undo history             |
| `<leader>um` | Toggle render markdown   |
| `<leader>cp` | Markdown preview toggle  |
| `<leader>cv` | Select Python VirtualEnv |

## 🛠️ Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- `ripgrep` (for grep functionality)
- Node.js (for some LSP servers and Copilot)

### Steps

1. **Backup your existing config** (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   mv ~/.local/state/nvim ~/.local/state/nvim.bak
   mv ~/.cache/nvim ~/.cache/nvim.bak
   ```

2. **Clone this repository**:

   ```bash
   git clone https://github.com/YOUR_USERNAME/nvim ~/.config/nvim
   ```

3. **Start Neovim**:

   ```bash
   nvim
   ```

   Lazy.nvim will automatically bootstrap and install all plugins on first launch.

4. **Authenticate Copilot** (optional):
   ```vim
   :Copilot auth
   ```

## 📁 Structure

```
~/.config/nvim/
├── init.lua                 # Entry point - loads lazy.nvim
├── lua/
│   ├── config/
│   │   ├── autocmds.lua     # Auto commands
│   │   ├── keymaps.lua      # Custom key mappings
│   │   ├── lazy.lua         # Lazy.nvim setup and plugin specs
│   │   └── options.lua      # Neovim options
│   └── plugins/
│       ├── ai.lua           # Avante & Copilot configuration
│       ├── cmp.lua          # Blink.cmp completion setup
│       ├── colors.lua       # Colorscheme configurations
│       ├── conform.lua      # Formatter configuration
│       ├── harpoon.lua      # Harpoon file navigation
│       ├── lsp.lua          # LSP server configurations
│       ├── markdown.lua     # Markdown preview & rendering
│       ├── mason.lua        # Mason package manager config
│       ├── snacks.lua       # Snacks.nvim configuration
│       └── treesitter.lua   # Treesitter configuration
├── lazyvim.json             # LazyVim state
├── stylua.toml              # Stylua formatter config
└── LICENSE                  # Apache 2.0 License
```

## 🔧 Customization

### Adding a New Plugin

Create a new file in `lua/plugins/` or add to an existing file:

```lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",
    opts = {
      -- plugin options
    },
  },
}
```

### Changing the Colorscheme

Edit `lua/plugins/colors.lua` and update the LazyVim opts:

```lua
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "rose-pine", -- or "gruvbox", "tokyonight"
  },
}
```

### Adding LSP Servers

Edit `lua/plugins/lsp.lua` to add new servers, and `lua/plugins/mason.lua` to ensure they're installed via Mason.

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [LazyVim](https://github.com/LazyVim/LazyVim) - The base distribution
- [folke](https://github.com/folke) - For lazy.nvim, tokyonight, and snacks.nvim
- [ThePrimeagen](https://github.com/ThePrimeagen) - For harpoon and inspiration
