import os
os.system('cmd /k "@echo off && java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -Dcom.mojang.eula.agree=true -jar spigot-1.15.2.jar && pause && @echo on"')
