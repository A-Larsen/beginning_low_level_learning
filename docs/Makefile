FILENAME=*.adoc

build: $(FILENAME)
	rm -rf diag*.png
	asciidoctor -r asciidoctor-diagram -b html5 $(FILENAME)
