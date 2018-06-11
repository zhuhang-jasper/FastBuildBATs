@call .preLoad.bat
@echo off
setlocal
if not "%mode%"=="dev" cls
call :GETBOOL %gradle_enable_debug%
if "%fancy_dashboard%"=="1" (goto FANCY) else (goto NORMAL)

:FANCY
call ".splash.bat" "/dashboard"
@echo off
goto REST

:NORMAL
echo  [32m--------------------------------------------------------------------[0m
echo                      [33m^<^<  %toolname%  ^>^>[0m
echo                 zhuhang's Fast Build + Deploy Commands
echo                      with Gradle, JBOSS, GIT, 7zip
::echo                         Project: [36m%project_title%[0m  
goto REST

:REST
echo.
set newline=^& echo.
set "dashboard="
set "dashboard=%dashboard%   Project: [97m%project_title%[0m"
set "dashboard=%dashboard% ^| Branch: [31m%dev_branch%[0m"
set "dashboard=%dashboard%%newline%"
set "dashboard=%dashboard%   JBOSS: [31m%branch_categ%[0m"
set "dashboard=%dashboard% ^| Gradle Penv: [31m%Penv%[0m"
set "dashboard=%dashboard% ^| Gradle DEBUG: [31m%gradle_enable_debug_bool%[0m"
echo %dashboard%
::echo     Git branch in use                ^=  [31m%dev_branch%[0m
::echo     JBOSS Environment                ^=  [31m%branch_categ%[0m
::echo     Gradle Penv ^(local//dev//...)    ^=  [31m%Penv%[0m
::echo     Gradle DEBUG STACKTRACE MODE     ^=  [31m%gradle_enable_debug_bool%[0m
::echo     run : branch-^>refinement (uat)   ^= [31m%jboss_uat_batname%[0m
::echo     run2: branch-^>reporting (fpxnew) ^= [31m%jboss_fpxnew_batname%[0m
echo  --------------------------------------------------------------------
echo   (Enter ^"config^" to perform user configurations)
echo   (Enter ^"/?^" to see help)
endlocal
@echo on
@goto :EOF

::@CALLED
:GETBOOL
@if "%~1"=="1" (set gradle_enable_debug_bool=true)
@if "%~1"=="0" (set gradle_enable_debug_bool=false)
@goto :EOF