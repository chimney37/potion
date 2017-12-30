augroup PotionGroup
	autocmd BufNewFile,BufRead *.{pn} set filetype=potion
    autocmd FileType potion
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix
augroup END
