local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)

	-- Utils
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'lewis6991/impatient.nvim'
	use 'farmergreg/vim-lastplace'
	use 'folke/which-key.nvim'
	use 'windwp/nvim-autopairs'
	use 'folke/trouble.nvim'
	use 'gpanders/editorconfig.nvim'
	use 'chentoast/marks.nvim'
    use 'nvim-orgmode/orgmode'
	use 'ggandor/lightspeed.nvim'
	use 'nvim-telescope/telescope.nvim'
    use 'neovim/nvim-lspconfig'
    use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
    use { "ellisonleao/gruvbox.nvim" }
	use 'lewis6991/gitsigns.nvim'
	use 'sindrets/diffview.nvim'
	use 'nvim-lualine/lualine.nvim'
    use "lukas-reineke/indent-blankline.nvim"
	use 'yamatsum/nvim-cursorline'
	use 'luukvbaal/stabilize.nvim'
    use {
        'gelguy/wilder.nvim',
        config = function()
            -- config goes here
        end,
    }

	-- Documentation / Documents
	use 'davidgranstrom/nvim-markdown-preview'
	use 'lewis6991/spellsitter.nvim'

	-- TPOPE
	use 'tpope/vim-repeat'
  	use 'tpope/vim-abolish'
  	use 'tpope/vim-characterize'
	use 'tpope/vim-surround'
	use {'tpope/vim-dispatch', cmd = {"Dispatch", "Make"}}

	-- Testing
	use 'vim-test/vim-test'
	use {'rcarriga/vim-ultest', run = ":UpdateRemotePlugins"}

	-- Development
	use 'mfussenegger/nvim-lint'
	use 'mhartington/formatter.nvim'
	use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
	use 'numToStr/Comment.nvim'
	use 'folke/todo-comments.nvim'
	use 'windwp/nvim-spectre'

	-- Languages
	use 'danchoi/ri.vim'
	use 'LnL7/vim-nix'
	use 'ray-x/go.nvim'
	use {'vim-ruby/vim-ruby', ft = "ruby"}
	use {'rust-lang/rust.vim', ft = "rust"}
	use {'elixir-editors/vim-elixir', ft = "elixir"}
	use {'leafgarland/typescript-vim', ft = "typescript"}
	use {'pangloss/vim-javascript', ft = "javascript"}
	use {'elmcast/elm-vim', ft = "elm"}
	use {'slim-template/vim-slim', ft = "slim"}
	use 'vim-crystal/vim-crystal'
	use {'tpope/vim-rails', ft = "ruby"}

	-- UI
	use {'nvim-telescope/telescope-fzf-native.nvim', run = "make"}
	use 'mhinz/vim-startify'

    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
