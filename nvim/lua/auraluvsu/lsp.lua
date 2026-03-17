local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config['ts_ls'] = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact'
    },
    root_markers = {
        'tsconfig.json',
        'jsconfig.json',
        'package.json',
        '.git',
        'tsconfig.base.json',
    },
    capabilities = cmp_capabilities,
    flags = {
        allow_incremental_sync = false,
    },
}

vim.lsp.config['gopls'] = {
    cmd = { "gopls" },
    root_dir = function(fname)
        return vim.fs.root(fname, { "go.work", "go.mod", ".git" }) or vim.fn.getcwd()
    end,
    capabilities = cmp_capabilities,
    flags = {
        allow_incremental_sync = false,
    },
    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            usePlaceholders = true,
        },
    },
}
-- Lua
vim.lsp.config['lua_ls'] = {
    cmd = { "lua-language-server" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".git"
    },
    filetypes = {"lua"},
    capabilities = cmp_capabilities,
    flags = {
        allow_incremental_sync = false,
    },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

vim.lsp.config['hyprls'] = {
    cmd = { "hyprls" },
    root_dir = function(fname)
        return vim.fs.root(fname, { "hyprland.conf", "hyprlock.conf", "hyprpaper.conf" })
    end,
    capabilities = cmp_capabilities,
}

vim.lsp.config['clangd'] = {
    cmd = { "clangd", "--header-insertion=never" },
    root_dir = function(fname)
        return vim.fs.root(fname, { ".clangd", "compile_commands.json", "compile_flags.txt", ".git" })
    end,
    flags = {
        allow_incremental_sync = false,
    },
    capabilities = cmp_capabilities,
}

vim.lsp.config['zls'] = {
    cmd = { "zls" },
    root_dir = function(fname)
        return vim.fs.root(fname, { "build.zig", ".git" })
    end,
    capabilities = cmp_capabilities,
}

vim.lsp.config['rust_analyzer'] = {
    cmd = { "rust-analyzer" },
    root_dir = function(fname)
        return vim.fs.root(fname, { "Cargo.toml", ".git" })
    end,
    capabilities = cmp_capabilities,
    cargo = { allFeatures = true },
    diagnostics = {
        enable = true,
    },
    -- Important one ↓↓↓
    rustc = {
        source = "discover"
    }
}

vim.lsp.config['pyright'] = {
    cmd = { "pyright-langserver", "--stdio" },
    root_dir = function(fname)
        return vim.fs.root(fname, { ".py", ".git" }) or vim.fn.getcwd()
    end,
    capabilities = cmp_capabilities,
    flags = {
        allow_incremental_sync = false,
    },
}

-- JS & TS
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
    callback = function(args)
        vim.lsp.start(vim.lsp.config["ts_ls"], { bufnr = args.buf })
        vim.lsp.buf.format({ async = false })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
    callback = function(args)
        vim.lsp.buf.format({ async = false })
    end,
})
-- C & C++
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.c", "*.cc", "*.cpp", "*.h", "*.hh", "*.hpp" },
    callback = function(args)
        vim.lsp.start(vim.lsp.config["clangd"], { bufnr = args.buf })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.cc", "*.cpp", "*.h", "*.hh", "*.hpp" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Zig
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.zig" },
    callback = function(args)
        vim.lsp.start(vim.lsp.config["zls"], { bufnr = args.buf })
    end,
})

-- Python
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.py" },
    callback = function(args)
        vim.lsp.start(vim.lsp.config["pyright"], { bufnr = args.buf })
    end,
})

--Hyprland
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "hyprland.conf", "hyprlock.conf", "hyprpaper.conf" },
    callback = function(args)
        vim.lsp.start(vim.lsp.config["hyprls"], { bufnr = args.buf })
    end,
})

-- Rust
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.rs" },
    callback = function(args)
        vim.lsp.start(vim.lsp.config["rust_analyzer"], { bufnr = args.buf })
    end,
})

-- Go
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.go", "go.mod", "go.work" },
    callback = function(args)
        vim.lsp.start(vim.lsp.config['gopls'], { bufnr = args.buf })
    end,
})

-- Java
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.java" },
    callback = function(args)
        vim.lsp.start(vim.lsp.config['jdtls'], { bufnr = args.buf })
    end,
})
-- Lua
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.lua" },
    callback = function(args)
        vim.lsp.start(vim.lsp.config['lua_ls'], { bufnr = args.buf })
    end,
})

-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
-- vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     update_in_insert = true,
--     underline = true,
--     signs = true,
--     severity_sort = true,
-- })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    float = {
        prefix = "●",  -- this gives that nice bubble look
        border = "rounded",
        source = 'if_many',
        focusable = true,
        header = "",
        suffix = "",
        debounce = 0,
    },
})

local signs = {
    Error = " ",  -- or "󰅚 ", "✘", etc.
    Warn = " ",
    Hint = "󰌵 ",
    Info = " "
}

-- Keybind: toggle diagnostic float
vim.keymap.set("n", "ge", function()
    vim.diagnostic.open_float(nil, opts)
end, { desc = "Toggle diagnostic float" })

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
