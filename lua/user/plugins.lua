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
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    },
}

return packer.startup(function(use)
    -- Package manager
    use { "wbthomason/packer.nvim", commit = "dac4088c70f4337c6c40d1a2751266a324765797" }
    -- Helpful lua functions
    use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }
    -- Automatic pair insertion
    use { "windwp/nvim-autopairs", commit = "b5994e6547d64f781cfca853a1aa6174d238fe0e" }
    -- Code commenting
    use { "numToStr/Comment.nvim", commit = "2a165144ffdf6e1fbe7127f39cd185d5d111927f" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }
    -- File tree
    use { "kyazdani42/nvim-tree.lua", commit = "9e4c39572f631bb60ee15cb9d46e1daa9927a45e" }
    -- File tree icons
    use { "kyazdani42/nvim-web-devicons", commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622" }
    -- Top level bufferline
    use { "akinsho/bufferline.nvim", commit = "c7492a76ce8218e3335f027af44930576b561013" }
    -- Better buffer closing
    use { "kazhala/close-buffers.nvim", commit = "3acbcad1211572342632a6c0151f839e7dead27f" }
    -- Bottom level status line
    use { "nvim-lualine/lualine.nvim", commit = "fffbcb829288c3ca366f17cdb8d46aefb5c1d6f3" }
    -- Terminal window toggle
    use { "akinsho/toggleterm.nvim", commit = "b02a1674bd0010d7982b056fd3df4f717ff8a57a" }
    -- Project management
    use { "ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" }
    -- Speed up lua module performance
    use { "lewis6991/impatient.nvim", commit = "9f7eed8133d62457f7ad2ca250eb9b837a4adeb7" }
    -- Visual indentation helpers
    use { "lukas-reineke/indent-blankline.nvim", commit = "c4c203c3e8a595bc333abaf168fcb10c13ed5fb7" }
    -- Repeat last plugin command
    use { "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" }
    -- Quickly jump to some label
    use { "ggandor/leap.nvim", commit = "a5c9504290832e6bdbbb6265fd1ff02fc6485d20" }
    -- Add surrounding characters
    use { "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" }
    -- Custom colorscheme
    use { "tobi2001/darkplus.nvim", commit = "e8e66ff7f90e829291f537701e0d3ccd997d9acd" }
    -- Code completion
    use { "hrsh7th/nvim-cmp", commit = "d09b0c396aaa078cdfe78316ec06940971136e85" }
    use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }
    use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }
    use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }
    use { "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" }
    use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
    use { "hrsh7th/cmp-nvim-lsp-signature-help", commit = "d2768cb1b83de649d57d967085fe73c5e01f8fd7" }
    use { "alexander-born/cmp-bazel", commit = "00d7432074ca2e8556eb0c6af7567fe9fd65495d" }
    -- Code snippets
    use { "L3MON4D3/LuaSnip", commit = "5570fd797eae0790affb54ea669a150cad76db5d" }
    use { "rafamadriz/friendly-snippets", commit = "4ef45d099453a26d23084a04ae7dced19e6d5ae5" }
    -- LSP
    use { "neovim/nvim-lspconfig", commit = "011e51b33d667bd36591833a2c5d20bbe18fbfc5" }
    use { "williamboman/mason.nvim", commit = "d6bc653251fe1aee16435fafc30170802b63d51f"}
    use { "williamboman/mason-lspconfig.nvim", commit = "fc78caa46e306103818137759afcc908ab6be948" }
    use { "jose-elias-alvarez/null-ls.nvim", commit = "b26851b3e7ac1c0c85666f8a74e36aef2acb89c6" }
    use { "RRethy/vim-illuminate", commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" }
    -- Telescope
    use { "nvim-telescope/telescope.nvim", commit = "e960efa60e97df58e089b00270f09d60f27202c8" }
    use { "nvim-telescope/telescope-fzf-native.nvim", commit = "fab3e2212e206f4f8b3bbaa656e129443c9b802e",
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { "nvim-telescope/telescope-ui-select.nvim", commit = "62ea5e58c7bbe191297b983a9e7e89420f581369" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", commit = "48a3da710369688df80beb2847dabbbd02e2180e" }
    -- Git
    use { "lewis6991/gitsigns.nvim", commit = "2ab3bdf0a40bab53033048c6be75bda86316b55d" }
    -- TMUX
    use { "alexghergh/nvim-tmux-navigation", commit = "84a72a1f7655a2b2ced53abc7aea21f05019642a" }
    -- Doxygen
    use { "vim-scripts/DoxygenToolkit.vim", commit = "afd8663d36d2ec19d26befdb10e89e912d26bbd3" }
    -- Debugging
    use { "mfussenegger/nvim-dap", commit = "6f2ea9e33b48a51849ec93c6c38148a5372018e4" }
    use { "rcarriga/nvim-dap-ui", commit = "54365d2eb4cb9cfab0371306c6a76c913c5a67e3" }
    use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }
    -- Markdown preview
    use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96"})

    use { "ntpeters/vim-better-whitespace", commit = "1b22dc57a2751c7afbc6025a7da39b7c22db635d" }

    use { "tiagovla/scope.nvim", commit = "2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875"}

    use { "f-person/git-blame.nvim", commit = "d3afb1c57918720548effb42edec530232436378"}

    use { "karb94/neoscroll.nvim", commit = "54c5c419f6ee2b35557b3a6a7d631724234ba97a"}

    use { "chentoast/marks.nvim", commit = "a69253e4b471a2421f9411bc5bba127eef878dc0" }

    use { "folke/trouble.nvim", commit = "897542f90050c3230856bc6e45de58b94c700bbf" }

    use { "andrewferrier/debugprint.nvim", commit = "73d0fad4dd882cb14d6e0c05bcceef16fd124e65" }

    use { "sindrets/diffview.nvim", commit = "3812e296d3977a24db62f7c18025755b40968d3a" }

    use { "luukvbaal/stabilize.nvim", commit = "34069870a8e72632c5447188e638e1c6bfebc353" }

    use { "folke/todo-comments.nvim", commit = "c1760010f46992165995aaa52ca967f473a2e8e6" }

    use { "edluffy/specs.nvim", commit = "2743e412bbe21c9d73954c403d01e8de7377890d" }

    use { "gbprod/yanky.nvim", commit = "2bb05abe20b5d7af917a48785acfacb602248e36" }

    use { "max397574/better-escape.nvim", commit = "d5ee0cef56a7e41a86048c14f25e964876ac20c1" }
    use {"EdenEast/nightfox.nvim", commit = "9c3756ae21743c9634923cea788c4cca0eafccf2"}

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
