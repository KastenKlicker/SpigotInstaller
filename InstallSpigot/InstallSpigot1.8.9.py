# Version 1.8.8

# @author KastenKlicker

import os
import os.path
from os import path

version = "1.8.8"
dir = os.path.abspath(version)

# Check if directory exist

# Yes, it's exist
if path.exists(version):
    print("Error: Path exists already!")
    print("Do you want to remove " + dir + "?")
    print(
        "Type <YES> for deleting the directory " + version + " and continue or type anything else to abort the Installation.")

    decision = input()

    # Deletes the directory and starts downloading
    if decision == "YES":
        os.system(
            'cmd /k "rmdir /s "' + version + '" && mkdir "' + version + '" && cd "' + version + '" && curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && java -Xmx1024M -jar BuildTools.jar --rev "' + version + '" && echo Finished! && @ping -n 5 localhost> nul && exit"')
        exit()

    # Abort Installation
    else:
        os.system('cmd /k "taskkill /im SpigotInstaller.exe /f && exit"')
        exit()
# No, it doesn't exist, starts downloading
else:
    os.system(
        'cmd /k "mkdir "' + version + '" && cd "' + version + '" && curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && java -Xmx1024M -jar BuildTools.jar --rev "' + version + '" && echo Finished! && @ping -n 5 localhost> nul && exit"')
    exit()
