""" Portable vimrc with plugins. """
""" To use, add "so ~/vimplugs/.vimrc

" Special actions needed to import from git if running on windows. OBS!
" Requires PowerShell!
function! GetVundleWin()
    !mkdir "~/.vim/bundle/"
    !cd "~/.vim/bundle/"
    !git clone https://github.com/VundleVim/Vundle.vim.git 
endfunction

"If vundle does not exist, download it
function! GetVundle()
    echo "Checking for Vundle..."
    if !empty(glob("~/.vim/bundle/Vundle.vim/README.md"))
        echo "Vundle Exists! No actions needed."
    else
        echo "Vundle does not exist, attempting to clone from Git..."
        " Clone git repo in shell
        " If windows
        if has("win32")
            exec GetVundleWin()
        else " If on unix
            !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        endif
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
Plugin 'scrooloose/syntastic'
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
Plugin 'raimondi/delimitmate'
Plugin 'tpope/vim-surround'

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

 "" Syntastic ""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Enable c++11 features
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

""" Delimitmate """
let delimitMate_expand_cr = 1
let delimitmate_Backspace = 1
