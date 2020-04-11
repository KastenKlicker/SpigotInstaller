# @author KastenKlicker

!include "MUI.nsh"

Name "SpigotInstaller"

OutFile "SpigotInstaller.exe"
InstallDir $DOCUMENTS\Spigot\YourServerName

#WelcomePage
!define MUI_WELCOMEFINISHPAGE_BITMAP "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\Spigot.bmp"
!define MUI_WELCOMEPAGE_TITLE "Install Spigot"
!define MUI_WELCOMEPAGE_TEXT "This is a GUI Installer for Spigot, it will help you to install Spigot. This not an offical offical program of spigotmc.org. "
!insertmacro MUI_PAGE_WELCOME

#Other Pages
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_LICENSE "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"
!insertmacro MUI_PAGE_INSTFILES

#FinishPage
!define MUI_FINISHPAGE_TITLE "You have installed Spigot!"
!define MUI_FINISHPAGE_TEXT "After the Server started right you can close the Installer and stop the server with the command stop. If you want to start the server again go in the server directory, choose your Version and execute the StartSpigot-<Version>.bat"
!insertmacro MUI_PAGE_FINISH 

!insertmacro MUI_LANGUAGE "English"

LicenseData "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"

#Declare Variable
Var VERSION

#WarningPage
Function WarningPage
  # If you need to skip the page depending on a condition, call Abort.
  ReserveFile "Warning.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "Warning.ini"
  !insertmacro MUI_INSTALLOPTIONS_DISPLAY "Warning.ini"
FunctionEnd
 
Function WarningLeave
  # Form validation here. Call Abort to go back to the page.
  # Use !insertmacro MUI_INSTALLOPTIONS_READ $Var "Warning.ini" ...
  # to get values.
FunctionEnd



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
AddSize 655000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd



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
AddSize 655000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd


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
AddSize 655000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd



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
AddSize 655000
SectionEnd

#Delete Files having no use anymore
Section /o ""
	Delete "$INSTDIR\InstallSpigot$VERSION.exe"
SectionEnd
SectionGroupEnd


#Version 1.8.9
SectionGroup "Version 1.8.9"
Section /o ""
	StrCpy $VERSION "1.8.9"
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



Section ""
  File "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"
SectionEnd

Section ""
  File "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"
SectionEnd

