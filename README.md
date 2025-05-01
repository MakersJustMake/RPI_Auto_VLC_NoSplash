# RPI_Auto_VLC_NoSplash
Automatically configure RPIs to launch VLC video for displays. Disables splash screens, RPI logos, sets desktop background, etc.


Its fairly straight forward, but before you run the script from command line you must add your video files to $HOME/Videos/ and add your wallpaper.png to $HOME/

This assumes that you are logging via ssh as I run this on RPIs with no console access and an HDMI backpack.

```
scp <LOCATION OF WALLPAPER PNG>/<FILENAME>.png <USERNAME>@<IP ADDRESS OF RPI>./wallpaper.png
scp rpi_config.sh <USERNAME>@<IP ADDRESS OF RPI>./
scp <LOCATION OF VLC FILES TO AUTOPLAY> <USERNAME>@<IP ADDRESS OF RPI>./Videos/
```

Then you should ssh into your raspberry pi and validate that your wallpaper.png is in the home folder, and your videos are in the $HOME/Videos/ location

Last execute the script
```
chmod 700 rpi_config.sh
./rpi_config.sh
```
