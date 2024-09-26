#!/bin/bash

zenity --question --text="Do you want to debloat your system?" --no-wrap
if [ $? = 0 ]; then


	## Remove the bloat
	sudo apt purge redshift -y
	sudo apt purge libreoffice-core -y
	sudo apt purge libreoffice-common -y
	sudo apt purge transmission-gtk -y
	sudo apt purge thunderbird -y
	sudo apt purge rhythmbox -y
	sudo apt purge pix -y
	sudo apt purge simple-scan -y
	sudo apt purge drawing -y
	sudo apt purge gnote -y
	sudo apt purge xreader -y
	sudo apt purge onboard -y
	sudo apt purge gnome-calendar -y
	sudo apt purge gnome-logs -y
	sudo apt purge gnome-power-manager -y
	sudo apt purge onboard -y
	sudo apt purge warpinator -y
    sudo apt purge xfce4-dict -y
    sudo apt purge sticky -y
    sudo apt purge mintwelcome* -y
    sudo apt purge gnome-calculator -y
    sudo apt purge hypnotix -y
    sudo apt purge blueman* -y
    sudo apt purge system-config-printer -y
    sudo apt purge gucharmap -y

    # Remove WebApps
    rm  $HOME/.local/share/applications/*

	sudo apt autoremove -y && sudo apt clean
else
	exit
fi

zenity --question --text "Do you want remove flatpak and mark it on hold?" --no-wrap
if [ $? = 0 ]; then

	##mark packages on hold
	sudo apt purge flatpak
	sudo apt-mark hold flatpak
else
	exit
fi


zenity --question --text "Would you like to update your system?" --no-wrap
if [ $? = 0 ]; then

	#update and upgrade mint
	sudo apt update && sudo apt upgrade -y

else
	exit
fi

exit
