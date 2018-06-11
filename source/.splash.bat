@setlocal
@echo off

:THEMING
set "col1=" & set "col2=" & set "col3=" & set "mark=" & set "col4=" & set "thgap="
set "red=[31m" & set "green=[32m" & set "yellow=[33m" & set "blue=[34m"
set "magenta=[35m" & set "cyan=[36m" & set "white=[37m" & set "off=[0m"
set theme=%fancy_theme%
if "%theme%"=="" set "theme=Green"
:: Apply Theme. options: Green, Holland
if "%theme%"=="Green" (set "col1=%green%" & set "col2=%green%" & set "col3=%green%" & set "col4=%yellow%" & set "thgap=  ")
if "%theme%"=="Holland" (set "col1=%red%" & set "col2=%white%" & set "col3=%cyan%" & set "col4=%white%" & set "mark=FIFA")
if "%~1"=="/dashboard" (goto DASHBOARD) else (goto SPLASH)

:DASHBOARD
echo  %col2%--------------------------------------------------------------------%off%
call :BIGTITLE
echo %col4%                                                _  ____  __ 
echo              Fast Build + Deploy Commands  __ _/ ^|^|__  ^|/ / 
echo                Gradle, JBOSS, GIT, 7zip    \ V / ^|_ / // _ \
echo                   by: zhuhang.jasper        \_/^|_^(_^)_^(_^)___/ %off%
goto END

:SPLASH
@cls
echo. & echo. & echo. & echo. & echo.
call :BIGTITLE
echo                       %col4%       _    ____    __    %off%
echo                       %col4% __ __/ ^|  ^|__  ^|  / / %off%
echo                       %col4% \ V /^| ^| _  / /_ / _ \ %off%
echo                       %col4%  \_/ ^|_^|(_)/_/(_)\___/ %off%
::echo                        [32m      _    ____    __ [0m
::echo                        [32m__ _ [32m/ ^|  ^|__  ^|  / / [0m
::echo                        [32m\ V /[32m^| ^| [32m_[32m  / /[32m_ [32m/ _ \ [0m
::echo                        [32m \_/ [32m^|_^|[32m^(_^)[32m/_/[32m^(_^)[32m\___/ [0m
echo. & echo. 
echo                     %green%Proudly presented by Zhu Hang
echo                             - UberFusion -%off%
echo. & echo. & echo. & echo.
if not "%~1"=="/exit" (pause)
goto END

::@called
:BIGTITLE
echo %thgap%         %col1% ___        _   %col2%___      _ _    _ %col3%___   _ _____   %off%
echo %thgap%         %col1%^| __^|_ _ __^| ^|_%col2%^| _ )_  _(_) ^|__^| %col3%^| _ ) /_\_   _^|__ %off%
echo %thgap%         %col1%^| _/ _` (_-^<  _%col2%^| _ \ ^|^| ^| ^| / _` %col3%^| _ \/ _ \^| ^|(_-^< %off%
echo %thgap%         %col1%^|_^|\__,_/__/\__%col2%^|___/\_,_^|_^|_\__,_%col3%^|___/_/ \_\_^|/__/ %white%%mark%%off%
goto :EOF

:END
@echo on
@endlocal