@echo off
cd %~dp0
:color
title [DNSCrypt]
color 0D
color 0a
:start
echo Choose:
echo [1] set DNS to 127.0.0.1
echo [2] set back DNS to auto
echo [3] start DNSCrypt
echo [4] test DNSCrypt
set /p selectset=
if %selectset% == 1 goto showinterface 
if %selectset% == 2 goto showinterface
if %selectset% == 3 goto startdnscrypt
if %selectset% == 4 goto testdnscrypt
echo/
echo Choose again
echo/
goto start

:showinterface
echo/
netsh interface show interface
echo/
echo Select interface:
echo [1] Ethernet
echo [2] Wi-Fi
echo [3] Custom
set /p selectinterface=
if %selectinterface% == 1 goto interfaceethernet
if %selectinterface% == 2 goto interfacewifi
if %selectinterface% == 3 goto custominterface
echo/
echo Choose again
echo/
goto showinterface

:interfaceethernet
set interface=Ethernet
goto interfacechoosen

:interfacewifi
set interface=Wi-Fi
goto interfacechoosen

:custominterface
echo/
echo Input interface:
set /p interface=
echo/

:interfacechoosen
netsh interface ipv4 show dnsservers "%interface%"
echo/
:interfacechoosenloop
echo Are you sure?
echo [1] Yes
echo [2] No
set /p selectinterfacechoosen=
if %selectinterfacechoosen% == 1 goto exitloop
if %selectinterfacechoosen% == 2 goto showinterface
echo/
echo Choose again
echo/
goto interfacechoosenloop

:exitloop
if %selectset% == 1 goto setdns
if %selectset% == 2 goto setback

:setdns
echo/
echo Set %interface% primary to 127.0.0.1
netsh interface ipv4 set dnsservers "%interface%" static 127.0.0.1 primary >nul
echo Set %interface% secondary to 1.1.1.1
netsh interface ipv4 add dnsservers "%interface%" 1.1.1.1 index=2 >nul
netsh interface ipv4 show dnsservers "%interface%"
echo/
ipconfig /flushdns
echo/
goto start

:setback
echo/
netsh interface ipv4 set dnsservers "%interface%" dhcp
netsh interface ipv4 show dnsservers "%interface%"
echo/
ipconfig /flushdns
echo/
goto start

:startdnscrypt
echo/
start dnscrypt-proxy
echo/
goto start

:testdnscrypt
echo/
echo Testing DNSCrypt
echo/
.\dnscrypt-proxy -resolve example.com
echo/
pause
echo/
goto start
