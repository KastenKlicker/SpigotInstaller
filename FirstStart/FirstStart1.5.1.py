#Version 1.5.1
import os

version = "1.5.1"

os.system('cmd /k "@echo off && java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -Dcom.mojang.eula.agree=true -jar spigot-"' + version + '".jar && pause && exit"')
