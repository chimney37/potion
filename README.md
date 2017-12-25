# Title: vim-md2bb
# Description:
* allows conversion on VIM typed markdown files and text to Bulletin Board Code (BB Code).
# Motivation:
## Why another md2bb? 
* Key motivation is that sites like Steam uses BB Code, but markdown is much easier to use
* There does not seem to be a tool on VIM capable of doing this easily (or I’m just blind)
* Fits the VIM workflow, works for big files, no dependency on java, js.

##Are there alternatives?
* feralhosting.github.io is a webpage for converting md 2 BB 
* ohnonot/md2bb.pl: works on shell, but there's no licensing info (which also likely means it's copyright protected and cannot be used in other projects)
``` 
echo “* markdown” | perl  md2bb.pl > out
```
* md2bbc is a Node JS package
* BBEdit is a Professional markdown BB editor tool
* kefirfromperm/kefirbb : convert many files to HTML, including BB and markdown

## Key Designs
* should work for .md and .markdown files
* output a BB in a new panel, given a piece of text we want to convert to BB
* Outscope: handling GitHub Flavored Markdown
* use md2bbc (Node JS) and its modified versions
* https://github.com/ohnonot/md3bb.pl

## Requirements
* Requires Perl
* Supports Mac 

## Installation Instructions
* TK

