# ubuntu1904
Some Tips on Ubuntu1904
sudo apt install libavcodec-extra
### select 3 to use vim as the default editor
* sudo update-alternatives --config editor

### disable supplying password to sudo
* sudo visudo
* add this line at the end of the file: \<user\> ALL=(ALL:ALL) NOPASSWD:ALL

### enable network controller: Broadcom Inc. and subsidiaries BCM43142
* sudo apt install --reinstall bcmwl-kernel-source
  * you will be asked to key in a password
* sudo shutdown -r now
* get into bios and disable "Secure Boot"
* follow on screen instrustion to "Register MOK"
  * use the password you key in above to complete the registration

### screen rotation to landscape
* sudo xrandr -o normal

### install these to watch Netflix
* install these Firefox Add-ons
  * Widevine Content Decryption Module provided by Google Inc.
  * OpenH264 Video Codec provided by Cisco Systems, Inc.
* sudo apt install libavcodec-extra
