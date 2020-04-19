# @author KastenKlicker

!include "MUI.nsh"

Name "Spigot"

OutFile "SpigotInstaller.exe"
InstallDir $DOCUMENTS\Spigot\YourServerName

#Execute File on Finish
Function FinishPDF
  ExecShell "" "$INSTDIR\Installation.pdf"
FunctionEnd

#WelcomePage
!define MUI_WELCOMEFINISHPAGE_BITMAP "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\Spigot.bmp"
!define MUI_WELCOMEPAGE_TITLE "Install Spigot"
!define MUI_WELCOMEPAGE_TEXT "This is a GUI Installer for Spigot, it will help you to install Spigot. This is not an offical program of spigotmc.org. \n \nWarning: The Server can't be installed in an administrator direction! "
!insertmacro MUI_PAGE_WELCOME

#Other Pages
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_LICENSE "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"
!insertmacro MUI_PAGE_INSTFILES

#FinishPage
!define MUI_FINISHPAGE_TITLE "You have installed Spigot!"
!define MUI_FINISHPAGE_TEXT "After the Server started right you can close the Installer and stop the server with the command stop. If you want to start the server again go in the server directory, choose your Version and execute the StartSpigot-<Version>.bat"
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "Start InstallationPDF"
!define MUI_FINISHPAGE_RUN_FUNCTION "FinishPDF" #Download at the end of the script
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

#Absolute path of License.txt
LicenseData "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"

#Declare Variable
Var VERSION

#Version 1.15.2
SectionGroup "Version 1.15.2"
Section /o ""
	StrCpy $VERSION "1.15.2"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#################################################################################################################################################################

#Version 1.15.1
SectionGroup "Version 1.15.1"
Section /o ""
	StrCpy $VERSION "1.15.1"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#################################################################################################################################################################

#Version 1.15
SectionGroup "Version 1.15"
Section /o ""
	StrCpy $VERSION "1.15"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#################################################################################################################################################################

#Version 1.14.4
SectionGroup "Version 1.14.4"
Section /o ""
	StrCpy $VERSION "1.14.4"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

###################################################################################################################################################################

#Version 1.14.3
SectionGroup "Version 1.14.3"
Section /o ""
	StrCpy $VERSION "1.14.3"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

###################################################################################################################################################################

#Version 1.14.2
SectionGroup "Version 1.14.2"
Section /o ""
	StrCpy $VERSION "1.14.2"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

###################################################################################################################################################################

#Version 1.14.1
SectionGroup "Version 1.14.1"
Section /o ""
	StrCpy $VERSION "1.14.1"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

###################################################################################################################################################################

#Version 1.14
SectionGroup "Version 1.14"
Section /o ""
	StrCpy $VERSION "1.14"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

###################################################################################################################################################################

#Version 1.13.2
SectionGroup "Version 1.13.2"
Section /o ""
	StrCpy $VERSION "1.13.2"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

##########################################################################################################################################################################

#Version 1.13.1
SectionGroup "Version 1.13.1"
Section /o ""
	StrCpy $VERSION "1.13.1"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

##########################################################################################################################################################################

#Version 1.13
SectionGroup "Version 1.13"
Section /o ""
	StrCpy $VERSION "1.13"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

##########################################################################################################################################################################

#Version 1.12.2
SectionGroup "Version 1.12.2"
Section /o ""
	StrCpy $VERSION "1.12.2"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#######################################################################################################################################################################

#Version 1.12.1
SectionGroup "Version 1.12.1"
Section /o ""
	StrCpy $VERSION "1.12.1"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#######################################################################################################################################################################

#Version 1.12
SectionGroup "Version 1.12"
Section /o ""
	StrCpy $VERSION "1.12"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#######################################################################################################################################################################

#Version 1.11.2
SectionGroup "Version 1.11.2"
Section /o ""
	StrCpy $VERSION "1.11.2"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

###################################################################################CraftBukkit

#Version 1.11.1
SectionGroup "Version 1.11.1"
Section /o ""
	StrCpy $VERSION "1.11.1"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

###################################################################################CraftBukkit

#Version 1.11
SectionGroup "Version 1.11"
Section /o ""
	StrCpy $VERSION "1.11"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	RMDir /r "$INSTDIR\$VERSION\apache-maven-3.6.0"
	RMDir /r "$INSTDIR\$VERSION\BuildData"
	RMDir /r "$INSTDIR\$VERSION\Bukkit"
	RMDir /r "$INSTDIR\$VERSION\CraftBukkit"
	RMDir /r "$INSTDIR\$VERSION\PortableGit-2.24.1.2-64-bit"
	RMDir /r "$INSTDIR\$VERSION\Spigot"
	RMDir /r "$INSTDIR\$VERSION\work"
	Delete "$INSTDIR\$VERSION\BuildTools.jar"
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

########################################################################################################################################################################

#Version 1.10.2
SectionGroup "Version 1.10.2"
Section /o ""
	StrCpy $VERSION "1.10.2"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot.
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION-R0.1-SNAPSHOT-latest.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.10
SectionGroup "Version 1.10"
Section /o ""
	StrCpy $VERSION "1.10"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 655000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

