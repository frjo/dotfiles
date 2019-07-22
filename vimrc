" frjo vimrc file.

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Let spacebar double as our leader
nmap <space> <leader>
xmap <space> <leader>
nmap <space><space> <leader><leader>
xmap <space><space> <leader><leader>

" Toggle wrap
nmap <leader>w :set wrap!<CR>

" Toggle line numbers
nmap <leader>n :set number!<CR>

" Toggle invisible characters
nmap <leader>i :set list!<CR>

" Toggle paste mode
set pastetoggle=<leader>p

" Whitespace
set autoindent                  " preserve indent level on newlines
set expandtab                   " use spaces, not tabs
set tabstop=2                   " a tab is two spaces
set shiftwidth=2                " an autoindent (with <<) is two spaces
set shiftround                  " when indenting with >, round to nearest multiple of shiftwidth
set smarttab                    " use shiftwidth/tabstop based on context
set nowrap                      " don't wrap lines
set linebreak                   " when wrapping, wrap at word boundaries (vs last char)

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Misc
set encoding=utf-8              " always use unicode
set backspace=indent,eol,start  " backspace through everything in insert mode
set nobackup                    " do not keep a backup file, use versions instead
set ttyfast                     " assume we are on a fast terminal
set lazyredraw                  " don't echo non-typed characters (e.g., macro execution)
set showmatch                   " show matching brackets
set cursorline                  " highlight current line
set ruler                       " always show line and col number
set showcmd                     " show command in bottom bar
set history=1000                " keep 1000 lines of command line history
set autoread                    " reload unchanged buffers when file changed outside vim

" Show line numbers and make them grey
set number
highlight LineNr ctermfg=DarkGrey

" System clipboard and file formats per plattform.
if system('uname -s') == "Darwin\n"
  "macOS
  set clipboard=unnamed
else
  "Linux
  set clipboard=unnamedplus
endif

if has("autocmd")
  " Enable file type detection
  filetype plugin indent on

  " Switch syntax highlighting on
  syntax on

  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead *.json set ft=javascript

  " Avoid syntax highlight issue on hyphenated CSS keywords
  autocmd FileType css,scss setlocal iskeyword+=-

  " Markdown files
  autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  autocmd FileType markdown setlocal
      \ wrap
      \ wrapmargin=2
      \ tabstop=4
      \ shiftwidth=4
      \ textwidth=100

  " Python files
  autocmd FileType python setlocal
      \ tabstop=4
      \ shiftwidth=4

  let python_highlight_all=1

endif

" Highlight redundant whitespaces and tabs, need to be last
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
