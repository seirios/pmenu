include config.mk

SRCS = ${PROG}.c
OBJS = ${SRCS:.c=.o}

all: ${PROG}

${PROG}: ${OBJS}
	${CC} -o $@ ${OBJS} ${LDFLAGS}

${OBJS}: ${PROG}.h config.h

.c.o:
	${CC} ${CFLAGS} -c $<

clean:
	-rm ${OBJS} ${PROG}

install: install-bin install-man

install-bin: all
	mkdir -p ${DESTDIR}${PREFIX}/${BINDIR}
	install -m 755 ${PROG} ${DESTDIR}${PREFIX}/${BINDIR}/${PROG}

install-man:
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	install -m 644 ${PROG}.1 ${DESTDIR}${MANPREFIX}/man1/${PROG}.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/${PROG}
	rm -f ${DESTDIR}${MANPREFIX}/man1/${PROG}.1

.PHONY: all clean install uninstall
