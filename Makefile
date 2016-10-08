SHELL := /bin/bash
LATEX_PATH = /usr/local/texlive/2012/bin/x86_64-darwin

manuscript_submit_files = mcdonald_nfb_datasharing_body.tex mcdonald_nfb_datasharing_abstract.tex mcdonald_nfb_datasharing_article.tex \
    mcdonald_nfb_datasharing_frontmatter_submit.tex mcdonald_nfb_datasharing_endmatter.tex mcdonald_nfb_datasharing_bib.bib
	
manuscript_preprint_files = mcdonald_nfb_datasharing_body.tex mcdonald_nfb_datasharing_abstract.tex \
    mcdonald_nfb_datasharing_article_preprint.tex mcdonald_nfb_datasharing_frontmatter.tex \
	mcdonald_nfb_datasharing_endmatter.tex mcdonald_nfb_datasharing_bib.bib
	
manuscript_revision_marked_files = mcdonald_nfb_datasharing_body_revision_marked.tex mcdonald_nfb_datasharing_abstract_revision_marked.tex \
    mcdonald_nfb_datasharing_article_revision_marked.tex mcdonald_nfb_datasharing_frontmatter_submit_revision_marked.tex \
	mcdonald_nfb_datasharing_endmatter.tex mcdonald_nfb_datasharing_bib.bib
	
all: submit preprint letter revision_marked
	
submit: $(manuscript_submit_files)
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article
	$(LATEX_PATH)/bibtex mcdonald_nfb_datasharing_article
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article

preprint: $(manuscript_preprint_files)
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article_preprint
	$(LATEX_PATH)/bibtex mcdonald_nfb_datasharing_article_preprint
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article_preprint
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article_preprint

letter: submission_letter.tex 
	$(LATEX_PATH)/pdflatex submission_letter
	$(LATEX_PATH)/pdflatex submission_letter
	$(LATEX_PATH)/pdflatex submission_letter

revision_marked: $(manuscript_revision_marked_files)
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article_revision_marked
	$(LATEX_PATH)/bibtex mcdonald_nfb_datasharing_article_revision_marked
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article_revision_marked
	$(LATEX_PATH)/pdflatex mcdonald_nfb_datasharing_article_revision_marked

response_letter: reviewer_response_letter.tex 
	$(LATEX_PATH)/pdflatex reviewer_response_letter
	$(LATEX_PATH)/pdflatex reviewer_response_letter
	$(LATEX_PATH)/pdflatex reviewer_response_letter
 
clean:
	rm -v *.aux *.bbl *.blg *.log

