dir=`pwd`

install: update-s6

install-root: dwl-startup

check-folder:
	mkdir -p $(HOME)/.local/bin

dwl-startup:
	chmod +x $(dir)/dwl-startup
	ln -sf $(dir)/dwl-startup /usr/bin/dwl-startup

update-s6: check-folder
	chmod +x $(dir)/update-s6
	ln -sf $(dir)/update-s6 $(HOME)/.local/bin

.PHONY: install dwl-startup update-s6 check-folder
