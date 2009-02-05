#############################################################################
##
## Author: Simos Xenitellis (simos.lists@googlemail.com)
##

## This is the makefile, part of the BASHRC project
## at http://bashrc.sourceforge.net

SHAREBASHRC="/usr/share/bashrc"
BIN="/usr/bin"

help:
	@echo "bashrc" makefile
	@echo
	@echo Options available:
	@echo  "  % make 		display this help"
	@echo
	@echo  "  % make backup		take a backup of the original .bashrc"
	@echo  "                        (it is saved as .bashrc.ORIGINAL)"
	@echo  "                        you should run this once in the begining"
	@echo  "                        otherwise you may overwrite the backup"
	@echo
	@echo  "  % make install	install the new .bashrc* files in"
	@echo  "                        the current directory"
	@echo
	@echo  "  % make systeminstall	install the new .bashrc* files in"
	@echo  "                        /usr/local/share/bashrc, then add"
	@echo  "                        bashrc_config to /usr/local/bin/"
	@echo
	@echo "The author does not take any responsibility" 
	@echo "for the bad use/misuse of this Makefile."
	@echo

backup:
	@test -f $(HOME)/.bashrc.ORIGINAL && echo "Backup already exists!" || echo -n ""
	@test ! -f $(HOME)/.bashrc || cp $(HOME)/.bashrc $(HOME)/.bashrc.ORIGINAL

install:
	@echo "Copying config files to $(HOME)..."
	@/bin/cp -f src/bashrc          $(HOME)/.bashrc
	@/bin/cp -f src/bashrc.alias    $(HOME)/.bashrc.alias
	@/bin/cp -f src/bashrc.bindkey  $(HOME)/.bashrc.bindkey
	@/bin/cp -f src/bashrc.complete $(HOME)/.bashrc.complete
	@/bin/cp -f src/bashrc.hosts    $(HOME)/.bashrc.hosts
	@/bin/cp -f src/bashrc.set      $(HOME)/.bashrc.set
	@if [ -e $(HOME)/.inputrc ]; then echo "You already have a ~/.inputrc. Not overwriting."; fi
	@if [ ! -e $(HOME)/.inputrc ]; then /bin/cp -f src/inputrc $(HOME)/.inputrc; fi
	@if [ -e $(HOME)/.bashrc.local ]; then echo "You already have a ~/.bashrc.local. Not overwriting."; fi
	@if [ ! -e $(HOME)/.bashrc.local ]; then /bin/cp src/bashrc.local $(HOME)/.bashrc.local; fi
	@echo "Copying done."

systeminstall:
	@echo -n "Copying config files to $(SHAREBASHRC)..."
	@/bin/mkdir -p $(SHAREBASHRC)/
	@/bin/cp -f src/bashrc          $(SHAREBASHRC)/
	@/bin/cp -f src/bashrc.alias    $(SHAREBASHRC)/
	@/bin/cp -f src/bashrc.bindkey  $(SHAREBASHRC)/
	@/bin/cp -f src/bashrc.complete $(SHAREBASHRC)/
	@/bin/cp -f src/bashrc.hosts    $(SHAREBASHRC)/
	@/bin/cp -f src/bashrc.set      $(SHAREBASHRC)/
	@/bin/cp -f src/bashrc.local    $(SHAREBASHRC)/
	@/bin/cp -f README              $(SHAREBASHRC)/README.txt
	@chmod 0444 $(SHAREBASHRC)/bashrc*
	@echo " done."
	@echo -n "Copying bashrc_config to $(BIN)..."
	@/bin/cp -f bashrc_config      $(BIN)
	@chmod 0755 $(BIN)/bashrc_config
	@echo " done."
	@echo
	@echo "You can now use bashrc_config"
	@echo "    as root to populate the /etc/skel directory"
	@echo "    so that each new user will have the config files,"
	@echo "or"
	@echo "    as any user to have your own copy of the "
	@echo "    bashrc configuration files in your home directory."
	@echo 
	@echo "Q: Did you put the dot files in /etc/skel? A: No, use bashrc_config."

sex: 
	@echo "Sorry, it's 'have sex', not 'make sex'."

love:
	@echo "make: *** No rule on how to make \`love'.  Stop."

war:
	@echo "make: *** No idea how to make war. War is stupid.  Stop."
