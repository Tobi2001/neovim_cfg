local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    -- Package manager
    use { "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }
    -- Helpful lua functions
    use { "nvim-lua/plenary.nvim", commit = "986ad71ae930c7d96e812734540511b4ca838aa2" }
    -- Automatic pair insertion
    use { "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }
    -- Code commenting
    use { "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }
    -- File tree
    use { "kyazdani42/nvim-tree.lua", commit = "0f96e32326a842798b6b8e638a91464521e4ef71" }
    -- File tree icons
    use { "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }
    -- Top level bufferline
    use { "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }
    -- Better buffer closing
    use { "kazhala/close-buffers.nvim", commit = "3acbcad1211572342632a6c0151f839e7dead27f" }
    -- Bottom level status line
    use { "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }
    -- Terminal window toggle
    use { "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" }
    -- Project management
    use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
    -- Speed up lua module performance
    use { "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" }
    -- Visual indentation helpers
    use { "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" }
    -- Repeat last plugin command
    use { "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" }
    -- Quickly jump to some label
    use { "ggandor/leap.nvim", commit = "b51c4bc051ab54f2694a24cb4f5f808f665cddf1" }
    -- Add surrounding characters
    use { "tpope/vim-surround", commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea" }
    -- Custom colorscheme
    use { "tobi2001/darkplus.nvim", commit = "2bfebfe554da69acbcaf27c0e284b91e368a6248" }
    -- Code completion
    use { "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }
    use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }
    use { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }
    use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }
    use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
    use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
    use { "hrsh7th/cmp-nvim-lsp-signature-help", commit = "007dd2740d9b70f2688db01a39d6d25b7169cd57" }
    use { "alexander-born/cmp-bazel", commit = "00d7432074ca2e8556eb0c6af7567fe9fd65495d" }
    -- Code snippets
    use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }
    use { "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }
    -- LSP
    use { "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }
    use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" }
    use { "jose-elias-alvarez/null-ls.nvim", commit = "4342844954e89bca0e93a8057538000b7a9b737d" }
    use { "RRethy/vim-illuminate", commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" }
    -- Telescope
    use { "nvim-telescope/telescope.nvim", commit = "0.1.0" }
    use { "nvim-telescope/telescope-fzf-native.nvim", commit = "65c0ee3d4bb9cb696e262bca1ea5e9af3938fc90",
            run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { "nvim-telescope/telescope-ui-select.nvim", commit = "62ea5e58c7bbe191297b983a9e7e89420f581369" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", commit = "518e27589c0463af15463c9d675c65e464efc2fe" }
    -- Git
    use { "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" }
    -- TMUX
    use { "alexghergh/nvim-tmux-navigation", commit = "0a084d7c2f73f4a0df9ae25c9e9dcfd18808b3ed" }
    -- Doxygen
    use { "vim-scripts/DoxygenToolkit.vim", commit = "afd8663d36d2ec19d26befdb10e89e912d26bbd3" }
    -- Debugging
    use { "mfussenegger/nvim-dap", commit = "f4a3be57f61893cffa1e22aa5e1e7bded495fcf2" }
    use { "rcarriga/nvim-dap-ui", commit = "d33b905770f9c674468b0b83bed3aeab41cf9bb0" }
    -- Markdown preview
    use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96"})

    use { "ntpeters/vim-better-whitespace", commit = "1b22dc57a2751c7afbc6025a7da39b7c22db635d" }

    use { "tiagovla/scope.nvim", commit = "2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875"}

    use { "f-person/git-blame.nvim", commit = "65292dfcd80897a5f24962096b8df2bb5bb65e15"}

    use { "karb94/neoscroll.nvim", commit = "54c5c419f6ee2b35557b3a6a7d631724234ba97a"}

    use { "chentoast/marks.nvim", commit = "b27cbb78e9082229590b396d3ae4fe07f1aeafe0" }

    use { "folke/trouble.nvim", commit = "929315ea5f146f1ce0e784c76c943ece6f36d786" }

    use { "andrewferrier/debugprint.nvim", commit = "2b8a0dc2582bcc590748239615c2baac339d3812" }

    use { "sindrets/diffview.nvim", commit = "bfab5921fcdf2a67ab5e03e2aa3fc64a5284786d" }

    use { "luukvbaal/stabilize.nvim", commit = "f7c4d93d6822df1770a90b7fdb46f6df5c94052e" }

    use { "folke/todo-comments.nvim", commit = "02eb3019786d9083b93ab9457761899680c6f3ec" }

    use { "edluffy/specs.nvim", commit = "2743e412bbe21c9d73954c403d01e8de7377890d" }

    use { "gbprod/yanky.nvim", commit = "6c39c8373e35da4a200c71f8eb0ec68df9716702" }

    use { "max397574/better-escape.nvim" }
    use {"EdenEast/nightfox.nvim", commit = "59c3dbcec362eff7794f1cb576d56fd8a3f2c8bb"}

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
