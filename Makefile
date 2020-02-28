BOOKS = Calculus.pdf

all: $(BOOKS)

Calculus.pdf: Calculus.tex
	xelatex Calculus
	xelatex Calculus
