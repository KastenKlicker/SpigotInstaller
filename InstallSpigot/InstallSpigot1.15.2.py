import os
import os.path
from os import path

if path.exists("latest"):
    print("Error: Path exists already!")
    input("Press Enter to continue...")
else:
    os.system('cmd /k "mkdir 1.15.2 && cd 1.15.2 && curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && java -jar BuildTools.jar --rev 1.15.2 && echo Finished! && @ping -n 5 localhost> nul && exit"')
    exit()
