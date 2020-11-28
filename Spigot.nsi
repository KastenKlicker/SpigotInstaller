# author KastenKlicker

!include "MUI.nsh"
!include "x64.nsh"

Unicode true
Name "Spigot"

OutFile "SpigotInstaller.exe"
InstallDir $PROFILE\Spigot

#Open INSTDIR at the end
Function OpenFolder
  ExecShell "open" "$INSTDIR"
FunctionEnd

#WelcomePage
!define MUI_WELCOMEFINISHPAGE_BITMAP "The\path\you\downloaded\the\repository\BuildFiles\Spigot.bmp" #REMINDER: Change this to your own path.
!define MUI_WELCOMEPAGE_TITLE "Install Spigot"
!define MUI_WELCOMEPAGE_TEXT "This is a GUI Installer for Spigot, it will help you to install Spigot. This is not an offical program of spigotmc.org."
!insertmacro MUI_PAGE_WELCOME

#Other Pages
!insertmacro MUI_PAGE_COMPONENTS
Page custom CustomFile CustomFileLeave	#Only if section Custom JAR File is selected
Page custom Notes
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_LICENSE "The\path\you\downloaded\the\repository\BuildFiles\license.txt" #REMINDER: Change this to your own path.
!insertmacro MUI_PAGE_INSTFILES

#FinishPage
!define MUI_FINISHPAGE_TITLE "You have installed Spigot!"
!define MUI_FINISHPAGE_TEXT "If you want to start the server go in the server directory, choose your Version and execute the start.bat"
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "Open Installation Folder"
!define MUI_FINISHPAGE_RUN_FUNCTION "OpenFolder"
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

#Absolute path of License.txt
LicenseData "The\path\you\downloaded\the\repository\BuildFiles\license.txt" #REMINDER: Change this to your own path.

Function Notes
	ReserveFile "CustomFile.ini"
    !insertmacro MUI_INSTALLOPTIONS_EXTRACT "Notes.ini"
	!insertmacro MUI_INSTALLOPTIONS_DISPLAY "Notes.ini"
FunctionEnd

#######################################################################################################################################################

#Install AdoptOpenJDK JRE 8
Section /o "Java 8" adoptopenjdk
	SetOutPath $INSTDIR

	#Check architecture
	${If} ${RunningX64}
	
		#Download x64 msi Installer
		inetc::get "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u275-b01/OpenJDK8U-jre_x64_windows_hotspot_8u275b01.msi" "$INSTDIR\OpenJDK8U-jre_x64_windows_hotspot_8u275b01.msi" /END
		Pop $0
		${IfNot} $0 == "OK"
			MessageBox MB_OK "$0"
		${EndIf}

		#Execute Installer
		ExecWait '"msiexec" /i "$INSTDIR\OpenJDK8U-jre_x64_windows_hotspot_8u275b01.msi"'

		#Delete Installer
		Delete "$INSTDIR\OpenJDK8U-jre_x64_windows_hotspot_8u275b01.msi"

	${Else}

		#Download x86 msi Installer
		inetc::get "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u275-b01/OpenJDK8U-jre_x86-32_windows_hotspot_8u275b01.msi" "$INSTDIR\OpenJDK8U-jre_x86-32_windows_hotspot_8u275b01.msi" /END
		Pop $0
		${IfNot} $0 == "OK"
			MessageBox MB_OK "$0"
		${EndIf}

		#Execute Installer
		ExecWait "$INSTDIR\OpenJDK8U-jre_x86-32_windows_hotspot_8u275b01.msi"

		#Delete Installer
		Delete "$INSTDIR\OpenJDK8U-jre_x86-32_windows_hotspot_8u275b01.msi"

	${EndIf}
SectionEnd

#######################################################################################################################################################################

#Custom Installation
Section /o "Custom JAR File" custom_section
SectionEnd

Function CustomFile
	#Check if section is selected
	SectionGetFlags ${custom_section} $R0
	IntOP $R0 $R0 & ${SF_SELECTED}
	IntCmp $R0 ${SF_SELECTED} show

	#No
	Abort

	#Yes
	show:
	ReserveFile "CustomFile.ini"
    !insertmacro MUI_INSTALLOPTIONS_EXTRACT "CustomFile.ini"
	!insertmacro MUI_INSTALLOPTIONS_DISPLAY "CustomFile.ini"
    !insertmacro MUI_HEADER_TEXT "CustomFile" "Choose a custom server jar and a name for your server."

	#!insertmacro MUI_DESCRIPTION_TEXT ${custom_section} "Choose a server jar to create a server, not supported by the Installer, like PaperMc."
FunctionEnd

#Set variables for User Input
var jar
var name

Function CustomFileLeave
	#Check if section is selected
	SectionGetFlags ${custom_section} $R0
	IntOP $R0 $R0 & ${SF_SELECTED}
	IntCmp $R0 ${SF_SELECTED} show

	#No
	Abort

	#Yes
	show:

	#Get User Input
	!insertmacro MUI_INSTALLOPTIONS_READ $jar "CustomFile.ini" "Field 2" "state"
	!insertmacro MUI_INSTALLOPTIONS_READ $name "CustomFile.ini" "Field 4" "state"

	#Check if fields where filled
    ${If} $jar == "" 
	${OrIf} $name == ""
        SetCtlColors $jar "0x000000" "0xFF0000"
        Abort

    ${Else}
        SetCtlColors $jar "0x000000" "0xFFFFFF"
		SetOutPath $INSTDIR

		#Copy server jar to INSTDIR
        CopyFiles $jar $INSTDIR\$name.jar

		#Write eula.txt
		FileOpen $9 "eula.txt" w
		FileWrite $9 "eula=true"
		FileClose $9

		#Write start.bat
		FileOpen $9 "start.bat" w
		FileWrite $9 "@echo off && java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar $name.jar nogui && pause"
		FileClose $9

    ${EndIf}
