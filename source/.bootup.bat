@set version=1.5.2
@set tooltitle=FastBuildBATs
:: -----------------------
:: ##User Configuration 
:: -----------------------
@set root=%~dp0
@set userConfig_file=%root%\.userConfig.bat
@set userConfig_default=%root%\.userConfig.bat.default
@cls
@echo ##Create new config file if necessary...
@if not exist %userConfig_file% copy "%userConfig_default%" "%userConfig_file%"
:: -----------------------
@echo ##Loading config file...
@set error_config=0
@call %userConfig_file%
@if defined path_default @set path=%path_default%
@set path_default=%PATH%
@set path=%path_default%;%root%;C:\windows\explorer.exe
:: -----------------------
@echo ##Checking config file version...
@if not defined config_ver set error_config=1
@if defined config_ver (@if not [%config_ver%]==[1.5.0] set error_config=1)
@if [%error_config%]==[1] @echo ^".userConfig.bat^" file outdated. Please delete it and restart the tool. & @echo Press any key to navigate to file in explorer... & pause 1>NUL & @explorer %root% & exit
:: -----------------------
@echo ##Validating text editor...
@if defined dir_notepad @set path=%PATH%;%dir_notepad%
@if not defined notepad_exec @set notepad_exec=notepad
@if defined dir_notepad (if not exist "%dir_notepad%" @echo WARNING: DIR_NOTEPAD path is missing! & pause)
@WHERE %notepad_exec% >nul 2>nul
@if %ERRORLEVEL% NEQ 0 (@echo ERROR: The selected NOTEPAD is not working! & set error_config=1)
@if [%error_config%]==[1] @echo Please edit ^".userConfig.bat^" file manually . & @echo Press any key to navigate to file in explorer... & pause 1>NUL & @explorer %root% & exit
:: -----------------------
@set isConfigLoaded=yes
@echo ##Validating userConfig paths...
@if not defined jboss_root @echo ERROR: JBOSS_ROOT not defined! & set error_config=1
@if not defined fpx_root @echo ERROR: FPX_ROOT not defined! & set error_config=1
@if defined jboss_root (if not exist %jboss_root% @echo ERROR: JBOSS_ROOT path is missing! & set error_config=1)
@if defined fpx_root (if not exist %fpx_root% @echo ERROR: FPX_ROOT path is missing! & set error_config=1)
@if defined dir_git (if not exist "%dir_git%" @echo ERROR: DIR_GIT path is missing! & set error_config=1)
@if defined dir_gradle (if not exist "%dir_gradle%" @echo ERROR: DIR_GRADLE path is missing! & set error_config=1)
@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & exit
:: -----------------------
@echo ##Setting console path variables...
@if defined dir_git @set path=%PATH%;%dir_git%
@if defined dir_gradle @set path=%PATH%;%dir_gradle%
:: -----------------------
@echo ##Setting program variables...
@cd /d "%fpx_root%"
@set toolname=%tooltitle% v%version%
@set dev_branch=
@for /f %%i in ('git rev-parse --abbrev-ref HEAD') do @set dev_branch=%%i
@set jboss_bin_dir=%jboss_root%\bin
@set jboss_deploy_dir=%jboss_root%\standalone\deployments
@set fpx_admin_dir=%fpx_root%\fpx-admin
@set fpx_ejb_dir=%fpx_root%\fpx-admin-ejb
@set fpx_ejb_client_dir=%fpx_admin_dir%\libs\legacy_ejb
@set fpx_ejb_jar_dir=%fpx_ejb_dir%\distributions\AdminEjbClient
@set fpx_war_dir=%fpx_admin_dir%\distributions
@set fpx_ear_dir=%fpx_ejb_dir%\distributions\EjbServer
@set fpx_resource_dir=%fpx_admin_dir%\fpx-admin-webview\src\main\resources
@set fpx_thymeleaf_dir=%fpx_resource_dir%\templates
:: -----------------------
@echo ##Starting program...
::@color 0A
@title %toolname% (%project_title%) [%dev_branch%]
@call welcome.bat
@echo on