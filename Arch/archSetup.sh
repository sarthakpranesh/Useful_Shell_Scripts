# Warning: Use this script at your own risk
# This script helps me install arch linux reliablily and efficiently
# Use these following commands to install arch linux, after you have entered the live boot:
#
# curl https://raw.githubusercontent.com/sarthakpranesh/Useful_Shell_Scripts/master/Arch/archSetup.sh > archSetup,sh
# bash archSetup.sh
#
# You will be required to enter information such as drive name to install arch on or network password while the script
# is executing.
#


# Default console keymap set to US, to modify the layout run:
# ls /usr/share/kbd/keymaps/**/*.map.gz
# loadkeys keyMapName

echo "Stage 1: Partitioning the disk for installation"
sleep 3
# Caution this will delete all your data on the Installation disk
# show all available disks
fdisk -l
# ask user which disk to install too
read -n 20 -p "Enter the Disk name to be used for installtion (eg: /dev/sda): " installDisk
(
	echo d; # delete existing partitions
	echo n; # create new EFI partition
	echo p; # Primary partition type
	echo 1; # Partition label
	echo ""; # Automatically select the start sector
	echo +512M; # Last sector, partition size
	echo t; # Need to change partition type from 'Linux' to 'EFI'
	echo ef; # ef should correspond to the EFI partion type
	echo n; # create new partition for root
	echo p;
	echo 2; 
	echo ""; # Automatically select the start sector 
	echo ""; # Let it default to cover the whole disk
	echo w; # Write the changes to the disk
	echo q; # and quit, in some cases it will automatically quiet 
) | fdisk $installDisk
# Creating file systems
mkfs.fat -F32 $installDisk'1'
mkfs.ext4 $installDisk'2'

echo "Stage 1: Complete"
sleep 3

clear

echo "Stage 2: Initialising Network connection"
sleep 3
# If Ethernet connection is attached wifi will not be initialized
if ping -q -c 1 -W 1 google.com > /dev/null; then
	echo "Ethernet/Wifi already Connected"
else
	echo "No Ethernet connection, trying to connect through wifi"

	# List all network Devices
	"device list" | iwctl

	# Ask which device to connect and display all network connections
	read -n 20 -p "Please enter the network device to use: " netDevice
	(
		echo "station device scan"
		echo "station device get-networks"
	) | iwctl

	# Ask which network to connect and its passphrase
	read -n 40 -p "Please enter the network name: " networkName
	read -n 40 -p "Please enter the password: " networkPass

	iwctl --passphrase $networkPass station device connect $networkName
fi

echo "Stage 2: Complete"
sleep 3

clear

echo "Stage 3: Package Mirror list correction"
sleep 3
# The package download and updates might be slow because of the default mirrors selected
# Here we use reflector to try to refresh our mirror list
# Sync pacman repo
pacman -Syy
# Install reflector
pacman -S reflector
# Create a backup of existing mirror list
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
# Generate new mirror list
reflector -c "IN" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

echo "Stage 3: Complete"
sleep 3

clear

echo "Stage 4: Installing base Arch linux"
sleep 3
# Mount the root partition
mount $installDisk'2' /mnt
pacstrap /mnt base linux linux-firmware vim nano

echo "Stage 4: Complete"
sleep 3

clear

echo "Stage 5: Configuring the Arch installation"
sleep 3
# Generating the fstab file
genfstab -U /mnt >> /mnt/etc/fstab
# Download the script to be run in chroot as root user
curl https://raw.githubusercontent.com/sarthakpranesh/Useful_Shell_Scripts/master/Arch/archChroot.sh > archChroot.sh
# Copy this script into '/mnt' directory
cp ./archChroot.sh /mnt/archChroot.sh 
# Chroot into the installed arch to configure it as root user
arch-chroot /mnt bash archChroot.sh;
# Exiting the chroot
exit

echo "Stage 5: Complete"
sleep 3

clear

echo "Arch Installation Complete"
