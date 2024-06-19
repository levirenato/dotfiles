---@diagnostic disable: undefined-global
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        enabled = lsp == "pyright",
      },
      basedpyright = {
        enabled = lsp == "basedpyright",
      },
      [lsp] = {
        enabled = true,
      },
      ruff_lsp = {
        enabled = ruff == "ruff_lsp",
      },
      ruff = {
        enabled = ruff == "ruff",
      },
      [ruff] = {
        keys = {
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
      },
    },
    setup = {
      [ruff] = function()
        LazyVim.lsp.on_attach(function(client, _)
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end, ruff)
      end,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = {},
      },
      setup = {
        angularls = function()
          LazyVim.lsp.on_attach(function(client)
            client.server_capabilities.renameProvider = false
          end, "angularls")
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
        {
          name = "@angular/language-server",
          location = LazyVim.get_pkg_path("angular-language-server", "/node_modules/@angular/language-server"),
          enableForWorkspaceTypeScriptVersions = false,
        },
      })
    end,
  },
}
