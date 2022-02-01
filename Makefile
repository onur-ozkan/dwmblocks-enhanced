.SILENT:

PREFIX ?= /usr/local
CC ?= cc
LDFLAGS = -lX11

output: dwmblocks.c
	${CC}  dwmblocks.c $(LDFLAGS) -o dwmblocks

clean:
	rm -f *.o *.gch dwmblocks
install: output
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 dwmblocks $(DESTDIR)$(PREFIX)/bin/dwmblocks
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmblocks

indent:
	indent --blank-lines-after-procedures --brace-indent0 --indent-level4 \
		--no-space-after-casts --no-space-after-function-call-names \
		--dont-break-procedure-type --format-all-comments \
		--line-length100 --comment-line-length100 --tab-size4 *.{c,h}

check-indentation:
	$(eval SOURCES := $(shell ls *.{c,h}))
	for i in $(SOURCES); do \
		export DIFFS=$$(diff $$i <(indent -st -bap -bli0 -i4 -ncs -npcs -npsl -fca -l100 -lc100 -ts4 $$i)); \
		if [ -z "$$DIFFS" ]; then echo -e "\033[0;32mValid indentation format -> $$i\033[0m"; else echo -e "\033[0;31mInvalid indentation format -> $$i\033[0m"; fi \
	done

check:
	@echo Checking indentation standards
	$(MAKE) check-indentation

.PHONY: clean install uninstall output indent check-indentation check
