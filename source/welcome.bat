@call .preLoad.bat
@echo off
setlocal
if not "%mode%"=="dev" cls
call :GETBOOL %gradle_enable_debug%
echo  --------------------------------------------------------------------
echo                      [33m^<^<  %toolname%  ^>^>[0m   
echo                 zhuhang's Fast Build + Deploy Commands  
echo                      with Gradle, JBOSS, GIT, 7zip
::echo                         Project: [36m%project_title%[0m  
echo.
echo   Project: [97m%project_title%[0m
echo     Git branch in use                ^= [31m%dev_branch%[0m
echo     JBOSS Environment                ^= [31m%branch_categ%[0m
echo     Gradle Penv ^(local//dev//...)    ^= [31m%Penv%[0m
echo     Gradle DEBUG STACKTRACE MODE     ^= [31m%gradle_enable_debug_bool%[0m
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