#Create Autostart path
mkdir $HOME/.config/autostart

#Create vlc autoplay (THIS ASSUMES YOU HAVE VLC ALREADY INSTALLED!!!)
cat <<EOT > $HOME/.config/autostart/autovlc.desktop
[Desktop Entry] 
Type=Application
Exec=vlc -I dummy --loop --fullscreen --qt-minimal-view --no-qt-name-in-title --no-video-deco --no-embedded-video --no-video-title-show $HOME/playlist.m3u
EOT

#Create the playlist file
readlink -f $HOME/Videos/* > $HOME/playlist.m3u 

#Set your wallpaper
export DISPLAY=:0.0
pcmanfm --set-wallpaper $HOME/wallpaper.png 

#Backup original config.txt and disable Splash screen, You can comment out if you want Splash Screen
sudo cp /boot/firmware/config.txt /boot/firmware/config.txt.orig
echo "disable_splash=1" | sudo tee -a /boot/firmware/config.txt

# Optional Add your wallpaper as your own splash screen (Resolution will need to be correct) Uncomment next two lines
# sudo cp /usr/share/plymouth/themes/pix/splash.png /usr/share/plymouth/themes/pix/splash.png.orig
# sudo cp $HOME/wallpaper.png /usr/share/plymouth/themes/pix/splash.png

#Backup original cmdline.txt and disable logo, set loglevel so there is no log dump, and remove blinking cursor
sudo cp /boot/firmware/cmdline.txt /boot/firmware/cmdline.txt.orig 
sudo sed -i '/console.*/ s/$/ logo.nologo loglevel=3 vt.global_cursor_default=0/' /boot/firmware/cmdline.txt

sudo reboot -n
