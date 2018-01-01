augroup PotionGroup
    autocmd!
	autocmd BufNewFile,BufRead *.{pn} set filetype=potion
    autocmd BufNewFile,BufRead {potiobytecode} set filetype=potionbytecode
augroup END
