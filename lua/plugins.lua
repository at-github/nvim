local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Compile & sync each time this file is edited & source it !
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive' -- Git commands

  use 'EdenEast/nightfox.nvim' -- Themes

  use 'kyazdani42/nvim-web-devicons' -- Icons

  use { -- Themes
    'navarasu/onedark.nvim',
    config = function() require'plugins.onedark' end
  }

  use { -- status line
    'feline-nvim/feline.nvim',
    branch = '0.5-compat',
    config = function() require'plugins.feline' end
  }

  use 'nelstrom/vim-visual-star-search'

  use 'junegunn/goyo.vim'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require'plugins.treesitter' end
  }

  use { -- need neovim > 0.8
    'kyazdani42/nvim-tree.lua',
    opt = true,
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    cmd = {'NvimTreeToggle', 'NvimTreeFindFile'},
    config = function() require'plugins.tree' end
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require'plugins.telescope' end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require'plugins.indent-blankline' end
  }

  use {
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function() require'nvim-surround'.setup() end
  }

  use {
    'terrortylor/nvim-comment',
    config = function() require'nvim_comment'.setup() end
  }

  use{
    'windwp/nvim-autopairs',
    config = function() require'plugins.nvim-autopairs' end
  }

  use('windwp/nvim-ts-autotag')

  use{ -- autocompletion
    'hrsh7th/nvim-cmp',
    config = function() require'plugins.nvim-cmp' end
  }

  use("hrsh7th/cmp-buffer") -- source for text in buffer

  use("hrsh7th/cmp-path") -- source for file system paths

  use{ -- snippet engine
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/my_snippets"})
    end
  }

  use("saadparwaiz1/cmp_luasnip") -- snippet autocompletion

  -- managing & installing lsp servers, linters & formatters
  use{
    "williamboman/mason.nvim",
    config = function() require'mason'.setup() end
  } -- in charge of managing lsp servers, linters & formatters

  use{
    "williamboman/mason-lspconfig.nvim",
    config = function() require'plugins.mason-lspconfig' end
  } -- bridges gap b/w mason & lspconfig

    -- configuring lsp servers
  use{
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require'lspconfig'
      local cmp_nvim_lsp = require'cmp_nvim_lsp'
      local typescript = require'typescript'

      local keymap = vim.keymap -- for conciseness

      -- enable keybinds only for when lsp server available
      local on_attach = function(client, bufnr)
        -- keybind options
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- set keybinds
        keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
        keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
        keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
        keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

        -- typescript specific keymaps (e.g. rename file and update imports)
        if client.name == "tsserver" then
          keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
          keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
          keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
        end
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Change the Diagnostic symbols in the sign column (gutter)
      -- (not in youtube nvim video)
      local signs = { Error = " ", Warn = " ", Hint = "😒", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- configure html server
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure typescript server with plugin
      typescript.setup({
        server = {
          capabilities = capabilities,
          on_attach = on_attach,
        },
      })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure tailwindcss server
      lspconfig["tailwindcss"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure lua server (with special settings)
      lspconfig["sumneko_lua"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- configure dockerls server
      lspconfig["dockerls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure eslint server
      lspconfig["eslint"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure jsonls server
      lspconfig["jsonls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure marksman server
      lspconfig["marksman"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure psalm server
      lspconfig["psalm"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure ruby_ls server
      lspconfig["ruby_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure sqlls server
      lspconfig["sqlls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end
  } -- easily configure language servers

  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

  use{
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require'lspsaga'

      saga.init_lsp_saga({
        -- keybinds for navigation in lspsaga window
        move_in_saga = { prev = "<C-k>", next = "<C-j>" },
        -- use enter to open file with finder
        finder_action_keys = {
          open = "<CR>",
        },
        -- use enter to open file with definition preview
        definition_action_keys = {
          edit = "<CR>",
        }
      })

    end
  } -- enhanced lsp uis

  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  use 'tjdevries/overlength.vim'

  use {
    'mfussenegger/nvim-lint',
    requires = {'eslint/eslint', 'squizlabs/PHP_CodeSniffer'},
    config = function() require'plugins.nvim-lint' end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          delete = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' }
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Couldn’t move those in mappin.lua
          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
        end
      }
    end
  }

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
  use("sangdol/mintabline.vim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
