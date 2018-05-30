@call .preLoad.bat
@call kill.bat
@call dodeploy.bat
@pushd "%jboss_bin_dir%"
@set jboss_env=UAT
@echo [31m///// Start JBOSS Environment: %jboss_env% /////[0m
@echo [31mRunning %jboss_uat_batname% in new terminal...[0m

@if "%jboss_start_minimized%"=="1" (goto MINIMIZED)
@start "JBOSS_MyClear_%jboss_env%" %jboss_uat_batname%
@goto END

:MINIMIZED
@start /min "JBOSS_MyClear_%jboss_env%" %jboss_uat_batname%
@goto END

:END
@popd
@goto :EOF