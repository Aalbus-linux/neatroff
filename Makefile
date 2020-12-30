# neatroff's default font and macro directories
FDIR = /usr/share/neatroff/font
MDIR = /usr/share/neatroff/tmac

CC = clang
CFLAGS2 = $(CFLAGS) "-DTROFFFDIR=\"$(FDIR)\"" "-DTROFFMDIR=\"$(MDIR)\""
LDFLAGS =
OBJS = roff.o dev.o font.o in.o cp.o tr.o ren.o out.o reg.o sbuf.o fmt.o \
	eval.o draw.o wb.o hyph.o map.o clr.o char.o dict.o iset.o dir.o

all: roff
%.o: %.c roff.h
	$(CC) -c $(CFLAGS2) $<
roff: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)
clean:
	rm -f *.o roff
