PREFIX    = /usr/local
MANPREFIX = $(PREFIX)/share/man

install:
	install -Dm755 -t $(DESTDIR)$(PREFIX)/bin bin/*
	install -Dm644 -t $(DESTDIR)$(PREFIX)/share/mutt-wizard share/*
	install -Dm644 -t $(DESTDIR)$(MANPREFIX)/man1/ mw.1 
	if ! [ "$(PREFIX)" = "/usr/local" ] ; then \
		sed 's:/usr/local:$(PREFIX):' $(DESTDIR)$(PREFIX)/share/mutt-wizard/mutt-wizard.muttrc > _ ;\
		install -Dm644 _ $(DESTDIR)$(PREFIX)/share/mutt-wizard/mutt-wizard.muttrc ;\
		sed 's:/usr/local:$(PREFIX):' $(DESTDIR)$(PREFIX)/bin/mw > _ ;\
		install -Dm755 _ $(DESTDIR)$(PREFIX)/bin/mw ;\
		sed 's:/usr/local:$(PREFIX):' $(DESTDIR)$(MANPREFIX)/man1/mw.1 > _ ;\
		install -Dm644 _ $(DESTDIR)$(MANPREFIX)/man1/mw.1 ;\
		rm -f _ ;\
	fi

uninstall:
	for script in bin/*; do \
		rm -f $(DESTDIR)$(PREFIX)/$$script; \
	done
	rm -rf $(DESTDIR)$(PREFIX)/share/mutt-wizard
	rm -f $(DESTDIR)$(MANPREFIX)/man1/mw.1

.PHONY: install uninstall
