:BOOTUP
@set version=1.7.5
@set tooltitle=FastBuildBATs
@title %tooltitle% Boot Up...
@set mode=user
:: -----------------------
:: ##User Configuration
:: -----------------------
@set root=%~dp0.
@set userConfig_file=%root%\.userConfig.bat
@set userConfig_default=%root%\.userConfig.bat.default
@if not exist %userConfig_default% @echo FATAL: PROGRAM STARTED IN AN UNUSUAL WAY. PLEASE USE '.ALWAYSSTARTME.BAT' & goto :EOF
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
@set min_config_ver=1.75
@if not defined config_ver set error_config=1
@if defined config_ver (@if not [%config_ver%]==[%min_config_ver%] set error_config=1)
@if [%error_config%]==[1] @echo ^".userConfig.bat^" file outdated. Please delete it and restart the tool. & @echo Press any key to navigate to file in explorer... & pause 1>NUL & @explorer %root% & exit
:: -----------------------
@echo ##Setting some default values...
@if not defined username set username=Coder
@if not defined project_title set project_title=Project
@if not defined enable_eclipse set enable_eclipse=0
@if not defined startup_reload_eclipse set startup_reload_eclipse=0
@if not defined jboss_start_minimized set jboss_start_minimized=0
@if not defined jboss_start_autoswitch_env set jboss_start_autoswitch_env=0
@if not defined cmd_7z_tarball_prefix set cmd_7z_tarball_prefix=
:: -----------------------
@echo ##Validating custom text editor...
@if defined dir_notepad set path=%PATH%;%dir_notepad%
@if not defined notepad_exec set notepad_exec=notepad
@if defined dir_notepad (if not exist "%dir_notepad%" @echo WARNING: DIR_NOTEPAD path is missing! & pause)
@WHERE %notepad_exec% >nul 2>nul
@if %ERRORLEVEL% NEQ 0 (@echo ERROR: The selected NOTEPAD is not working! & set error_config=1)
@if [%error_config%]==[1] @echo Please edit ^".userConfig.bat^" file manually . & @echo Press any key to navigate to file in explorer... & pause 1>NUL & @explorer %root% & exit
@set isConfigLoaded=yes
:: -----------------------
@echo ##Validating dependency path settings...
@if defined dir_7zip (if not exist "%dir_7zip%" @echo ERROR: DIR_7ZIP path is missing! & set error_config=1)
@if defined dir_git (if not exist "%dir_git%" @echo ERROR: DIR_GIT path is missing! & set error_config=1)
@if defined dir_gradle (if not exist "%dir_gradle%" @echo ERROR: DIR_GRADLE path is missing! & set error_config=1)
@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & goto AFTERCONFIG
@if defined dir_git set path=%PATH%;%dir_git%
@if defined dir_gradle set path=%PATH%;%dir_gradle%
@if defined dir_7zip set path=%PATH%;%dir_7zip%
:: -----------------------
@echo ##Validating project path settings...
@if not defined jboss_root echo ERROR: JBOSS_ROOT not defined! & set error_config=1
@if defined jboss_root (if not exist %jboss_root% @echo ERROR: JBOSS_ROOT path is missing! & set error_config=1)
@if not defined fpx_root echo ERROR: FPX_ROOT not defined! & set error_config=1
@if defined fpx_root (if not exist %fpx_root% @echo ERROR: FPX_ROOT path is missing! & set error_config=1)
@if not defined local_temp_log echo ERROR: LOCAL_TEMP_LOG not defined! & set error_config=1
@if defined local_temp_log (if not exist %local_temp_log% @echo ERROR: LOCAL_TEMP_LOG path is missing! & set error_config=1)
@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & goto AFTERCONFIG
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
@echo ##Validating Gradle settings...
@if not defined Penv echo ERROR: PENV not defined! & set error_config=1
@if defined Penv (if not exist "%fpx_admin_dir%\config_%Penv%.groovy" @echo ERROR: config_%Penv%.groovy file is missing in fpx-admin folder! & set error_config=1)
@if defined Penv (if not exist "%fpx_ejb_dir%\config_%Penv%.groovy" @echo ERROR: config_%Penv%.groovy file is missing in fpx-admin-ejb folder! & set error_config=1)
@if not defined gradle_cmd_cleanbuild echo ERROR: CMD_CLEANBUILD not defined! & set error_config=1
@if defined gradle_cmd_cleanbuild (if "%gradle_cmd_cleanbuild%"=="" @echo ERROR: CMD_CLEANBUILD is blank! & set error_config=1)
@if not defined gradle_cmd_buildrelease echo ERROR: CMD_BUILDRELEASE not defined! & set error_config=1
@if defined gradle_cmd_buildrelease (if "%gradle_cmd_buildrelease%"=="" @echo ERROR: CMD_BUILDRELEASE is blank! & set error_config=1)
@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & goto AFTERCONFIG
:: -----------------------
@echo ##Validating JBOSS batch file settings...
@if not defined jboss_uat_batname echo ERROR: UAT_BATNAME not defined! & set error_config=1
@if defined jboss_uat_batname (if not exist "%jboss_bin_dir%\%jboss_uat_batname%" @echo ERROR: UAT batch file is missing! & set error_config=1)
@if not defined jboss_fpxnew_batname echo ERROR: FPXNEW_BATNAME not defined! & set error_config=1
@if defined jboss_fpxnew_batname (if not exist "%jboss_bin_dir%\%jboss_fpxnew_batname%" @echo ERROR: FPXNEW batch file is missing! & set error_config=1)
@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & goto AFTERCONFIG
:: -----------------------
@if "%enable_eclipse%"=="0" goto SKIPECLIPSE
@echo ##Validating Eclipse settings...
@if not defined custom_gradle_build_reporting_filename echo ERROR: CUSTOM_GRADLE_BUILD_REPORTING_FILENAME not defined! & set error_config=1
@if defined custom_gradle_build_reporting_filename (if not exist "%fpx_ejb_dir%\%custom_gradle_build_reporting_filename%" @echo ERROR: CUSTOM GRADLE.BUILD REPORTING file is missing! & set error_config=1)
@if not defined custom_gradle_build_refinement_filename echo ERROR: CUSTOM_GRADLE_BUILD_REFINEMENT_FILENAME not defined! & set error_config=1
@if defined custom_gradle_build_refinement_filename (if not exist "%fpx_ejb_dir%\%custom_gradle_build_refinement_filename%" @echo ERROR: CUSTOM GRADLE.BUILD REFINEMENT file is missing! & set error_config=1)
@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & goto AFTERCONFIG

:SKIPECLIPSE
:: -----------------------
:: ##Program Configuration
:: -----------------------
@cd /d "%fpx_root%"
@echo ##Setting program variables...
@set toolname=%tooltitle% v%version%
@set jboss_env=
@set dev_branch=
@set branch_categ=
::Detect git branch
@for /f %%i in ('git rev-parse --abbrev-ref HEAD') do @set dev_branch=%%i
::Set JBOSS ENV base on git branch
@call .userConfig.bat --detect-jboss-env
::Set Penv base on git branch
@call .userConfig.bat --penv-default
@echo ##Starting program...
::@color 0A
@title %toolname% (%project_title%) [%dev_branch%]
@call welcome.bat
@echo on
@if "%enable_eclipse%"=="1" (if "%startup_reload_eclipse%"=="1" (call "eclipse.bat"))
@goto :EOF

:AFTERCONFIG
@goto BOOTUP
@goto :EOF