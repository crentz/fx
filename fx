#!/bin/bash


############################
#     Packages Install
############################


if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
apt clean ;
apt autoclean ;
sed -i '/^\([^#].*main\)*$/s/main/& contrib non-free/' /etc/apt/sources.list ;
echo "Acquire::ForceIPv4 \"true\" ;" >> /etc/apt/apt.conf ;
echo "Acquire::Languages \"0\" ;" >> /etc/apt/apt.conf ;
apt update && apt upgrade -y ;
apt install sudo \
wget \
unzip \
xserver-xorg \
xinit \
arandr \
fluxbox \
featherpad \
lxappearance \
lxpolkit \
sakura \
viewnior \
xpaint \
xpdf \
smplayer \
pcmanfm \
udevil \
gparted \
synaptic \
gufw \
alsa-utils \
volumeicon-alsa \
apulse \
wbar \
wbar-config \
nitrogen \
yad \
bleachbit \
libwebkit2gtk-4.0-dev \
refractasnapshot-base \
refractainstaller-gui \
firmware-linux-nonfree \
firmware-misc-nonfree \
firmware-b43-installer \
firmware-b43legacy-installer \
firmware-realtek \
firmware-atheros \
firmware-iwlwifi \
firmware-brcm80211 \
network-manager-gnome -y ;
usermod -aG sudo fluxuan ;
sed -i 's/false/true/' /etc/NetworkManager/NetworkManager.conf ;
rm -rf /usr/share/fluxbox/styles ;
sed -i 's/Devuan/Fluxuan/' /etc/motd ;
sed -i 's/Devuan/Fluxuan/' /etc/issue ;
sed -i 's/Devuan/Fluxuan/' /etc/issue.net ;
sed -i 's/Devuan/Fluxuan/' /etc/os-release ;
echo "vm.swappiness = 10" >>  /etc/sysctl.d/fluxuanctl.conf ;
echo "vm.dirty_ratio = 40" >>  /etc/sysctl.d/fluxuanctl.conf ;
echo "vm.dirty_background_ratio = 20" >>  /etc/sysctl.d/fluxuanctl.conf ;
echo "vm.vfs_cache_pressure = 50" >> /etc/sysctl.d/fluxuanctl.conf ;
rm -rf /usr/share/desktop-base ;
cd /etc/skel/ ;
curl -LJO raw.githubusercontent.com/crentz/FX/main/fx.zip ;
unzip fx.zip ;
chmod +x CCP Byef ;
rm -rf fxslim ;
mv CCP /usr/bin/ ;
mv Byef /usr/bin/ ;
touch /usr/bin/bbit ;
echo "!#/bin/bash" >> /usr/bin/bbit ;
echo "pkexec bleachbit" >> /usr/bin/bbit
chmod +x /usr/bin/bbit ;
mv wallpaper /usr/share/ ;
mv Dark-f /usr/share/themes/ ;
mv fx /usr/share/ ;
rm -rf /boot/grub/splash.png ;
cp /usr/share/fx/splash.png /boot/grub/ ;
mv start.wav /usr/share/sounds/ ;
cp /usr/share/fx/splash.png /usr/lib/refractasnapshot/iso/isolinux ;
sed -i 's/current_theme.*/current_theme  fxslim/' /etc/slim.conf ;
sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=3/' /etc/default/grub ;
sed -i 's/GRUB_THEME/#GRUB_THEME/' /etc/default/grub ;
sed -i 's/Devuan/Fluxuan/' /etc/default/grub ;
sed -i 's/Debian/Fluxuan/' /etc/default/grub ;
update-grub ;
rm -rf fx.zip ;
rm -rf /usr/share/doc/* ; 
rm -rf /usr/share/man/* ;
rm -rf /usr/share/groff/* ; 
rm -rf /usr/share/info/* ;
rm -rf /usr/share/lintian/* ;
rm -rf /usr/share/linda/* ; 
rm -rf /var/cache/man/* ;
rm -rd /var/log/apt ;
rm -rd /var/cache/apt ;
apt clean ;
apt autoclean ;
apt update ;
echo "if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startx fi" >> /home/fluxuan/.profile ;
cp -R .config/ .fluxbox/ .wbar .gtkrc-2.0 .screenlayout/ /home/fluxuan/ ;
cd ;
rm -rf fx ;
chown -R fluxuan:fluxuan /home/fluxuan/ ;
cp /usr/share/applications/bleachbit-root.desktop /usr/share/fx/system/ ;
sed -i 's/pkexec bleachbit/bbit/' /usr/share/fx/system/bleachbit-root.desktop ;
cd /home/fluxuan ;
curl -LJO raw.githubusercontent.com/crentz/FX/main/badwolf.deb
sudo apt install ./badwolf.deb ;
rm -rf badwolf.deb ;
echo "Packages finished and installed succesfully. Enjoy !"
