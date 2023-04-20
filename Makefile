SOURCES := $(wildcard *.tex)
OUTPUTS := $(SOURCES:%.tex=%.pdf)

PDFLATEX := pdflatex
PREFIX := build

all: $(OUTPUTS)

install: $(OUTPUTS)
	install -Dm644 -t $(PREFIX) $(OUTPUTS)

clean:
	rm -rf *.pdf *.log *.aux

%.pdf: %.tex
	$(PDFLATEX) $^
