@call .preLoad.bat

@setlocal
@set deploy_dir=%jboss_deploy_dir%
@if not "%~1"=="" (set deploy_dir=%deploy_dir%^\%~1)
@if not exist "%deploy_dir%" (mkdir "%deploy_dir%")
@pushd "%deploy_dir%"
@for /D %%f in (%webview_prefix%webview*) do @echo [33mDeleting old WAR from JBOSS dpl ^>^> %%f [0m & @rmdir %%f /S /Q
@cd "%fpx_war_dir%"

@if not "%~1"=="" (goto NOTRACE)
@for /D %%f in (%webview_prefix%webview*) do @echo [33mCopying new WAR to JBOSS dpl ^>^> %%f [0m & @xcopy %%f "%deploy_dir%\%%f" /E /Q /I /Y
@goto END

:NOTRACE
@for /D %%f in (%webview_prefix%webview*) do @echo [33mAdding WAR to archive ^>^> %%f [0m & @xcopy %%f "%deploy_dir%\%%f" /E /Q /I /Y
@goto END

:END
@popd
@endlocal
