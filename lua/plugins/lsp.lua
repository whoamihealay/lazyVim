return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
        ["azure_pipelines_ls"] = {
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "/azure-pipelines*.y*l",
              },
            },
          },
        },
        copilot = { enabled = false },
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = "auto" },
            format = auto_format,
          },
        },
        helm_ls = {},
        graphql = {},
        marksman = {},
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        tailwindcss = {
          filetypes_exclude = { "markdown" },
          filetypes_include = {},
          settings = {
            tailwindCSS = {
              includeLanguages = {
                elixir = "html-eex",
                eelixir = "html-eex",
                heex = "html-eex",
              },
            },
          },
        },
        terraformls = {},
        tsserver = {
          enabled = false,
        },
        ts_ls = {
          enabled = false,
        },
        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                maxInlayHintLength = 30,
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
          keys = {
            {
              "gD",
              function()
                local win = vim.api.nvim_get_current_win()
                local params = vim.lsp.util.make_position_params(win, "utf-16")
                LazyVim.lsp.execute({
                  command = "typescript.goToSourceDefinition",
                  arguments = { params.textDocument.uri, params.position },
                  open = true,
                })
              end,
              desc = "Goto Source Definition",
            },
            {
              "gR",
              function()
                LazyVim.lsp.execute({
                  command = "typescript.findAllFileReferences",
                  arguments = { vim.uri_from_bufnr(0) },
                  open = true,
                })
              end,
              desc = "File References",
            },
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
            {
              "<leader>cM",
              LazyVim.lsp.action["source.addMissingImports.ts"],
              desc = "Add missing imports",
            },
            {
              "<leader>cu",
              LazyVim.lsp.action["source.removeUnused.ts"],
              desc = "Remove unused imports",
            },
            {
              "<leader>cD",
              LazyVim.lsp.action["source.fixAll.ts"],
              desc = "Fix all diagnostics",
            },
            {
              "<leader>cV",
              function()
                LazyVim.lsp.execute({ command = "typescript.selectTypeScriptVersion" })
              end,
              desc = "Select TS workspace version",
            },
          },
        },
        yamlls = {
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          before_init = function(_, new_config)
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              "force",
              new_config.settings.yaml.schemas or {},
              require("schemastore").yaml.schemas()
            )
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
            },
          },
        },
      },
      setup = {
        eslint = function()
          if not auto_format then
            return
          end

          local formatter = LazyVim.lsp.formatter({
            name = "eslint: lsp",
            primary = false,
            priority = 200,
            filter = "eslint",
          })

          -- register the formatter with LazyVim
          LazyVim.format.register(formatter)
        end,
        ruff = function()
          Snacks.util.lsp.on({ name = ruff }, function(_, client)
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end)
        end,
        tailwindcss = function(_, opts)
          opts.filetypes = opts.filetypes or {}

          -- add default filetypes
          vim.list_extend(opts.filetypes, vim.lsp.config.tailwindcss.filetypes)

          -- Remove excluded filetypes
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, opts.filetypes)

          -- Add additional filetypes
          vim.list_extend(opts.filetypes, opts.filetypes_include or {})
        end,
        tsserver = function()
          -- disable tsserver
          return true
        end,
        ts_ls = function()
          -- disable tsserver
          return true
        end,
        vtsls = function(_, opts)
          if vim.lsp.config.denols and vim.lsp.config.vtsls then
            ---@param server string
            local resolve = function(server)
              local markers, root_dir = vim.lsp.config[server].root_markers, vim.lsp.config[server].root_dir
              vim.lsp.config(server, {
                root_dir = function(bufnr, on_dir)
                  local is_deno = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) ~= nil
                  if is_deno == (server == "denols") then
                    if root_dir then
                      return root_dir(bufnr, on_dir)
                    elseif type(markers) == "table" then
                      local root = vim.fs.root(bufnr, markers)
                      return root and on_dir(root)
                    end
                  end
                end,
              })
            end
            resolve("denols")
            resolve("vtsls")
          end

          Snacks.util.lsp.on({ name = "vtsls" }, function(buffer, client)
            client.commands["_typescript.moveToFileRefactoring"] = function(command, ctx)
              ---@type string, string, lsp.Range
              local action, uri, range = unpack(command.arguments)

              local function move(newf)
                client:request("workspace/executeCommand", {
                  command = command.command,
                  arguments = { action, uri, range, newf },
                })
              end

              local fname = vim.uri_to_fname(uri)
              client:request("workspace/executeCommand", {
                command = "typescript.tsserverRequest",
                arguments = {
                  "getMoveToRefactoringFileSuggestions",
                  {
                    file = fname,
                    startLine = range.start.line + 1,
                    startOffset = range.start.character + 1,
                    endLine = range["end"].line + 1,
                    endOffset = range["end"].character + 1,
                  },
                },
              }, function(_, result)
                ---@type string[]
                local files = result.body.files
                table.insert(files, 1, "Enter new path...")
                vim.ui.select(files, {
                  prompt = "Select move destination:",
                  format_item = function(f)
                    return vim.fn.fnamemodify(f, ":~:.")
                  end,
                }, function(f)
                  if f and f:find("^Enter new path") then
                    vim.ui.input({
                      prompt = "Enter move destination:",
                      default = vim.fn.fnamemodify(fname, ":h") .. "/",
                      completion = "file",
                    }, function(newf)
                      return newf and move(newf)
                    end)
                  elseif f then
                    move(f)
                  end
                end)
              end)
            end
          end)
          -- copy typescript settings to javascript
          opts.settings.javascript =
            vim.tbl_deep_extend("force", {}, opts.settings.typescript, opts.settings.javascript or {})
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = { "pyright", "basedpyright", "ruff", "ruff_lsp", ruff, lsp }
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
        opts.servers[server].enabled = server == lsp or server == ruff
      end
    end,
  },
  {
    "nvim-neotest/neotest-python",
  },
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {
      options = {
        notify_user_on_venv_activation = true,
      },
    },
    --  Call config for Python files and load the cached venv automatically
    ft = "python",
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
  },
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false,
  },
}
