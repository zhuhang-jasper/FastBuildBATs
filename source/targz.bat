@call .preLoad.bat

:: Initialise deployment folder
@setlocal
@set deploy_dir=%jboss_deploy_dir%
@if not "%~1"=="" (set deploy_dir=%deploy_dir%^\%~1)
@if not exist "%deploy_dir%" (goto ERROR)

:PREPARE
:: Setting filename and commands
@set tarball=%cmd_7z_tarball_prefix%%Penv%.tar
@set str_dpl=.\%webview_prefix%webview* .\%ejb_prefix%ejb-ear* -x!.\*.war.* -x!.\*.ear.*
@set str_marker=..\*.dodeploy
@if not "%~1"=="" (set str_dpl=.\%~1\%webview_prefix%webview* .\%~1\%ejb_prefix%ejb-ear* -x^!.\%~1\*.war.* -x^!.\%~1\*.ear.*)
@set cmd_7z_tar=7z a -ttar %tarball% %str_marker% %str_dpl%
@set cmd_7z_gzip=7z a -tgzip %tarball%.gz %tarball% -sdel
@echo.
@echo [33mCreating %tarball%.gz file... [0m 
@echo [33mAdding WAR and EAR folders to archive...[0m

:: Remove duplicate .tar.gz and marker files
@if not exist "%jboss_deploy_dir%\%tarball%.gz" (goto PROCESS)
@echo [33mOverwriting existing file... [0m
@del /Q "%jboss_deploy_dir%\%tarball%.gz" >NUL 2>&1
@goto PROCESS
:END_PREPARE

:PROCESS
::Cleanning jboss marker files
@echo [33mAdding .dodeploy marker files to archive...[0m
@del /Q "%jboss_deploy_dir%\..\*.dodeploy" >NUL 2>&1
@pushd %deploy_dir%
@for /D %%f in (%webview_prefix%webview*) do @copy NUL %jboss_deploy_dir%\..\%%f.dodeploy >NUL
@for /D %%f in (%ejb_prefix%ejb-ear*) do @copy NUL %jboss_deploy_dir%\..\%%f.dodeploy >NUL

::Running 7zip
@cd %jboss_deploy_dir%
@echo [33m7ZIP ^>[0m %cmd_7z_tar%
@call %cmd_7z_tar% 1>nul
@echo [33m7ZIP ^>[0m OK: %tarball% built.
@echo.
@echo [33m7ZIP ^>[0m %cmd_7z_gzip%
@call %cmd_7z_gzip% 1>nul
@echo [33m7ZIP ^>[0m SUCCESS: %tarball%.gz created.

::Clean up and leave no traces
@if not "%~1"=="" (rmdir /S /Q %~1)
@del /Q "%jboss_deploy_dir%\..\*.dodeploy" >NUL 2>&1
@popd

:: Open folder of compressed file
@echo [33mOpening folder to file... [0m
@call jboss.bat
@goto END
:END_PROCESS

:ERROR
@echo [31mERROR: Specified Deployment Sub-folder is invalid. [0m
@goto END

:END
@endlocal
@goto :EOF