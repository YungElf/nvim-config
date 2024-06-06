# My Neovim Configuration

This is my basic Neovim config. Below is a short list of plugins and their purposes, in case anyone is curious. I've been trying to use less IntelliJ and more Neovim, although the database integration in IntelliJ makes that hard to maintain.

## Plugins

### Catppuccin
- **Description:** Pretty self-explanatory. Classic theme that looks alright.
- **Notes:** Not my favorite but it is maintained and probably safe to assume it always will be.

### Lsp-config
- **Description:** This actually includes 3 plugins: `mason`, `mason-lsp-config`, and Neovim's own `nvim-lspconfig`.
- **Purpose:** Setting up my LSPs, currently for Lua (duh for the plugins), C (some personal projects), and Java (my first language and main language as of right now).
- **Extras:** I also set up some basic keybinds for "go to definition" and "hover" because I found them useful.

### Lualine
- **Description:** Basic Neovim statusline.
- **Purpose:** Pretty useful but simple.

### Neotree
- **Description:** A file tree I can turn on and off.
- **Purpose:** I started using this in my more robust editors too, and I think it's a decent habit to have.

### Telescope
- **Description:** Live grep and find files.
- **Note:** I haven't found much use for this one yet, but most of my larger projects use build systems and are universally in IntelliJ. It hasn't been an issue finding stuff in Neovim, but it's a good option to have.

### Treesitter
- **Description:** Provides better highlighting.
- **Purpose:** Just looks better and is slightly more readable than the default highlighting.
