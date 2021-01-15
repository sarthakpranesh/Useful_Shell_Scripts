read -n 20 -p "Enter the disk name: " installDisk

echo "Working in Chroot"
sleep 3

# Setting Timezone, below command cana be used to list all timezones
# timedatectl list-timezones
timedatectl set-timezone Asia/Kolkata

# Setting up locals for language, numbers, date, etc
# The 'etc/locale.gen' file contains all the local settings in commented format
# For ease, here I am just going to add another one with en_US.UTF-8 UTF-8
echo "en_US.UTF-8 UTF-8" >> etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

sleep 3

# Setting up Network configuration
# Set hostname
echo "ArchSystem" >> /etc/ArchSystem;
# Create hosts file
echo "127.0.0.1		localhost
::1		localhost
127.0.1.1		ArchSystem" >> /etc/hosts;

sleep 3

# Install the bootloader
pacman -S grub efibootmgr
# Place for mounting efi partition
mkdir /boot/efi
# Mount efi partition
mount $installDisk'1' /boot/efi
# Install grub
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# For now sticking with xorg, want to shift to wayland
pacman -S xorg
pacman -S gnome
# Start required services
systemctl start gdm.service
systemctl enable gdm.service
systemctl enable NetworkManager.service

# Setup the root password
read -n 40 -p "Please enter the desired system password: " pass
passwd
