" syntax highlighting for potionbytecode files
" the lines at the beginning and end are a convention that prevents the syntax
" from being loaded if syntax highlighting has already been enabled for this buffer
if exists("b:current_syntax")
	finish
endif

" Bytecode
syntax keyword potionByteCode bind call getlocal getupval loadk loadpn move msg proto return self setlocal
highlight link potionByteCode Special

syntax keyword potionByteCodeSpecial local value upval
highlight link potionByteCodeSpecial Debug

" Keyword
syntax keyword potionKeyword loop times while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class break continue
syntax keyword potionKeyword and or
syntax keyword potionKeyword expr list nil block keyword
highlight link potionKeyword Keyword

" Type
syntax keyword potionType int extern
highlight link potionType Type

" Character constants
"syntax match potionCharacter "\v\\n"
highlight link potionCharacter Character

" Number
syntax match potionNumber "\v\W\d+"hs=s+1
syntax match potionNumber "\v[0-9]+\.[0-9]+"
syntax match potionNumber "\v0x[0-9abcdef]+"
syntax match potionNumber "\v[0-9]*\.?[0-9]+e[-\+][0-9]+"
syntax keyword potionNumber true false
highlight link potionNumber Number

" Function and Methods
syntax keyword potionFunction print say join length
syntax keyword potionFunction string integer
syntax keyword potionFunction abs sqrt 
highlight link potionFunction Function

let b:current_syntax = "potion"
