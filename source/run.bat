@call .preLoad.bat
@call end.bat
@call dodeploy.bat
@pushd "%jboss_bin_dir%"
@set jboss_env=UAT
@echo [31m///// Start JBOSS Environment: %jboss_env% /////[0m
@echo [31mRunning %jboss_uat_batname% in new terminal...[0m
@start "JBOSS_MyClear_%jboss_env%" %jboss_uat_batname%
@popd