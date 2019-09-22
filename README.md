# ubuntu1904
Some Tips on Ubuntu1904

#### select 3 to use vim as the default editor
* sudo update-alternatives --config editor

#### disable supplying password to sudo
* sudo visudo
* add this line at the end of the file: <user> ALL=(ALL:ALL) NOPASSWD:ALL
