# Version 1.7.9

# @author KastenKlicker

import os
import os.path
from os import path

version = "1.7.9"
dir = os.path.abspath(version)

# Check if directory exist

# Yes, it's exist
if path.exists(version):
    print("Error: Path exists already!")
    print("CLOSING THIS WINDOW WILL DELETE THE FOLLOWING DIRECTORY: " + dir + "!")
    print("Do you want to remove " + dir + "?")
    print("Type <YES> for deleting the directory " + version + " and continue or type anything else to abort the Installation.")

    decision = input()

     # Deletes the directory and jumps back to the Installer
    if decision == "YES":
        os.system('cmd /k "rmdir /s "' + version + '" && exit"')
        exit()

    # Abort Installation
    else:
        os.system('cmd /k "taskkill /im SpigotInstaller.exe /f && exit"')
        exit()
        
# No, it doesn't exist, jumps back to Installer
else:
    exit()
