# Makefile for building LaTeX report with xelatex and renaming resulting PDF file

# Variables
ifeq (${BASENAME},)
	BASENAME = Report
endif

TEXFILE = $(BASENAME).tex
PDFFILE = $(BASENAME).pdf
RENAME_SCRIPT = /home/al/latexReports/rename.py

# Default rule
all: $(PDFFILE)

$(PDFFILE): .FORCE


# Rule to build PDF
$(PDFFILE): $(TEXFILE)
	latexmk -shell-escape -synctex=1 -interaction=nonstopmode -cd -file-line-error -lualatex $(TEXFILE)
	python3 $(RENAME_SCRIPT) $(PDFFILE)

# Rule to clean up intermediate files
clean:
	latexmk -c *.tex
	rm -rf _minted-*
	rm -f *.acn *.acr *.alg *.bbl *.glg *.glo *.gls *.ist *.run.xml *.synctex.gz

.PHONY: all clean .FORCE
