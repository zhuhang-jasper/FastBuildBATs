@call .preLoad.bat

@setlocal
@set deploy_dir=%jboss_deploy_dir%
@if not "%~1"=="" (set deploy_dir=%deploy_dir%^\%~1)
@if not exist "%deploy_dir%" (mkdir "%deploy_dir%")

:: If not archiving, kill JBOSS to prevent "file in use" error
@if "%~1"=="" (call kill.bat)

@pushd "%deploy_dir%"
@for /D %%f in (%ejb_prefix%ejb-ear*) do @echo [33mDeleting old EAR from JBOSS dpl ^>^> %%f [0m & @rmdir %%f /S /Q

@if not exist %fpx_ear_dir% echo [31mNo EAR found! Please perform gradle build.[0m & goto END
@cd "%fpx_ear_dir%"

@if not "%~1"=="" (goto NOTRACE)
@for /D %%f in (%ejb_prefix%ejb-ear*) do @echo [33mCopying new EAR to JBOSS dpl ^>^> %%f [0m & @xcopy %%f "%deploy_dir%\%%f" /E /Q /I /Y
@goto END

:NOTRACE
@for /D %%f in (%ejb_prefix%ejb-ear*) do @echo [33mAdding EAR to archive ^>^> %%f [0m & @xcopy %%f "%deploy_dir%\%%f" /E /Q /I /Y
@goto END

:END
@popd
@endlocal
@goto :EOF