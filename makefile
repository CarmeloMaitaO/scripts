# PATH related variables. Modify to suit your needs
dir=`pwd`
local-scripts:=$(HOME)/.local/bin
system-wide-scripts=/usr/bin
wayland-sessions=/usr/share/wayland-sessions

# Make targets to execute depending on the selected one
INSTALL_DEPS = update-s6 startup-s6
INSTALL_ROOT_DEPS = startup-dwl
WAYLAND_SESSIONS_DEPS = dwl.desktop

# Main make targets. Select one of these to install the scripts
install: $(local-scripts) $(INSTALL_DEPS)

install-root: $(INSTALL_ROOT_DEPS)

install-wayland-sessions: $(WAYLAND_SESSIONS_DEPS)

uninstall:
	cd $(local-scripts); rm $(INSTALL_DEPS)

uninstall-root:
	cd $(system-wide-scripts); rm $(INSTALL_ROOT_DEPS)

uninstall-wayland-sessions:
	cd $(wayland-sessions); rm $(WAYLAND_SESSIONS_DEPS)

# Secondary make targets. These will be executed depending on the selected main
# make target.
$(local-scripts):
	mkdir -p $(HOME)/.local/bin

update-s6:
	chmod +x $(dir)/update-s6
	ln -sf $(dir)/update-s6 $(local-scripts)

startup-s6:
	chmod +x $(dir)/startup-s6
	ln -sf $(dir)/startup-s6 $(local-scripts)

startup-dwl:
	chmod +x $(dir)/startup-dwl
	ln -sf $(dir)/startup-dwl $(system-wide-scripts)/startup-dwl

dwl.desktop:
	ln -f $(dir)/.dwl.desktop $(wayland-sessions)/dwl.desktop


# .PHONY target to make sure that the recipes will always be executed
PHONY_MAIN_DEPS = install install-root install-wayland-sessions
PHONY_SECONDARY_DEPS = $(INSTALL_DEPS) $(INSTALL_ROOT_DEPS)
PHONY_SECONDARY_DEPS += $(WAYLAND_SESSIONS_DEPS) $(local-scripts)

.PHONY: $(PHONY_MAIN_DEPS) $(PHONY_SECONDARY_DEPS)
