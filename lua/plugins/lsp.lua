return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["azure_pipelines_ls"] = {
          -- Fallback to .git so any Git repo resolves a valid rootUri.
          -- Without this, opening a YAML file outside a directory containing
          -- "azure-pipelines.yml" sends rootUri=null, causing:
          -- [UriError]: Scheme is missing: {scheme: "", path: "null", ...}
          root_markers = { "azure-pipelines.yml", "azure-pipelines.yaml", ".git" },
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "/azure-pipelines*.y*l",
              },
            },
          },
        },
        graphql = {},
      },
      setup = {},
    },
  },
}
