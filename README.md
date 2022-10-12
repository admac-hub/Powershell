# Powershell
Powershell scrip`s for IT admins


#----------------------------------------------------#
To run the silene unistaller need to follow certain craterias
Every installer have ceratin keys that makes him run in silent mode ,you just need to find them
Researching silent options for the specific software is just a onetime effort
from there start building you .csv file

.csv file contains data in comma separated values format(installer , keys) and looks like this...

Installer,Switch
Firefox Setup 72.0.2.msi,/qn
AnyDesk.exe,--install “C:\Anydesk” –start-with-win –silent –create-shortcuts –create-desktop-icon
7z1900-x64.msi,/qn
Chef-client-15.7.32-1x64.msi,/qn
Npp.7.8.3.Installer.exe,/S
ChromeSetup.exe,/silent /Install
