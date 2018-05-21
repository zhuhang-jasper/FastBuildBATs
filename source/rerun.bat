@call .preLoad.bat
::@call kill.bat
::@echo [33mRenaming .deployed to .dodeploy...[0m
::@pushd "%jboss_deploy_dir%"
::@ren *.deployed *.dodeploy 2>NUL & popd

@echo [33mTrying to run last started JBOSS Server...[0m
@if defined jboss_env (goto POSITIVE) else (goto NEGATIVE)

:POSITIVE

::@echo [31m///// Restarting JBOSS /////[0m 
@if "%jboss_env%"=="UAT" (call run.bat & goto END)
@if "%jboss_env%"=="FPXNEW" (call run2.bat & goto END)
@echo [31mFAILED: Invalid JBOSS Environment.[0m 
@goto END

:NEGATIVE
@echo [31mFAILED: Could not perform last run... Maybe you just started/rebooted this tool.
@echo         Please Enter ^"run^" or ^"run2^" to start.[0m
@goto END

:END