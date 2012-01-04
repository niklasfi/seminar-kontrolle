LTX=pdflatex --halt-on-error

TARGET=seminar

all: $(addsuffix .pdf,$(TARGET))

%.pdf: %.tex %.mst %.bib
	${LTX} $^
	makeindex $(basename $@)
	bibtex $(basename $@)
	${LTX} $^
	
clean:
	rm -rf $(shell tr "\n" " " < .gitignore)
