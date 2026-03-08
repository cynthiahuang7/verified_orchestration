.PHONY: paper paper-clean

paper:
	@cd paper && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

paper-clean:
	@cd paper && latexmk -C
