executatble: binary
	gcc -o $(PROG) $(PROG).o -no-pie

binary: $(PROG).nasm
	nasm -f elf64 -g -F dwarf $(PROG).nasm

inline_assembly: inline_assembly.c
	gcc -o inline_assembly inline_assembly.c

clean:
	rm -rf *.o *.lst
	rm -rf $(shell  find . -maxdepth 1 -type f -executable)

.PHONY: clean

	

