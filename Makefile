# Build the one-page resume PDF.
#   make        - build resume_onepage.pdf
#   make check  - build, then show extracted text (ATS readability check)
#   make open   - build and open the PDF
#   make docs   - build, then refresh the GitHub Pages copies in docs/ (PDF + Markdown)
#   make clean  - remove build artifacts and the PDF

.PHONY: check open docs clean

# Two passes: hyperref needs a second run to settle links and outlines.
resume_onepage.pdf: resume_onepage.tex
	xelatex -interaction=nonstopmode -halt-on-error $<
	xelatex -interaction=nonstopmode -halt-on-error $<
	rm -f resume_onepage.aux resume_onepage.log resume_onepage.out

check: resume_onepage.pdf
	pdftotext $< -

open: resume_onepage.pdf
	open $<

# docs/ is served by GitHub Pages: index.html (hand-maintained), plus these copies.
docs: resume_onepage.pdf
	cp resume_onepage.pdf docs/Saikumar_Chintada_Resume.pdf
	cp resume.md docs/resume.md

clean:
	rm -f resume_onepage.aux resume_onepage.log resume_onepage.out resume_onepage.pdf
