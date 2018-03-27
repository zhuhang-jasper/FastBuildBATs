@call .preLoad.bat
@call dodeploy.bat
@pushd "%jboss_bin_dir%"
@set jboss_env=UAT
@echo [31m///// %jboss_env% /////[0m
@echo [31mStarting JBOSS %jboss_uat_batname% in new terminal...[0m
@start "JBOSS_MyClear_%jboss_env%" %jboss_uat_batname%
@popd