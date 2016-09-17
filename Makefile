SHELL := /bin/bash
LATEX_PATH = /usr/local/texlive/2012/bin/x86_64-darwin

all: submit preprint letter
	
submit: mcdonald_nfb_datasharing_body.tex mcdonald_nfb_datasharing_article.tex mcdonald_nfb_datasharing_bib.bib
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article
	$(LATEX_PATH)/bibtex mcdonald_nfb_datasharing_article
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article

preprint: mcdonald_nfb_datasharing_body.tex mcdonald_nfb_datasharing_article_preprint.tex mcdonald_nfb_datasharing_bib.bib
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article_preprint
	$(LATEX_PATH)/bibtex mcdonald_nfb_datasharing_article_preprint
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article_preprint
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article_preprint

letter: submission_letter.tex 
	$(LATEX_PATH)/pdflatex submission_letter
	$(LATEX_PATH)/pdflatex submission_letter
	$(LATEX_PATH)/pdflatex submission_letter

clean:
	rm -v *.aux *.bbl *.blg *.log

