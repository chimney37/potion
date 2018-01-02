# Title: potion
# Description:
* a test plugin for a programming language called potion, based on Steve Losh's "Learning Vimscript the Hard Way" and a couple of own additions.

# Motivation:
* Learning how to create a vim plugin

# Reference 
* http://learnvimscriptthehardway.stevelosh.com/

## Requirements
* Requires install [potion](http://perl11.org/potion/)


## Installation Instructions
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
 
Note: adding the path is recommended for potion interpreter and bytecode compiler to work by defualt. Otherwise use the global\_variable g:potion\_command="<path-to-potion>"

# LICENSE
* MIT

