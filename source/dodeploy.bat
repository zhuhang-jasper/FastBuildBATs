@call .preLoad.bat

@setlocal
@set deploy_dir=%jboss_deploy_dir%
@if not "%~1"=="" (set deploy_dir=%deploy_dir%^\%~1)
@if not exist "%deploy_dir%" (mkdir "%deploy_dir%")

@echo [33mDeleting old marker files...[0m
@del /Q "%deploy_dir%\*.ear.*" >NUL 2>&1
@del /Q "%deploy_dir%\*.war.*" >NUL 2>&1

@echo [33mAutobuild new .dodeploy marker files...[0m
@pushd %deploy_dir%
@for /D %%f in (*.ear) do @copy NUL %%f.dodeploy >NUL
@for /D %%f in (*.war) do @copy NUL %%f.dodeploy >NUL
@endlocal
@popd
