EXAMPLES = sq

CFLAGS = -g

DIFF = diff --strip-trailing-cr
TEE = cat >

all : $(EXAMPLES)

sq : .FORCE
	../leg -o sq.leg.c sq.leg
	$(CC) $(CFLAGS) -o $@ sq.leg.c 
	echo 'a := 16r30 negated' | ./$@

clean : .FORCE
	rm -f *~ *.o *.[pl]eg.[cd] $(EXAMPLES)

spotless : clean

.FORCE :
