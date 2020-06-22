#!/bin/bash

echo "This script will install all libraries necessary for the MuSHR racecar. It assumes that this SD card has freshly been flashed with the NVIDIA stock image, and that there is an internet connection"
read -p "Would you like to proceed with installation? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

# Install ROS
wget https://raw.githubusercontent.com/prl-mushr/mushr/master/mushr_utils/install_scripts/mushr_ros.sh
source mushr_install_ros.sh
rm mushr_install_ros.sh

# Install MuSHR stack
wget https://raw.githubusercontent.com/prl-mushr/mushr/master/mushr_utils/install_scripts/mushr_install_stack.sh
source mushr_install_stack.sh
rm mushr_install_stack.sh

# Install hardware drivers
wget https://raw.githubusercontent.com/prl-mushr/mushr/master/mushr_utils/install_scripts/mushr_install_hw_drivers.sh
source mushr_install_hw_drivers.sh
rm mushr_install_hw_drivers.sh

echo "Installation complete. Please continue with the software setup at https://mushr.io/hardware/build_instructions/#software-setup"
