return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["azure_pipelines_ls"] = {
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
