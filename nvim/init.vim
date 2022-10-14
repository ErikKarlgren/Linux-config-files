set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set mouse+=a

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'phaazon/hop.nvim'
Plug 'ActivityWatch/aw-watcher-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'khaveesh/vim-fish-syntax'

call plug#end()

" Setup plugins
lua << END
    require('lualine').setup()
    require('hop').setup()
END

" Remaps
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Telescope remaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Hop remaps
nnoremap <leader>hh <cmd>HopWord<cr>
nnoremap <leader>hp <cmd>HopPattern<cr>


lua << END
    -- More hop remaps
    local hop = require('hop')
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('', 'f', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, {remap=true})
    vim.keymap.set('', 'F', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, {remap=true})
    vim.keymap.set('', 't', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end, {remap=true})
    vim.keymap.set('', 'T', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end, {remap=true})
END

" Colorscheme
colorscheme tokyonight
