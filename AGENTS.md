# AGENTS.md

Single-page LaTeX resume (`resume_onepage.tex`), tuned for ATS parsers, AI screeners and fast human skimming.
Build with `make` (XeLaTeX, font: Charter, which ships with macOS); `make check` prints the extracted text that ATS/agents see.

`resume_onepage.tex` is the source of truth. `make` builds it straight to `docs/Saikumar_Chintada_Resume.pdf`. GitHub Pages serves `docs/` in three formats: that PDF, `docs/resume.md` and `docs/index.html`. Each file exists once; there are no copies elsewhere.

## Can't do

**Page and layout**
- Don't let the resume exceed one page. After every change, run `make` and confirm `pdfinfo docs/Saikumar_Chintada_Resume.pdf` shows `Pages: 1`.
- Don't use multi-column layouts, tables, text boxes, images or icon fonts (e.g. fontawesome). They break ATS reading order or extract as junk glyphs.
- Don't put content in headers/footers or hide text (white text, tiny fonts). That's keyword stuffing and gets flagged.
- Don't switch the font or build engine without checking the extracted text. Some fonts break ATS matching: Helvetica Neue extracts "Airflow" as "Airﬂow" (ligature glyphs), Inter extracts no text at all, Georgia's old-style digits make metrics hard to scan. After any font change, confirm `make check` has no ﬁ/ﬂ characters and every keyword still matches.
- Don't re-enable hyphenation. Keep `\hyphenpenalty=10000` and `\exhyphenpenalty=10000`: a split keyword ("Kuber-netes") fails ATS matching.
- Don't leave a bullet wrapping with one or two orphaned words. A bullet is either one line or two well-filled lines.
- Don't make the gap between companies larger than the gap above section headings. Spacing must step up: bullets < companies < sections.

**Content and facts**
- Don't invent or inflate facts: metrics, team sizes, years of experience, dollar figures, employer or client names. Use only what the user states or what's in `docs/resume.md`, `old_resume.tex` and `roles/`. Ask when a fact is missing.
- Don't drop keywords or metrics when condensing. Every Skills keyword should still appear in the extracted text; check with `make check`.
- Don't reword bullets the user has asked to keep verbatim. Currently: the Sundial semantic layer bullet ("Led a semantic layer for exploratory analytics over JSON log tables…").
- Don't start two adjacent bullets in the same role with the same verb.

**Published formats**
- Don't change `resume_onepage.tex` without syncing the other formats: update `docs/resume.md` and `docs/index.html` to match, then run `make`. The visible text of all three must match the PDF word for word.
- Don't hand-edit `docs/Saikumar_Chintada_Resume.pdf`; it's overwritten by `make`.
- Don't add copies of the resume outside `docs/`. One file per format.
- Don't delete `docs/.nojekyll`: without it GitHub Pages converts `docs/resume.md` to HTML instead of serving the raw Markdown.

**Working with the user**
- Don't overwrite the user's manual edits. Re-read `resume_onepage.tex` before editing; it's often changed between turns.
- Don't commit or push unless asked.
