EXAMPLES = sq

CFLAGS = -g -Wall -O3

DIFF = diff --strip-trailing-cr
TEE = cat >

all : $(EXAMPLES)

#sq : .FORCE
#	../leg -v -o sq.leg.c sq.leg
#	$(CC) $(CFLAGS) -o $@ sq.leg.c 
#	./$@

sq : .FORCE
	../greg -o sq.greg.c sq.greg
	$(CC) $(CFLAGS) -o $@ sq.greg.c 
	./$@

clean : .FORCE
	rm -f *~ *.o *.[pl]eg.[cd] $(EXAMPLES)

spotless : clean

.FORCE :
