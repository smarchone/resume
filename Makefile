# Build the one-page resume PDF straight into docs/, which GitHub Pages serves.
#   make        - build docs/Saikumar_Chintada_Resume.pdf
#   make check  - build, then show extracted text (ATS readability check)
#   make open   - build and open the PDF
#   make clean  - remove build artifacts and the PDF

PDF := docs/Saikumar_Chintada_Resume.pdf

.PHONY: check open clean

# Two passes: hyperref needs a second run to settle links and outlines.
$(PDF): resume_onepage.tex
	xelatex -interaction=nonstopmode -halt-on-error $<
	xelatex -interaction=nonstopmode -halt-on-error $<
	mv resume_onepage.pdf $@
	rm -f resume_onepage.aux resume_onepage.log resume_onepage.out

check: $(PDF)
	pdftotext $< -

open: $(PDF)
	open $<

clean:
	rm -f resume_onepage.aux resume_onepage.log resume_onepage.out resume_onepage.pdf $(PDF)
