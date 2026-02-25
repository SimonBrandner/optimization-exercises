#/usr/bin/env zsh

typst compile main.typ
zip -R OPT.zip main.pdf
