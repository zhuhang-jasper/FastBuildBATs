@call .preLoad.bat

:: Validate empty parameter
@if "%~1"=="" (goto ERROR)

::User Confirmation
@setlocal
@echo.
@echo [33mTODO^: Set temporary Penv    ^>  %~1 [0m
@if "%~2"=="/soft" echo [31mTODO^: Skip Gradle rebuild and use local WAR ^& EAR from project src code folder. [0m
@if "%~2"=="/war" echo [31mTODO^: Gradle rebuild WAR only (Skip rebuild EAR) [0m
@if not "%~2"=="/soft" echo [33mTODO^: Gradle clean build    ^>  %gradle_cmd_cleanbuild%%~1 [0m
@if not "%~2"=="/soft" echo [33mTODO^: Gradle build release  ^>  %gradle_cmd_buildrelease%%~1 [0m
@echo [33mTODO^: 7Zip output file      ^>  %cmd_7z_tarball_prefix%%~1.tar.gz [0m
@echo.
@SET /P AREYOUSURE=Confirm task (Y/N)?
@IF /I "%AREYOUSURE%" NEQ "Y" (echo [33mINFO: Job cancelled by user.[0m & goto END)

:: Caching old Penv value
@echo [33mSetting temporary Penv to %~1... [0m 
@set cachePenv=%Penv%
@set Penv=%~1

:: Validating specified Penv
@set error_config=0
@if not exist "%fpx_admin_dir%\config_%Penv%.groovy" (@echo [31mERROR: config_%Penv%.groovy file is missing in fpx-admin folder! [0m & set error_config=1)
@if not exist "%fpx_ejb_dir%\config_%Penv%.groovy" (@echo [31mERROR: config_%Penv%.groovy file is missing in fpx-admin-ejb folder! [0m & set error_config=1)
@if [%error_config%]==[1] goto PENVERROR

:: Skip gradle build if soft flag specified
@if "%~2"=="/soft" (@echo [33mSkipping Gradle build... [0m & goto BODY)
@if "%~2"=="/war" (@echo [33mRebuild WAR only... [0m & call cbr.bat & goto BODY)

::Gradle rebuild WAR and EAR
@call cbr-all.bat

:BODY
@call deploy.bat "archiving"
@call targz.bat "archiving"
:: pending >> down war, down ear, down ejb client
@if not defined cachePenv (goto END)
@set Penv=%cachePenv%
::@echo [33mSUCCESS: 7zip Job completed.[0m
@goto END

:ERROR
@echo [31mERROR: Missing parameter. No Penv specified. ^(Example: extargz office^) [0m
@goto :EOF

:PENVERROR
@echo [31mERROR: Invalid Penv specified. [0m
@goto END

:END
@endlocal
@goto :EOF