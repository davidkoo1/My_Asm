CC = fasm
LIBS = fmt.asm mth.asm str.asm sys.asm
LIBS_OBJ = fmt.o mth.o str.o sys.o
.PHONY: default compile build run
default: build run
compile: $(LIBS)
	$(CC) fmt.asm && $(CC) mth.asm && $(CC) str.asm && $(CC) sys.asm
build: main.asm $(LIBS_OBJ)
	fasm main.asm
	ld main.o $(LIBS_OBJ) -o main
run: main
	./main