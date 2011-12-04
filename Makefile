LTX=pdflatex --halt-on-error

TARGET=seminar

all: $(addsuffix .pdf,$(TARGET))

%.pdf: %.tex %.mst
	${LTX} $^
	makeindex $(basename $@)
	${LTX} $^
	
clean:
	rm -rf *.aux *.log *.idx *.ind *.ilg *.out *.toc
	
cleanest: clean
	rm -rf *.pdf
