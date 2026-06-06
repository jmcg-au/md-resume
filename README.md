# `jmcg-au/md-resume`

This repository contains [my résumé](./resume.md) in GitHub‐flavoured Markdown format, along with a [Makefile](./Makefile) which converts it to two PDFs: one using [Pandoc](https://pandoc.org/) to produce a nicely formatted version for human readers; the other using [a simple Python script](https://github.com/ratter-au/py-txt-to-pdf) which basically wraps the Markdown in the thinnest possible PDF wrapper, intended for optimal machine‐readability.  There is also an optional Makefile target which extracts the text from the PDF so that it can be compared against the Markdown version.

