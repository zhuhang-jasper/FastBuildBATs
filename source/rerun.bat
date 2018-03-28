@call .preLoad.bat
@call end.bat
::@echo [33mRenaming .deployed to .dodeploy...[0m
::@pushd "%jboss_deploy_dir%"
::@ren *.deployed *.dodeploy 2>NUL & popd
@echo [33mTrying to run last started JBOSS Server...[0m
@if defined jboss_env ( @echo [31m///// Restarting JBOSS /////[0m & if "%jboss_env%"=="UAT" (@call run.bat) else (@call run2.bat) ) else ( @echo [31mFAILED: Could not perform last run... Maybe %tooltitle% was closed after JBOSS started. & @echo         Please Enter ^"run^" or ^"run2^" to start.[0m)
::@echo [31mRestarting JBOSS in previous terminal...[0m