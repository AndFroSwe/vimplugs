""" Portable vimrc with plugins. """
""" To use, add "so ~/vimplugs/.vimrc

"If vundle does not exist, download it
function! GetVundle()
    echo "Checking for Vundle..."
    if !empty(glob("~/.vim/bundle/Vundle.vim/README.md"))
        echo "Vundle Exists! No actions needed."
    else
        echo "Vundle does not exist, attempting to clone from Git..."
        " Clone git repo in shell
        !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        echo "Done! Run command [PluginInstall] to use your bundles!"
    endif
endfunction

execute GetVundle()


""" Plugin setup """
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/Ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'lervag/vimtex'
Plugin 'shougo/neocomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""" Plugin settings """
"" Tagbar ""
let g:tagbar_autoclose = 1 " Close the tagbar window when jumping to a tag
let g:tagbar_autopreview = 1 " Always see the preview of a tag

" Bind tagbar
noremap <leader>at :TagbarOpen<CR>

"" Vimtex ""
let g:vimtex_view_method = 'mupdf'
let g:vimtex_viewer_mupdf = 1
let g:tex_flavor = 'latex'

"" Airline ""
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

"" Ultisnips ""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"" Neocomplete ""
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
