return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "yamlls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      vim.lsp.config("yamlls", {
        root_markers = {},
        settings = {
          yaml = {
            schemas = {
              ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = { "*.k8s.yaml", "*.k8s.yml", "k8s/**/*.yaml" },
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = { "docker-compose*.yml", "compose*.yml", "podman-compose*.yml" },
            },
            validate = true,
            completion = true,
            hover = true,
          },
        },
      })
      vim.lsp.enable({ "lua_ls", "pyright", "yamlls" })
    end,
  },
}
