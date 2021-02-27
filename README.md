# Ubuntu Settings
Some Tips on Ubuntu1904
sudo apt install libavcodec-extra
### select 3 to use vim as the default editor
* sudo update-alternatives --config editor

### disable supplying password to sudo
* sudo visudo
* add this line at the end of the file: \<user\> ALL=(ALL:ALL) NOPASSWD:ALL

### install these to watch Netflix on Firefox
* install these Firefox Add-ons
  * Widevine Content Decryption Module provided by Google Inc.
  * OpenH264 Video Codec provided by Cisco Systems, Inc.
* sudo apt install libavcodec-extra

### setting up vnc server and remmina to allow remote connection with ssh
* sudo apt install x11vnc remmina openssh-server
* x11vnc -forever
* if you have x-server with your main computer, you can ssh into ubuntu with "ssh -Y <username>:<hostname>"
* start remmina and log in to the server

### change ubuntu resolution in Hyper-V
* sudo vim /etc/default/grub
* find the line: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
* for example, I want to have "1600x900" resolution, then I added "video=hyperv_fb:1600x900" to the string:
  * GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=hyperv_fb:1600x900"
* sudo update-grub
* sudo shutdown -r now
