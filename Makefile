.PHONY: all clean pdf extract-text

all: pdf

clean:
	$(RM) resume_human-readable.pdf resume_machine-readable.pdf resume_machine-readable_extracted.txt txt-to-pdf.py

pdf: resume_human-readable.pdf resume_machine-readable.pdf

extract-text: resume_machine-readable_extracted.txt

resume_human-readable.pdf: resume.md page-numbering-hack.tex
	pandoc \
          --from gfm --to pdf --pdf-engine pdflatex \
	  --include-in-header page-numbering-hack.tex \
          --metadata title="Résumé" \
          --metadata author="John McIntyre Grimau" \
	  --variable documentclass=article \
          --variable papersize=a4 \
	  --variable pagestyle=empty \
          --variable block-headings \
	  --variable urlstyle=tt \
	  --variable colorlinks \
          --variable urlcolor=blue \
          --variable citecolor=blue \
          --output $@ $<

resume_machine-readable.pdf: resume.md txt-to-pdf.py
	python3 txt-to-pdf.py < $< > $@

resume_machine-readable_extracted.txt: resume_machine-readable.pdf
	pdftotext -raw -layout -nopgbrk $< $@

txt-to-pdf.py:
	curl -s -o $@ -L 'https://github.com/ratter-au/py-txt-to-pdf/raw/refs/heads/main/txt-to-pdf.py'

# Files that don't need to be made
Makefile: ;
resume.md: ;
page-numbering-hack.tex: ;
