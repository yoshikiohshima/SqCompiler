CFLAGS = -g -Wall -O3

CC = gcc

DIFF = diff --strip-trailing-cr
TEE = cat >

all : sq

#sq : .FORCE
#	../leg -v -o sq.leg.c sq.leg
#	$(CC) $(CFLAGS) -o $@ sq.leg.c 
#	./$@

.SUFFIXES:

sq : sq.greg
	../greg -o sqgreg.c sq.greg
	$(CC) $(CFLAGS) -o sq sqgreg.c 

clean : .FORCE
	rm -f *~ *.o *.[pl]eg.[cd] $(EXAMPLES)

spotless : clean

test: sq
	./sq test.st x
	[ "`md5sum x`" = '6868b1f027d30aaf580c0a7e48bee3d1 *x' ]

.FORCE :
