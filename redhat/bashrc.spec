Summary: Bash dot file enhancements, complete package.
Name: bashrc
Version: 0.0.1
Release: 1
URL: http://github.com/simos/bashrc
Source: http://github.com/simos/bashrc
License: GPL
Group: System Environment/Shells
BuildRoot: %{_tmppath}/%{name}-buildroot
BuildArchitectures: noarch
Requires: bash

%description
bashrc is a collection of dot files that enable all the available
features of the bash shell such as intelligent completion, aliases
and key bindings. Once install, each user can opt in and enable 
individually the dot files by running 'bashrc_config'.
If you shell is not bash (for example it is tcsh, 
run "echo $SHELL"), use 'chsh' to change to "/bin/bash" to use bash.

%prep
%setup -q -n %{name}-%{version}

%build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/usr/bin
mkdir -p $RPM_BUILD_ROOT/usr/share/bashrc
install -m 755 bashrc_config $RPM_BUILD_ROOT/usr/bin/bashrc_config
install -m 755 src/bashrc $RPM_BUILD_ROOT/usr/share/bashrc
install -m 644 src/bashrc.alias $RPM_BUILD_ROOT/usr/share/bashrc/bashrc.alias
install -m 644 src/bashrc.bindkey $RPM_BUILD_ROOT/usr/share/bashrc/bashrc.bindkey
install -m 644 src/bashrc.complete $RPM_BUILD_ROOT/usr/share/bashrc/bashrc.complete
install -m 644 src/bashrc.hosts $RPM_BUILD_ROOT/usr/share/bashrc/bashrc.hosts
install -m 644 src/bashrc.set $RPM_BUILD_ROOT/usr/share/bashrc/bashrc.set
install -m 644 src/bashrc.local $RPM_BUILD_ROOT/usr/share/bashrc/bashrc.local

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%doc COPYING INSTALL FAQ TODO ChangeLog THANKS doc/bashrc.pdf doc/bashrc.ps doc/bashrc.sgml
%attr(755,root,root)/usr/bin/bashrc_config
%attr(755,root,root)/usr/share/bashrc
%attr(644,root,root)/usr/share/bashrc/bashrc
%attr(644,root,root)/usr/share/bashrc/bashrc.alias
%attr(644,root,root)/usr/share/bashrc/bashrc.bindkey
%attr(644,root,root)/usr/share/bashrc/bashrc.complete
%attr(644,root,root)/usr/share/bashrc/bashrc.hosts
%attr(644,root,root)/usr/share/bashrc/bashrc.set

%changelog
