#Version 1.7.2
import os

version = "1.7.2"

os.system('cmd /k "@echo off && java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -Dcom.mojang.eula.agree=true -jar spigot-"' + version + '".jar && pause && exit"')