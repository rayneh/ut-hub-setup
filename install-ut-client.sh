#!/bin/bash

mkdir ~/hub
cd ~/hub

echo "Download UT Server Client"
wget https://s3.amazonaws.com/unrealtournament/ShippedBuilds/%2B%2BUT%2BRelease-Next-CL-3525360/UnrealTournament-Server-XAN-3525360-Linux.zip
unzip UnrealTournament-Server-XAN-3525360-Linux.zip -d ~/hub
rm ~/hub/UnrealTournament-Server-XAN-3525360-Linux.zip
chmod +x ~/hub/LinuxServer/Engine/Binaries/Linux/UE4Server-Linux-Shipping

echo "Copy config files"
rsync --remove-source-files -a ~/upugs-hub-setup/* ~/hub/
rm -rf ~/upugs-hub-setup

echo "Install BlueprintHttp"
wget -O ~/hub/LinuxServer/Engine/Plugins/Runtime/BlueprintHttp-master.zip https://github.com/UT4-BTDevTeam/BlueprintHttp/archive/refs/heads/master.zip
unzip ~/hub/LinuxServer/Engine/Plugins/Runtime/BlueprintHttp-master.zip -d ~/hub/LinuxServer/Engine/Plugins/Runtime/
rm ~/hub/LinuxServer/Engine/Plugins/Runtime/BlueprintHttp-master.zip

echo "Doanload paks, rulesets, etc here"
#ADD SCRIPT HERE

echo "Create, stzart and enable service"
sudo cp ~/hub/hub.service /etc/systemd/system/hub.service
sudo systemctl daemon-reload
sudo systemctl start hub.service
sudo systemctl enable hub.service


