CFLAGS = -g -Wall -O3
CC = gcc

ORIGIMAGE = msqueak-orig.image
NEWIMAGE = msqueak.image

SQUEAK = C:/squeak/Squeak

all : test

sq : sq.greg
	../greg -o sqgreg.c sq.greg
	$(CC) $(CFLAGS) -o sq sqgreg.c 

test: compiler.sto $(NEWIMAGE)
	$(SQUEAK) $(NEWIMAGE) compiler.sto true
	$(SQUEAK) $(NEWIMAGE) AllMCompilerMethods.st true
	$(SQUEAK) $(NEWIMAGE) AllMCompilerMethods.st true

image: image.c

image.c: mkimage $(ORIGIMAGE).gz
	./mkimage $(ORIGIMAGE).gz $@

$(ORIGIMAGE).gz: $(ORIGIMAGE)
	gzip -c $< > $@

$(NEWIMAGE): $(NEWIMAGE).gz
	gzip -dc $< > $@
	rm $(NEWIMAGE).gz

$(NEWIMAGE).gz: image
	./image $(NEWIMAGE).gz

compiler.sto: sq AllMCompilerClasses.st AllMCompilerMethods.st MCompilerInitialize.st
	cat AllMCompilerClasses.st AllMCompilerMethods.st MCompilerInitialize.st > test.st
	./sq test.st compiler.sto
	rm -f test.st

clean : .FORCE
	rm -f *~ *.o sqgreg.c image.c *.image *.image.gz sq mkimage image

