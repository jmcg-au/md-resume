# `jmcg-au/md-resume`

This repository contains [my résumé](./resume.md) in GitHub‐flavoured Markdown format, along with a [Makefile](./Makefile) which converts it to a PDF using [Pandoc](https://pandoc.org/).  There is also an optional Makefile target which extracts the text from the PDF so that it can be compared against the Markdown version.

## To do

Humans don't read résumés anymore, but most places still won't let you upload a Markdown file.  Instead of using `pandoc`, figure out the simplest way of converting a plain text file into a PDF such that the extracted text matches the original text as closely as possible.  Verify the output against all the big commercial AI assistants, since they'll probably be the ones reading it.
