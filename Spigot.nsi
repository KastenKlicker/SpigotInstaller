# @author KastenKlicker

!include "MUI.nsh"

Name "SpigotInstaller"

OutFile "SpigotInstaller.exe"
InstallDir $DOCUMENTS\Spigot\YourServerName

Page Custom WelcomePage WelcomeLeave
Page Custom WarningPage WarningLeave

!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_LICENSE "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"
!insertmacro MUI_PAGE_INSTFILES

Page Custom LastPage LastLeave

!insertmacro MUI_LANGUAGE "English"

LicenseData "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"

#Declare Variable
Var VERSION

#WelcomePage
Function WelcomePage
  # If you need to skip the page depending on a condition, call Abort.
  ReserveFile "Welcome.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "Welcome.ini"
  !insertmacro MUI_INSTALLOPTIONS_DISPLAY "Welcome.ini"
FunctionEnd
 
Function WelcomeLeave
  # Form validation here. Call Abort to go back to the page.
  # Use !insertmacro MUI_INSTALLOPTIONS_READ $Var "Welcome.ini" ...
  # to get values.
FunctionEnd

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

#LastPage
Function LastPage
  # If you need to skip the page depending on a condition, call Abort.
  ReserveFile "Last.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "Last.ini"
  !insertmacro MUI_INSTALLOPTIONS_DISPLAY "Last.ini"
FunctionEnd
 
Function LastLeave
  # Form validation here. Call Abort to go back to the page.
  # Use !insertmacro MUI_INSTALLOPTIONS_READ $Var "Warning.ini" ...
  # to get values.
FunctionEnd

