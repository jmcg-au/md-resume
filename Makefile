.PHONY: all clean pdf extract-text

all: pdf

clean:
	$(RM) resume.pdf resume.txt

pdf: resume.pdf

extract-text: resume.txt

resume.pdf: resume.md page-numbering-hack.tex Makefile
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

resume.txt: resume.pdf
	pdftotext $< $@

# Files that don't need to be made
Makefile: ;
resume.md: ;
page-numbering-hack.tex: ;
