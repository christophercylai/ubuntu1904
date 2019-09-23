# ubuntu1904
Some Tips on Ubuntu1904
sudo apt install libavcodec-extra
### select 3 to use vim as the default editor
* sudo update-alternatives --config editor

### disable supplying password to sudo
* sudo visudo
* add this line at the end of the file: \<user\> ALL=(ALL:ALL) NOPASSWD:ALL

### screen rotation to landscape
* sudo xrandr -o normal

### install these to watch Netflix
* install these Firefox Add-ons
** Widevine Content Decryption Module provided by Google Inc.
** OpenH264 Video Codec provided by Cisco Systems, Inc.
* sudo apt install libavcodec-extra
