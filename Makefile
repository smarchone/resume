# Build the one-page resume PDF.
#   make        - build resume_onepage.pdf
#   make check  - build, then show extracted text (ATS readability check)
#   make open   - build and open the PDF
#   make clean  - remove build artifacts and the PDF

.PHONY: check open clean

# Two passes: hyperref needs a second run to settle links and outlines.
resume_onepage.pdf: resume_onepage.tex
	xelatex -interaction=nonstopmode -halt-on-error $<
	xelatex -interaction=nonstopmode -halt-on-error $<
	rm -f resume_onepage.aux resume_onepage.log resume_onepage.out

check: resume_onepage.pdf
	pdftotext $< -

open: resume_onepage.pdf
	open $<

clean:
	rm -f resume_onepage.aux resume_onepage.log resume_onepage.out resume_onepage.pdf
