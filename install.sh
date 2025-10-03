#!/bin/sh

echo -en "\nChecking the effective UID:"		# check for root account priviledges
if [ $(id -u) -gt 0 ]; then				# checks that this ACTION is being run as an elevated account (e.g. as root or using sudo) so we don't have any issues getting the directories all setup
	echo " [failure]"
#		 01234567890123456789012345678901234567890123456789012345678901234567890123456789
	echo
	echo -e "ERROR:"
	echo -e "This installation was executed without sufficient priviledges. Try using a"
	echo -e "different account or prefixing the call with 'sudo'.\n"
	exit 1
fi
echo " [done]"

#exit 0


echo -en "\nInstalling the software:"
cp -f bin/* /bin
if [ ! -e /etc/builder ]; then
	mkdir -p /etc/builder || {
		echo " [failure]"
		echo
		echo -e "ERROR: The configuration directory (/etc/builder) could not be created."
		exit 1
	}
fi
cp -f etc/* /etc/builder
if [ ! -e /usr/local/share/doc/builder ]; then
	mkdir -p /usr/local/share/doc/builder || {
		echo " [failure]"
		echo
		echo -e "ERROR: The doc directory (/usr/local/share/doc/builder) could not be created."
		exit 1
	}
fi
cp -f usr/local/share/doc/builder/* /usr/local/share/doc/builder
echo " [done]"

echo -e "\nCongrats! Your software is installed and ready for use!\n"
