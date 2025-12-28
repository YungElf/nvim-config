-- ~/.config/nvim/lua/plugins/lsp-config.lua
return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig", -- still provides the server definitions
    },
    opts = {
      -- install these via Mason if missing
      ensure_installed = { "lua_ls", "clangd", "jdtls" },

      -- mason-lspconfig will automatically call vim.lsp.enable() for servers
      -- installed via Mason (default is true). :contentReference[oaicite:1]{index=1}
      automatic_enable = true,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      -- Keymaps when an LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
          map("n", "K", vim.lsp.buf.hover, "LSP: Hover")
          map("n", "gr", vim.lsp.buf.references, "LSP: References")
          map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
        end,
      })

      -- Capabilities (nice with nvim-cmp if you use it)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- New API: configure servers with vim.lsp.config(...)
      -- (instead of require('lspconfig').X.setup(...)) :contentReference[oaicite:2]{index=2}

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.config("jdtls", {
        capabilities = capabilities,
      })

      -- If you ever set automatic_enable = false, you’d manually enable:
      -- vim.lsp.enable({ "lua_ls", "clangd", "jdtls" })
    end,
  },
}

