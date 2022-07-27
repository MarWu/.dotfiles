vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
    use("wbthomason/packer.nvim")
--    use("sbdchd/neoformat")

    -- Simple plugins can be specified as strings
--    use("TimUntersberger/neogit")

    -- TJ created lodash of neovim
   use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = {'nvim-lua/plenary.nvim'}
   }
--   use("nvim-lua/popup.nvim")

    -- All the things
   use("neovim/nvim-lspconfig")
   use("hrsh7th/cmp-nvim-lsp")
--   use("hrsh7th/cmp-buffer")
   use("hrsh7th/nvim-cmp")
--   use("tzachar/cmp-tabnine", { run = "./install.sh" })
--   use("onsails/lspkind-nvim")
--   use("nvim-lua/lsp_extensions.nvim")
--   use("glepnir/lspsaga.nvim")
--   use("simrat39/symbols-outline.nvim")
--   use("L3MON4D3/LuaSnip")
--   use("saadparwaiz1/cmp_luasnip")
   use("simrat39/rust-tools.nvim")
   use {
     'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   }

    -- Primeagen doesn"t create lodash
--   use("ThePrimeagen/git-worktree.nvim")
--   use("ThePrimeagen/harpoon")

--    use("mbbill/undotree")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("nvim-treesitter/playground")
--    use("romgrk/nvim-treesitter-context")

--   use("mfussenegger/nvim-dap")
--   use("rcarriga/nvim-dap-ui")
--   use("theHamsta/nvim-dap-virtual-text")
end)
