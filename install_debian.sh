#!/bin/sh
echo "Is your Cura installation located in /usr/share/cura-lulzbot/ ? (y/n)"
read yn
if [ "$yn" = "y" ]; then
	varThemedir="/usr/share/cura-lulzbot/resources/themes"
	varCuradir="/usr/share/cura-lulzbot"	
else
	read -p "Enter the location of Cura: " varCuradir
	varThemedir=$varCuradir"/resources/themes"
fi
if [ ! -d $varThemedir ]; then
	echo $varThemedir" not found. Exiting..."
else
	sudo cp -r lulzbot-dark $varThemedir
	if [ ! -d $varThemedir"/lulzbot-dark" ]; then
		echo $varThemedir" exists, but installing theme failed for some other reason."
	else
		sudo cp -r SettingComboBox.qml $varCuradir"/resources/qml/Settings/"		
		echo "Enjoy your new theme! Select LulzBot Dark from Prefrences > General > Theme in Cura, and restart Cura."
	fi
fi

