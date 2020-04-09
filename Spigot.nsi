# @author KastenKlicker

!include "MUI.nsh"

Name "SpigotInstaller"

OutFile "SpigotInstaller.exe"
InstallDir $DOCUMENTS\Spigot\YourServerName

Page Custom WelcomePage WelcomeLeave
Page Custom WarningPage WarningLeave

;!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_LICENSE "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"
!insertmacro MUI_PAGE_INSTFILES

Page Custom LastPage LastLeave

!insertmacro MUI_LANGUAGE "English"

LicenseData "C:\Users\sveni\Documents\PCKram\SpigotInstallation\Build\license.txt"

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

#Installs and execute BuildTools
Section ""
	MessageBox MB_OK "Don't close any window.(except this one)"
	SetOutPath $INSTDIR
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/InstallSpigot1.15.2.exe" "$INSTDIR\InstallSpigot1.15.2.exe"
	Pop $0
	ExecWait "$INSTDIR\InstallSpigot1.15.2.exe"
	AddSize 8270
SectionEnd

#Installs Startbatch
Section ""
	SetOutPath $INSTDIR\1.15.2
	inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/startbat/StartSpigot-1.15.2.bat" "$INSTDIR\1.15.2\StartSpigot-1.15.2.bat"
	Pop $0
SectionEnd

#Starts the server for the first time
Section ""
MessageBox MB_OK "The Server starts now for the first time. After it's done you can stop the server and close the Installer"
SetOutPath $INSTDIR\1.15.2
inetc::get "https://github.com/KastenKlicker/SpigotInstaller/raw/master/Build/FirstStart1.15.2.exe" "$INSTDIR\1.15.2\FirstStart1.15.2.exe"
	Pop $0
Exec "$INSTDIR\1.15.2\FirstStart1.15.2.exe"
AddSize 655000
SectionEnd

Section "LICENSE"
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

