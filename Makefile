ifeq ($(PROG),function4)

function4: function4.o circle.o rect.o
	gcc -g -o function4 function4.o circle.o rect.o -no-pie

function4.o: function4.nasm
	nasm -f elf64 -g -F dwarf function4.nasm -l function4.lst

circle.o: circle.nasm
	nasm -f elf64 -g -F dwarf circle.nasm -l circle.lst

rect.o: rect.nasm
	nasm -f elf64 -g -F dwarf rect.nasm -l rect.lst

else ifeq ($(PROG),inline_assembly)

inline_assembly: inline_assembly.c
	gcc -o inline_assembly inline_assembly.c

else

executatble: binary
	gcc -o $(PROG) $(PROG).o -no-pie

binary: $(PROG).nasm
	nasm -f elf64 -g -F dwarf $(PROG).nasm

endif

clean:
	rm -rf *.o *.lst
	rm -rf $(shell  find . -maxdepth 1 -type f -executable)

.PHONY: clean	

