#
#	@(#)Makefile	1.5 Date 87/05/09
#
CFLAGS	= -O
PFLAGS	= -O
FILES	= makefile ptc.p ptc.c ptc doc.ms doc.out ptc.man man.out
PAGELEN	= -rP70
DEV	= /dev/rst8
BLK	= 126

DESTDIR=
BINDIR=		/usr/sipb/${MACHINE}bin
MANDIR=		/usr/sipb/man

ptc: ptc.${MACHINE}

# default version
S	= p
ptc.NeXT ptc.vax: ptc.$S
	$Sc -J -O -o ptc ptc.$S

install.decmips install.mips ptc.decmips ptc.mips:
	@echo No pascal on the mips machine.

instal.rt ptc.rt:
	@echo No pascal on the RT.
	
# translated version
cptc:		cptc.c
		cc -O -o cptc cptc.c

cptc.c:		ptc.p ptc
		ptc < ptc.p > cptc.c

tests:	test0


#
#	Perform a simple test translating the source with the compiled
#	translator and the compairing its own source against its
#	translation of its own source. They should be exactly equal.
#
test0:	ptc cptc.c cptc FRC
	cptc < ptc.p > tmp.c
	cmp cptc.c tmp.c && rm tmp.c


FRC:

#
#	Documentation.
#
doc.out:	doc.ms
		tbl doc.ms | nroff -T$(TERM) $(PAGELEN) -ms - > doc.out

man.out:	ptc.man
		nroff -T$(TERM) $(PAGELEN) -man ptc.man > man.out


#
#	Maintenance
#
cleanup:
	rm -f cptc cptc.c tmp.c out

install: install.${MACHINE}

install.NeXT install.vax: ptc
	install -c -s ptc ${DESTDIR}${BINDIR}/ptoc
	install -c ptc.man ${DESTDIR}${MANDIR}/man1/ptoc.1

clean::	cleanup


clobber:: cleanup


tape:	$(FILES)
	tar cvfb $(DEV) $(BLK) $(FILES)
