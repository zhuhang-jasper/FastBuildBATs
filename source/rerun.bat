@call .preLoad.bat
::@set /p x=[33mKilling on-going JBOSS servers...[0m<nul
@echo [33mKilling on-going running JBOSS servers...[0m
@taskkill /IM cmd.exe /FI "WINDOWTITLE eq JBOSS_MyClear*"
::@echo [33mRenaming .deployed to .dodeploy...[0m
::@pushd "%jboss_deploy_dir%"
::@ren *.deployed *.dodeploy 2>NUL & popd
@if defined jboss_env ( @echo [31m///// Restarting JBOSS /////[0m & if "%jboss_env%"=="UAT" (@call run.bat) else (@call run2.bat) ) else ( @echo [31mFAILED: No running JBOSS server found... Please enter ^"run^" or ^"run2^" to start.[0m)
::@echo [31mRestarting JBOSS in previous terminal...[0m