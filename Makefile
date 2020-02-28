BOOKS = Calculus.pdf\
	CalculusI.pdf\
	CalculusII.pdf\
	CalculusIII.pdf\
	CalculusIV.pdf\
	CalculusQ1.pdf\
	CalculusQ2.pdf\
	CalculusQ3.pdf\
	CalculusQ4.pdf\
	Calculus_Question_File.pdf\
	CalculusX.pdf

all: $(BOOKS)

%.pdf: %.tex
	xelatex $<
	makeindex $(<:.tex=.idx)
	xelatex $<
	xelatex $<

clean:
	rm *~ *.out *.aux *.log *.tcp *.answers

rmproper:
	rm $(BOOKS)
