" the lines at the beginning and end are a convention that prevents the syntax
" from being loaded if syntax highlighting has alrady been enabled for this buffer
if exists("b:current_syntax")
	finish
endif

"echom "Our syntax highlighting code will go here."
syntax keyword potionKeyword loop to times while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
highlight link potionKeyword Keyword

syntax keyword potionFunction print join string
highlight link potionFunction Function

" \v tells VIM to use "very magix" regex, which is like most other regex 
syntax match potionComment "\v#.*$"
highlight link potionComment Comment

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
highlight link potionOperator Operator

syntax match potionNumber "\v[0-9]+"
syntax match potionNumber "\v[0-9]+\.[0-9]+"
syntax match potionNumber "\v0x[0-9abcdef]+"
syntax match potionNumber "\v[0-9]*\.?[0-9]+e[-\+][0-9]+"
highlight link potionNumber Number

let b:current_syntax = "potion"
