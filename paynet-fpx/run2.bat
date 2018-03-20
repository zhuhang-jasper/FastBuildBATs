@call isConfigured
@call dodeploy.bat
@pushd "%jboss_bin_dir%"
@set jboss_env=FPXNEW
@echo [31m///// %jboss_env% /////[0m
@echo [31mStarting JBOSS %jboss_fpxnew_batname% in new terminal (minimized)...[0m
@start /min %jboss_fpxnew_batname%
@popd