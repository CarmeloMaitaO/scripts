# scripts
My `sh` scripts for my Artix build.

## The scripts

### User local scripts
These scripts go into the `$HOME/.local/bin` folder by default, and they are
supposed to be used by an unpriviledge user.

#### update-s6
This is a copy of the script show in the [Artix
wiki](https://wiki.artixlinux.org/Main/LocalUserServicesOns6#Create_the_s6-rc_database)
about using S6 to manage local services. This script automates the compilation
of a new S6 database.

#### startup-s6
Automates the launch of S6. Currently, it takes no arguments, but it requires
to modify the `USER` variable to work on diferent hosts (you). 

### System-wide scripts
These scripts go into the `/usr/bin` folder by default, and they are supposed
to be avaible to all users. You need to install them as root.

#### startup-dwl
Set a couple of enviroments variables and launch DWL with a DBUS session. It
also outputs the [necessary
information](https://codeberg.org/fauxmight/waybar-dwl) to a file in
`$XDG_HOME_DATA` to allow a status bar (like Waybar) to show the `tags`,
`title` and `layout` information.

### Wayland sessions
These are the `\*.desktop` files that go into the `/usr/share/wayland-sessions`
folder by default. These are necessary if you intend to run one of my sessions
with a login manager.

#### dwl.desktop
It is the session file for my `startup-dwl` script. Install it if you want to
run DWL with my startup file in your login manager.

## How to install
You can place this folder wherever you want, given that the scripts will just
link themselves to the targeted folders.

### Install the user local scripts
To install the local (user) scripts, run:
`make`

### Install the system-wide scripts
To install the scripts that requires to be in `/usr/bin`, run:
`make install-root`

### Install the Wayland sessions
To install the Wayland sessions (\*.desktop files of
`/usr/share/wayland-sessions`), run:
`make install-wayland-sessions`
