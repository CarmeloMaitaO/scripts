source-dirs:=$(wildcard */.)

install: $(source-dirs)
$(source-dirs):
	$(MAKE) -C `pwd`/$@

update:
	git submodule update --remote

.PHONY: install $(source-dirs)
