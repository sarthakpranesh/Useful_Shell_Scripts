# user needs to make sure they enter the same disk name they entered earlier
read -n 20 -p "Enter the disk name Arch is installed on (Same as previos): " installDisk

echo "Working in Chroot"
sleep 3

clear

echo "Stage 5: Task 1 - Setting Timezone"
sleep 3
# Below command can be used to list all timezones"
# timedatectl list-timezones
# You can replace the 'Asia/kolkata' timezone with your preferable one
timedatectl set-timezone Asia/Kolkata

echo "Stage 5: Task 1 - Complete"
sleep 3

clear

echo "Stage 5: Task 2 - Setting up locals for language, numbers, date, etc"
sleep 3
# The 'etc/locale.gen' file contains all the local settings in commented format
# For ease, here I am just going to add another one with en_US.UTF-8 UTF-8
echo "en_US.UTF-8 UTF-8" >> etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

echo "Stage 5: Task 2 - Complete"
sleep 3

clear

echo "Stage 5: Task 3 - Setting up Network configuration"
sleep 3
# Set hostname
echo "ArchSystem" >> /etc/ArchSystem;
# Create hosts file
echo "127.0.0.1		localhost
::1		localhost
127.0.1.1		ArchSystem" >> /etc/hosts;

echo "Stage 5: Task 3 - Complete"
sleep 3

clear

echo "Stage 5: Task 4 - Install and configure the bootloader"
sleep 3
# Install the grub bootloader
pacman -S grub efibootmgr
# Place for mounting efi partition
mkdir /boot/efi
# Mount efi partition
mount $installDisk'1' /boot/efi
# Install grub
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

echo "Stage 5: Task 4 - Complete"
sleep 3

clear

echo "Stage 5: Task 5 - Install and start required services for Desktop enviornment"
sleep 3
# For now sticking with xorg, want to shift to wayland
pacman -S xorg
pacman -S gnome
# Start required services
systemctl start gdm.service
systemctl enable gdm.service
systemctl enable NetworkManager.service

echo "Stage 5: Task 5 - Complete"

echo "Stage 5: Task 6 - Setup the root password"
sleep 3
passwd

echo "Stage 5: Task 6 - Complete"
sleep 3
