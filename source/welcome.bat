@call .preLoad.bat
@echo off
cls
echo  --------------------------------------------------------------------
echo                      [33m^<^<  %toolname%  ^>^>[0m   
echo                 zhuhang's Fast Build + Deploy Commands  
echo                         with Gradle, JBOSS, GIT
::echo                         Project: [36m%project_title%[0m  
echo.
echo   Project: [36m%project_title%[0m
echo     Git branch in use                ^= [31m%dev_branch%[0m
echo     Gradle Penv ^(local//dev//...)    ^= [31m%Penv%[0m
echo     run : branch-^>refinement (uat)   ^= [31m%jboss_uat_batname%[0m
echo     run2: branch-^>reporting (fpxnew) ^= [31m%jboss_fpxnew_batname%[0m
echo  --------------------------------------------------------------------
echo   (Enter ^"config^" to change variables)
echo   (Enter ^"cmds^" to list available commands)
@echo on