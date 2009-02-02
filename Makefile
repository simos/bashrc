#############################################################################
##
## Author: Simos Xenitellis (simos.lists@googlemail.com)
##

## This is the makefile, part of the TCSHRC project
## at http://tcshrc.sourceforge.net

SHARETCSHRC="/usr/share/tcshrc"
BIN="/usr/bin"

help:
	@echo "tcshrc" makefile
	@echo
	@echo Options available:
	@echo  "  % make 		display this help"
	@echo
	@echo  "  % make backup		take a backup of the original .tcshrc"
	@echo  "                        (it is saved as .tcshrc.ORIGINAL)"
	@echo  "                        you should run this once in the begining"
	@echo  "                        otherwise you may overwrite the backup"
	@echo
	@echo  "  % make install	install the new .tcshrc* files in"
	@echo  "                        the current directory"
	@echo
	@echo  "  % make systeminstall	install the new .tcshrc* files in"
	@echo  "                        /usr/local/share/tcshrc, then add"
	@echo  "                        tcshrc_config to /usr/local/bin/"
	@echo
	@echo "The author does not take any responsibility" 
	@echo "for the bad use/misuse of this Makefile."
	@echo

backup:
	@test -f $(HOME)/.tcshrc.ORIGINAL && echo "Backup already exists!" || echo -n ""
	@test ! -f $(HOME)/.tcshrc || cp $(HOME)/.tcshrc $(HOME)/.tcshrc.ORIGINAL

install:
	@echo -n "Copying config files to $(HOME)..."
	@/bin/cp -f src/tcshrc          $(HOME)/.tcshrc
	@/bin/cp -f src/tcshrc.alias    $(HOME)/.tcshrc.alias
	@/bin/cp -f src/tcshrc.bindkey  $(HOME)/.tcshrc.bindkey
	@/bin/cp -f src/tcshrc.complete $(HOME)/.tcshrc.complete
	@/bin/cp -f src/tcshrc.hosts    $(HOME)/.tcshrc.hosts
	@/bin/cp -f src/tcshrc.set      $(HOME)/.tcshrc.set
	@test -e $(HOME)/.tcshrc.local || echo "You already have a ~/.tcshrc.local. Not overwriting."
	@test ! -e $(HOME)/.tcshrc.local || /bin/cp src/tcshrc.local $(HOME)/.tcshrc.local
	@/bin/cp -u src/tcshrc.local 	$(HOME)/.tcshrc.local
	@echo " done."

systeminstall:
	@echo -n "Copying config files to $(SHARETCSHRC)..."
	@/bin/mkdir -p $(SHARETCSHRC)/
	@/bin/cp -f src/tcshrc          $(SHARETCSHRC)/
	@/bin/cp -f src/tcshrc.alias    $(SHARETCSHRC)/
	@/bin/cp -f src/tcshrc.bindkey  $(SHARETCSHRC)/
	@/bin/cp -f src/tcshrc.complete $(SHARETCSHRC)/
	@/bin/cp -f src/tcshrc.hosts    $(SHARETCSHRC)/
	@/bin/cp -f src/tcshrc.set      $(SHARETCSHRC)/
	@/bin/cp -f src/tcshrc.local    $(SHARETCSHRC)/
	@/bin/cp -f README              $(SHARETCSHRC)/README.txt
	@chmod 0444 $(SHARETCSHRC)/tcshrc*
	@echo " done."
	@echo -n "Copying tcshrc_config to $(BIN)..."
	@/bin/cp -f tcshrc_config      $(BIN)
	@chmod 0755 $(BIN)/tcshrc_config
	@echo " done."
	@echo
	@echo "You can now use tcshrc_config"
	@echo "    as root to populate the /etc/skel directory"
	@echo "    so that each new user will have the config files,"
	@echo "or"
	@echo "    as any user to have your own copy of the "
	@echo "    tcshrc configuration files in your home directory."
	@echo 
	@echo "Q: Did you put the dot files in /etc/skel? A: No, use tcshrc_config."

sex: 
	@echo "Sorry, it's 'have sex', not 'make sex'."

love:
	@echo "make: *** No rule on how to make \`love'.  Stop."

war:
	@echo "make: *** No idea how to make war. War is stupid.  Stop."
