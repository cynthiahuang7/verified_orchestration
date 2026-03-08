.PHONY: paper paper-clean

paper:
	@cd paper && \
	if command -v latexmk >/dev/null 2>&1; then \
		latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex; \
	elif command -v pdflatex >/dev/null 2>&1; then \
		pdflatex -interaction=nonstopmode -halt-on-error main.tex && \
		bibtex main && \
		pdflatex -interaction=nonstopmode -halt-on-error main.tex && \
		pdflatex -interaction=nonstopmode -halt-on-error main.tex; \
	else \
		echo "Error: neither latexmk nor pdflatex is available."; \
		exit 1; \
	fi

paper-clean:
	@cd paper && \
	if command -v latexmk >/dev/null 2>&1; then \
		latexmk -C; \
	else \
		rm -f main.aux main.bbl main.blg main.fdb_latexmk main.fls main.log main.out main.pdf main.run.xml main.synctex.gz main.toc main.xdv; \
	fi
