# Makefile for building LaTeX report with xelatex and renaming resulting PDF file

# Variables
ifeq (${BASENAME},)
	BASENAME = Report
endif


ADOCFILE = $(BASENAME).adoc
PDFFILE = $(BASENAME).pdf
HTMLFILE = $(BASENAME).html

# Default rule
all: $(HTMLFILE) $(PDFFILE)
html: $(HTMLFILE)
pdf: $(PDFFILE)

# Rule to build PDF
$(HTMLFILE): $(ADOCFILE)
	asciidoctor -a diagram-svg-type=inline -a allow-uri-read -r asciidoctor-kroki $(ADOCFILE)

$(PDFFILE): $(ADOCFILE)
	asciidoctor-pdf -a diagram-svg-type=inline -a allow-uri-read -r asciidoctor-kroki $(ADOCFILE)

# Rule to clean up intermediate files
# clean:
# 	latexmk -c *.tex
# 	rm -rf _minted-*
# 	rm -f *.acn *.acr *.alg *.bbl *.glg *.glo *.gls *.ist *.run.xml *.synctex.gz

.PHONY: all