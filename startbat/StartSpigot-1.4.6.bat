@echo off
java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -Dcom.mojang.eula.agree=true -jar spigot-1.4.6.jar
pause