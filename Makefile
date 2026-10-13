# Build the one-page resume PDF.
#   make        - build resume_onepage.pdf and its GitHub Pages copy in docs/
#   make check  - build, then show extracted text (ATS readability check)
#   make open   - build and open the PDF
#   make clean  - remove build artifacts and both PDFs
#
# resume_onepage.pdf stays at the repo root because external raw links point to it.

PDF  := resume_onepage.pdf
SITE := docs/Saikumar_Chintada_Resume.pdf

.PHONY: all check open clean

all: $(PDF) $(SITE)

# Two passes: hyperref needs a second run to settle links and outlines.
$(PDF): resume_onepage.tex
	xelatex -interaction=nonstopmode -halt-on-error $<
	xelatex -interaction=nonstopmode -halt-on-error $<
	rm -f resume_onepage.aux resume_onepage.log resume_onepage.out

$(SITE): $(PDF)
	cp $< $@

check: $(PDF)
	pdftotext $< -

open: $(PDF)
	open $<

clean:
	rm -f resume_onepage.aux resume_onepage.log resume_onepage.out $(PDF) $(SITE)
