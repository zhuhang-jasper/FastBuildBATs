@call .preLoad.bat
::@call kill.bat
::@echo [33mRenaming .deployed to .dodeploy...[0m
::@pushd "%jboss_deploy_dir%"
::@ren *.deployed *.dodeploy 2>NUL & popd

@echo [33mTrying to run last started JBOSS Server...[0m
@if defined jboss_env (goto POSITIVE) else (goto NEGATIVE)

:POSITIVE

::@echo [31m///// Restarting JBOSS /////[0m 
@if "%jboss_env%"=="UAT" (call run.bat & goto :EOF)
@if "%jboss_env%"=="FPXNEW" (call run2.bat & goto :EOF)
@echo [31mFAILED: Invalid JBOSS Environment.[0m 
@goto :EOF

:NEGATIVE
@if "%jboss_rerun_autoswitch%"=="1" (goto RUNSWITCH)
@echo [31mFAILED: Could not perform last run... Maybe you just started/rebooted this tool.
@echo         Please Enter ^"run^" or ^"run2^" to start.[0m
@goto :EOF

:RUNSWITCH
@echo [33mSmart Switching RUN/RUN2 Command...[0m
@if "%branch_categ%"=="refinement" (echo Detected^: RUN & call run.bat & goto :EOF)
@if "%branch_categ%"=="reporting" (echo Detected^: RUN2 & call run2.bat & goto :EOF)
@echo [31mFAILED: Could not perform autoswitch. Please see 'SMART JBOSS ENVIRONMENT CONFIGURATION'.[0m
@goto :EOF