##################################################################################################################################################################

#Version 1.9.4
SectionGroup "Version 1.9.4"
Section /o ""
	StrCpy $VERSION "1.9.4"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 655000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

########################################################################################################################################################################

#Version 1.9.2
SectionGroup "Version 1.9.2"
Section /o ""
	StrCpy $VERSION "1.9.2"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot.
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION-R0.1-SNAPSHOT-latest.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.9
SectionGroup "Version 1.9"
Section /o ""
	StrCpy $VERSION "1.9"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot.
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION-R0.1-SNAPSHOT-latest.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.8.8
SectionGroup "Version 1.8.8"
Section /o ""
	StrCpy $VERSION "1.8.8"
SectionEnd
#Installs and execute BuildTools
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 655000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.8.7
SectionGroup "Version 1.8.7"
Section /o ""
	StrCpy $VERSION "1.8.7"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot.
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION-R0.1-SNAPSHOT-latest.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.8.6
SectionGroup "Version 1.8.6"
Section /o ""
	StrCpy $VERSION "1.8.6"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot.
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION-R0.1-SNAPSHOT-latest.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.8.5
SectionGroup "Version 1.8.5"
Section /o ""
	StrCpy $VERSION "1.8.5"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot.
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION-R0.1-SNAPSHOT-latest.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.8.4
SectionGroup "Version 1.8.4"
Section /o ""
	StrCpy $VERSION "1.8.4"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot.
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION-R0.1-SNAPSHOT-latest.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.8.3
SectionGroup "Version 1.8.3"
Section /o ""
	StrCpy $VERSION "1.8.3"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot.
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION-R0.1-SNAPSHOT-latest.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.8
SectionGroup "Version 1.8"
Section /o ""
	StrCpy $VERSION "1.8"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot.
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-$VERSION-R0.1-SNAPSHOT-latest.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.7.10
SectionGroup "Version 1.7.10"
Section /o ""
	StrCpy $VERSION "1.7.10"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.7.10-SNAPSHOT-b1657.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.7.9
SectionGroup "Version 1.7.9"
Section /o ""
	StrCpy $VERSION "1.7.9"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.7.9-R0.2-SNAPSHOT.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.7.8
SectionGroup "Version 1.7.8"
Section /o ""
	StrCpy $VERSION "1.7.8"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.7.8-R0.1-SNAPSHOT.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.7.5
SectionGroup "Version 1.7.5"
Section /o ""
	StrCpy $VERSION "1.7.5"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.7.5-R0.1-SNAPSHOT-1387.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.7.2
SectionGroup "Version 1.7.2"
Section /o ""
	StrCpy $VERSION "1.7.2"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.7.2-R0.4-SNAPSHOT-1339.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.6.4
SectionGroup "Version 1.6.4"
Section /o ""
	StrCpy $VERSION "1.6.4"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.6.4-R2.1-SNAPSHOT.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.6.2
SectionGroup "Version 1.6.2"
Section /o ""
	StrCpy $VERSION "1.6.2"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.6.2-R1.1-SNAPSHOT.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.5.2
SectionGroup "Version 1.5.2"
Section /o ""
	StrCpy $VERSION "1.5.2"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.5.2-R1.1-SNAPSHOT.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.5.1
SectionGroup "Version 1.5.1"
Section /o ""
	StrCpy $VERSION "1.5.1"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.5.1-R0.1-SNAPSHOT.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.4.7
SectionGroup "Version 1.4.7"
Section /o ""
	StrCpy $VERSION "1.4.7"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.4.7-R1.1-SNAPSHOT.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd

#####################################################################################################################################################################

#Version 1.4.6
SectionGroup "Version 1.4.6"
Section /o ""
	StrCpy $VERSION "1.4.6"
SectionEnd

#Checks if path exist already
Section /o ""
	MessageBox MB_OK "Don't close any window."
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot/InstallSpigot$VERSION.exe" "$INSTDIR\InstallSpigot$VERSION.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot$VERSION.exe"
	AddSize 8270
SectionEnd

#Downloads Spigot. Link can't be used for other versions
Section /o ""
	SetOutPath "$INSTDIR\$VERSION"
	inetc::get "https://cdn.getbukkit.org/spigot/spigot-1.4.6-R0.4-SNAPSHOT.jar" "$INSTDIR\$VERSION\Spigot-$VERSION.jar"
SectionEnd

#Installs Startbatch
Section /o ""
	SetOutPath $INSTDIR\$VERSION
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-$VERSION.bat" "$INSTDIR\$VERSION\StartSpigot-$VERSION.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section /o ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\$VERSION
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart/FirstStart$VERSION.exe" "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
	Pop $0
Exec "$INSTDIR\$VERSION\FirstStart$VERSION.exe"
AddSize 45000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd



#Import license.txt with the absolute path
Section ""
  File "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"
SectionEnd

#Download Installation.pdf
Section ""
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Installation.pdf" "$INSTDIR\Installation.pdf"
	Pop $0
	AddSize 162
SectionEnd