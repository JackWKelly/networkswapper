@echo on
rem batch file to switch between LAN and wifi automagically when called
rem be sure to run as admin
set "togglewifi=DISABLE"
netsh interface show interface name="Wireless Network Connection" | find /i "Disconnected" >nul && set "togglewifi=ENABLE"

if %togglewifi% == ENABLE (
	echo SWITCHING TO WIFI
	netsh interface set interface "Wireless Network Connection" admin = ENABLE
	netsh interface set interface "Local Area Connection" admin = DISABLE
) else (
	echo SWITCHING TO LAN
	netsh interface set interface "Wireless Network Connection" admin = DISABLE
	netsh interface set interface "Local Area Connection" admin = ENABLE
)
echo Done!
