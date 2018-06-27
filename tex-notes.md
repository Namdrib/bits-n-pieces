# Notes for TeX/LaTeX, etc.
I've probably got my terminology incorrect here

## Things to install
- texlive-latex-base
- texlive-extra-utils
- texlive-fonts-recommended
- latexmk

## Using
latexmk is the "make" handler for latex. Can be used to compile and clean up. Using `latexmk -c` iseful for cleaning up everything except the outputs (dvi, ps, pdf)

`texcount [some_file(s)]` to display word count for subheadings, etc.
