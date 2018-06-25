@setlocal
@echo off

:THEMING
set "col1=" & set "col2=" & set "col3=" & set "mark=" & set "col4=" & set "thgap="
set "red=[31m" & set "green=[92m" & set "yellow=[33m" & set "blue=[34m"
set "magenta=[35m" & set "cyan=[36m" & set "white=[37m" & set "off=[0m" & set "inv=[7m"
set theme=%fancy_theme%
if "%theme%"=="" set "theme=Green"
:: Apply Theme. options: Green, Holland, Italy
if "%theme%"=="Green" (set "col1=%green%" & set "col2=%green%" & set "col3=%green%" & set "col4=%yellow%" & set "thgap=  ")
if "%theme%"=="Holland" (set "col1=%red%" & set "col2=%white%" & set "col3=%cyan%" & set "col4=%white%" & set "mark=FIFA")
if "%theme%"=="Italy" (set "col1=%green%" & set "col2=%white%" & set "col3=%red%" & set "col4=%white%" & set "mark=FIFA")
call :VERTITLE
if "%~1"=="/dashboard" (goto DASHBOARD) else (goto SPLASH)

:DASHBOARD
echo  %col2%--------------------------------------------------------------------%off%
call :BIGTITLE
echo                                           %col4%%vArt1%
echo              Fast Build + Deploy Commands %vArt2% 
echo                Gradle, JBOSS, GIT, 7zip   %vArt3% 
echo                   by: zhuhang.jasper      %vArt4% %off%
goto END

:SPLASH
@cls
echo. & echo. & echo. & echo. & echo.
call :BIGTITLE
echo                        %col4% %vArt1% %off%
echo                        %col4% %vArt2% %off%
echo                        %col4% %vArt3% %off%
echo                        %col4% %vArt4% %off%
echo. & echo. 
echo                     %green%Proudly presented by Zhu Hang
echo                             - UberFusion -%off%
echo. & echo. & echo. & echo.
if not "%~1"=="/exit" (pause)
goto END

::@called
:BIGTITLE
echo %thgap%        %col1% ___        _   %col2%___      _ _    _ %col3%___   _ _____   %off%
echo %thgap%        %col1%^| __^|_ _ __^| ^|_%col2%^| _ )_  _(_) ^|__^| %col3%^| _ ) /_\_   _^|__ %inv%%col1%__%off%
echo %thgap%        %col1%^| _/ _` (_-^<  _%col2%^| _ \ ^|^| ^| ^| / _` %col3%^| _ \/ _ \^| ^|(_-^< %inv%%col2%__%off%
echo %thgap%        %col1%^|_^|\__,_/__/\__%col2%^|___/\_,_^|_^|_\__,_%col3%^|___/_/ \_\_^|/__/ %inv%%col3%__%off% %white%%mark%%off%
goto :EOF

::@called
:VERTITLE
set "vArt1=" & set "vArt2=" & set "vArt3=" & set "vArt4="
set "vArt1=%vArt1%      _  ____ ___ "
set "vArt2=%vArt2% __ _/ ^|^|__  ( _ )"
set "vArt3=%vArt3% \ V / ^|_ / // _ \"
set "vArt4=%vArt4%  \_/^|_(_)_(_)___/"
goto :EOF

:END
@echo on
@endlocal