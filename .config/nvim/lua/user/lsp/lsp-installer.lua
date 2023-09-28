local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local servers = {
    "lua_ls",
    "cssls",
    "html",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "rust_analyzer",
    "clangd", --[[ Generate compile_commands.json for cmake proj for indexing: cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ]]
    "texlab",
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server == "lua_ls" then
        local lua_ls_opts = require("user.lsp.settings.lua_ls")
        opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require("user.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "rust_analyzer" then
        local rt = require("rust-tools")
        rt.setup({
            tools = {
                on_initialized = function()
                    vim.cmd([[
                    autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
                    ]])
                end,
            },
            server = {
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

                    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })
                    --[[ vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", { buffer = bufnr }) ]]
                    vim.keymap.set('n', 'gf', function()
                        vim.lsp.buf.format { async = true }
                    end, { buffer = bufnr })
                    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { buffer = bufnr })
                    vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { buffer = bufnr })
                    vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = bufnr })
                    vim.keymap.set(
                        "n",
                        "<leader>lj",
                        "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
                        { buffer = bufnr }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>lk",
                        "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
                        { buffer = bufnr }
                    )
                    vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr })
                    vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", { buffer = bufnr })
                end,
            },
            settings = {
                -- to enable rust-analyzer settings visit:
                -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                ["rust-analyzer"] = {
                    -- enable clippy on save
                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
        })

        goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
end
