LTX=pdflatex --halt-on-error

TARGET=seminar

all: $(addsuffix .pdf,$(TARGET))

%.pdf: %.tex %.mst %.bib kalman.tex marcel.tex
	${LTX} $^
	makeindex $(basename $@)
	bibtex $(basename $@)
	${LTX} $^

clean:
	rm seminar.pdf

cleanest:
	rm -rf $(shell tr "\n" " " < .gitignore)
