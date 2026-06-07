.PHONY: all clean pdf human-readable machine-readable extract-text

all: pdf

clean:
	$(RM) resume_human-readable.pdf resume_machine-readable.pdf resume_machine-readable_extracted.txt txt-to-pdf.py

pdf: human-readable machine-readable

human-readable: resume_human-readable.pdf

machine-readable: resume_machine-readable.pdf

extract-text: resume_machine-readable_extracted.txt

resume_human-readable.pdf: resume.md page-numbering-hack.tex
	pandoc \
	  --from gfm --to pdf --pdf-engine pdflatex \
	  --include-in-header page-numbering-hack.tex \
	  --metadata title="Résumé" \
	  --metadata author="John McIntyre Grimau" \
	  --metadata date="`date '+%B %Y'`" \
	  --variable documentclass=article \
	  --variable papersize=a4 \
	  --variable margin-left=18mm \
	  --variable margin-right=18mm \
	  --variable margin-top=23mm \
	  --variable margin-bottom=23mm \
	  --variable fontsize=12pt \
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
