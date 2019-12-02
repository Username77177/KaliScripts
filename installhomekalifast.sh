#!/bin/bash
#Colors
RED='\033[0;31m'
GR='\033[0;32m'
NC='\033[0m'
#Programm
echo "Fast moves?"
echo "1 - Move WIN7 Password"
echo "7 - rm all WIN7"
echo "0 - quit"
read usr
if [[ $usr = "1" ]]
then
	if mkdir /mnt/win7fastpass
	then
		echo -e "${GR}Folder /mnt/win7fastpass was created!${NC}"
	else
		echo -e "${RED}Folder creation failed!${NC}"
	fi
	#Disk selector
	fdisk -l /dev/sda
	echo -e "${GR}Enter partition number:${NC}"
	read num
	echo "/dev/sda$num"
	if sudo ntfs-3g /dev/sda$num /mnt/win7fastpass
	then
		echo -e "${GR}/dev/sda1 was mount into /mnt/win7fastpass/${NC}"
	else
		echo -e "${RED}Mount failed!${NC}"
	fi
	cd /mnt/win7fastpass/Windows/System32/config/
	cd /mnt/win7fastpass/WINDOWS/system32/config/
	cd /mnt/win7fastpass/Windows/system32/config/
	cd /mnt/win7fastpass/WINDOWS/System32/config/
	pwd
	chntpw -u Admin SAM
	chntpw -u Админ SAM
	chntpw -u Администратор SAM
	chntpw -u Administrator SAM
	echo -e "${RED}Reboot?${NC}"
	read reb
	if [[ $reb -eq 1 ]]
	then
		umount /dev/sda$num
		umount
		reboot
		sudo poweroff
	fi
	umount /dev/sda$num
elif [[ $usr = "7" ]]
then
	mkdir /mnt/win7rm
	mount /dev/sda1 /mnt/win7rm
	rm -rf /mnt/win7rm/*
fi
