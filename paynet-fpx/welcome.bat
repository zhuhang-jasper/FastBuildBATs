@call isConfigured
@echo off
cls
echo  --------------------------------------------------------------------
echo                      [33m^<^<  %name%  ^>^>[0m   
echo                 zhuhang's Fast Build + Deploy Commands  
echo                           with Gradle, JBOSS
echo                         Project: [36m%project_title%[0m  
echo.
echo   Variables (Enter ^"config^" to change)
echo     Gradle Penv ^(local//dev//...)    ^= [31m%Penv%[0m
echo     run : branch-^>refinement (uat)   ^= [31m%jboss_uat_batname%[0m
echo     run2: branch-^>reporting (fpxnew) ^= [31m%jboss_fpxnew_batname%[0m
echo  --------------------------------------------------------------------
echo   (Enter ^"cmds^" to list available commands)
rem cmds.bat
@echo on