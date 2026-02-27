.PHONY: all clean

# Optional Makefile for compiling locally without VSCode LaTeX Workshop.
# The `build` directory is used to store all auxiliary and output files.

all:
	latexmk -pdf -outdir=build main.tex

clean:
	latexmk -c -outdir=build main.tex
	rm -rf build/
