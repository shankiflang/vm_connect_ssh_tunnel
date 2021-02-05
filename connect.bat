@ECHO OFF 
TITLE Machine connection
ECHO Please wait... Recovery of information in progress.

ECHO ============================
ECHO HARDWARE INFO
ECHO ============================
systeminfo | findstr /c:"Total Physical Memory"
wmic cpu get name
wmic diskdrive get name,model,size
wmic path win32_videocontroller get name

ECHO ============================
ECHO NETWORK INFO
ECHO ============================
ipconfig | findstr IPv4
ipconfig | findstr IPv6

ECHO ============================
ECHO CONNEXION
ECHO ============================
set /p target_ip="Please enter the target (ip:port) : "
set /p local_port="Please enter the local port : "
set /p bridge_pass="Please enter the bridge password : "
ECHO You have chosen to redirect 127.0.0.1:%local_port% to %target_ip%
START /B plink -batch -C -T -L %local_port%:%target_ip% benjaminbenoit@51.103.51.153 -pw %bridge_pass%
mstsc /v:127.0.0.1:%local_port%

PAUSE