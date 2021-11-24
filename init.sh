#!/bin/bash

# Create the user account for running 'steamcmd'.
# For simplicity's sake, it'll just aptly be named 'steam'. :P
echo "- Creating 'steam' user"
useradd -m steam

# Update the base system.
echo "- Updating installed packages"
yum update -y

# Install necessary dependencies for 'steamcmd' to run.
# These two dependencies are:
#   - glibc.i686
#   - libstdc++.i686
echo "- Installing necessary dependencies"
yum install -y glibc.i686 libstdc++.i686

# Cleanup all obsolete packages.
echo "- Cleaning up packages"
yum autoremove -y
yum clean all

# Download and extract the 'steamcmd' client.
echo "- Downloading steamcmd"
mkdir /tmp/steamcmd && cd /tmp/steamcmd
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

# Move the extracted folder to '/home/steam/'.
echo "- Moving steamcmd to home directory for 'steam'"
mv /tmp/steamcmd/ /home/steam/

# Set the ownership of the files to the 'steam' user and grant execution permissions.
echo "- Modifying steamcmd file ownership and permissions"
chown --recursive steam:steam /home/steam/steamcmd
chmod --recursive +x /home/steam/steamcmd

echo "- Finished"