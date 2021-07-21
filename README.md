# Ubuntu Server Settings
Some Tips on Ubuntu1904

### Basic Configuration Options
```
# update to latest
sudo apt -y update && sudo apt -y upgrade

# select 3 to use vim as the default editor
sudo update-alternatives --config editor

# vim config
vim ~/.vimrc  # see template

# Optional: change hostname
sudo vim /etc/cloud/cloud.cfg  # set preserve_hostname: true
sudo hostnamectl set-hostname <hostname>

# change timezone - example Vancouver
sudo timedatectl set-timezone America/Vancouver

# optional disable supplying password to sudo
## add this line at the end of the file: \<user\> ALL=(ALL:ALL) NOPASSWD:ALL
sudo visudo

# modify .bashrc
cat <<EOF>> .bashrc
> alias vim="TERM=xterm-256color vim"  # for pgup/pgdn in vim to work in tmux properly
> EOF
```

### Hardware Configuration
```
# mount second hard drive to /builder, this is the buildslave directory
# find <new_drive>
sudo fdisk -l
sudo fdisk <new_drive>
# some of the commands
# [p] - print the current partition table
# [d] - add new partition
# [n] - add new partition
# [w] - save the changes and exit

# format disk
sudo mkfs.ext4 <new_drive>  # format disk to ext4 file system

# create a mount point
sudo mkdir /second_drive
sudo chmod 755

# mount temporarily (optional - for testing)
sudo mount <new_drive> /second_drive
 
# mount permanently (for AWS)
sudo blkid <new_drive>  # use this command to find out the UUID of the new drive
sudo vim /etc/fstab
  # add: UUID=<UUID> /second_drive  ext4    defaults    0 0
```

### Developer Configuration
```
# for Python development
sudo apt -y install python3-pip
sudo ln -s /usr/bin/python3.8 /usr/local/bin/python
sudo ln -s /usr/bin/pip3 /usr/local/bin/pip
sudo apt -y install virtualenv
```