FunctionEnd	

#######################################################################################################################################################

#Installation with BuildTools.jar
!macro BuildTools Version

	#Installation
	SectionGroup "Version ${Version}"

	#Check architecture
	Section /o ""
		${IfNot} ${RunningX64}
			MessageBox MB_OK "Non 64 bit os is used. Use a 64 bit Windows system."
			Abort
		${EndIf}
	SectionEnd

	Section /o ""
		SetOutPath $INSTDIR
		File "BuildFiles\checkPath.exe"
		File "BuildFiles\RunBuildTools.exe"

		#Execute CheckPath.exe
		nsExec::Exec "checkPath.exe $INSTDIR" $0
		Pop $0

		#Check returned value
		${If} $0 == 1
			MessageBox MB_OK "The path does contain any keywords.$\nPlease restart the installation."
			Abort

		${ElseIf} $0 == 0
			MessageBox MB_OK "Don't close any window."

		${Else}
			MessageBox MB_OK "An error occured: $0. Please restart the Installation and report this bug:$\nhttps://github.com/KastenKlicker/SpigotInstaller"
			Abort
		
		${EndIf}

		#Download BuildTools.jar
		inetc::get "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" "$INSTDIR\BuildTools.jar"
		Pop $0

		#Execute RunBuildTools.exe
		ExecWait "$INSTDIR\RunBuildTools.exe ${Version}"

		#Write eula.txt
		FileOpen $9 "eula.txt" w
		FileWrite $9 "eula=true"
		FileClose $9

		#Write start.bat
		FileOpen $9 "start.bat" w
		FileWrite $9 "@echo off && java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot-${Version}.jar nogui && pause"
		FileClose $9

	SectionEnd

	#Delete exe files
	Section /o ""
		Delete "CheckPath.exe"
		Delete "RunBuildTools.exe"
	SectionEnd

	#Delete Buildfiles at reboot
	Section /o "Delete BuildFiles at reboot"
		Delete "BuildTools.jar"

		RMDir /r /REBOOTOK "Spigot"
		RMDir /r /REBOOTOK "work"
		RMDir /r /REBOOTOK "PortableGit-2.24.1.2-64-bit"
		RMDir /r /REBOOTOK "CraftBukkit"
		RMDir /r /REBOOTOK "Bukkit"
		RMDir /r /REBOOTOK "BuildData"
		RMDir /r /REBOOTOK "apache-maven-3.6.0"

		MessageBox MB_OK "All BuildFiles will be deleted after reboot."
	SectionEnd

	SectionGroupEnd
!macroend

#######################################################################################################################################################################

#Installation with GetBukkit
!macro GetBukkit Version URL
	SectionGroup "Version ${Version}"

	Section /o ""

		SetOutPath $INSTDIR
		
		#Download Spigot
		inetc::get "${URL}" "$INSTDIR\Spigot-${VERSION}.jar"
		Pop $0

		#Write eula.txt
		FileOpen $9 "eula.txt" w
		FileWrite $9 "eula=true"
		FileClose $9

		#Write start.bat
		FileOpen $9 "start.bat" w
		FileWrite $9 "@echo off && java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot-${Version}.jar nogui && pause"
		FileClose $9
	SectionEnd
	SectionGroupEnd
!macroend

#######################################################################################################################################################################

#Section description
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${custom_section} "Choose a server jar to create a server, not supported by the Installer, like PaperMc."
	!insertmacro MUI_DESCRIPTION_TEXT ${adoptopenjdk} "Install Java 8 with AdoptOpenJDK JRE version for more perfromance."
!insertmacro MUI_FUNCTION_DESCRIPTION_END

#Installation
!insertmacro BuildTools "1.16.4"
!insertmacro BuildTools "1.15.2"
!insertmacro BuildTools "1.14.4"
!insertmacro BuildTools "1.13.2"
!insertmacro BuildTools "1.12.2"

!insertmacro GetBukkit "1.11.2" "https://cdn.getbukkit.org/spigot/spigot-1.11.2.jar"

!insertmacro BuildTools "1.10.2"
!insertmacro BuildTools "1.9.4"
!insertmacro BuildTools "1.8.8"

!insertmacro GetBukkit "1.7.10" "https://cdn.getbukkit.org/spigot/spigot-1.7.10-SNAPSHOT-b1657.jar"
!insertmacro GetBukkit "1.6.4" "https://cdn.getbukkit.org/spigot/spigot-1.6.4-R2.1-SNAPSHOT.jar"
!insertmacro GetBukkit "1.5.2" "https://cdn.getbukkit.org/spigot/spigot-1.5.2-R1.1-SNAPSHOT.jar"
!insertmacro GetBukkit "1.4.7" "https://cdn.getbukkit.org/spigot/spigot-1.4.7-R1.1-SNAPSHOT.jar"
!insertmacro GetBukkit "1.4.6" "https://cdn.getbukkit.org/spigot/spigot-1.4.6-R0.4-SNAPSHOT.jar"