# Title: potion
# Description
* a test plugin for a programming language called potion, based on Steve Losh's "Learning Vimscript the Hard Way" and a couple of own additions.

# Motivation
* Learning how to create a vim plugin

# Why would you use this plugin
* probably not, unless you are interested in developing in potion, or have an interest in learning how to create Vim plugins.

# Is is better than other plugins?
* probably not, and there's already one available [here](http://www.vim.org/scripts/script.php?script\_id=4821)

# Illustration
[![asciicast](https://asciinema.org/a/k4YN8zuCeTosdzUb57Pa3lP7M.png)](https://asciinema.org/a/k4YN8zuCeTosdzUb57Pa3lP7M)
 
# Reference 
* http://learnvimscriptthehardway.stevelosh.com/
* http://www.vim.org/scripts/script.php?script\_id=4821

# Requirements
* Requires installation of [potion](http://perl11.org/potion/)

# Installation Instructions
1. Get potion
```
git clone https://github.com/perl11/potion.git
```
2. Run make
```
cd potion
gmake DEBUG=1
```
* Note: for MacOS, make is equivalent to gmake.

3. Verify the potion interpreter works
```
bin/potion example/prime.pn
```
4. Add the path to 'bin/potion' to $PATH
 
Note: adding the path is recommended for potion interpreter and bytecode compiler to work by defualt. Otherwise use the global\_variable g:potion\_command="\<path-to-potion\>"

# Usage

1. Run potion using the interpreter
```
<leader>rt
```
2. Get potion bytecode using the interpreter executable
```
<leader>b
```
For more information, use:
```
:help potion
```

# LICENSE
* MIT

