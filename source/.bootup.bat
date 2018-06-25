:: =====================================================
::  ___        _   ___      _ _    _ ___   _ _____   
:: | __|_ _ __| |_| _ )_  _(_) |__| | _ ) /_\_   _|__
:: | _/ _` (_-<  _| _ \ || | | / _` | _ \/ _ \| |(_-<
:: |_|\__,_/__/\__|___/\_,_|_|_\__,_|___/_/ \_\_|/__/
::                                                   
:: =====================================================
:: ##BOOTUP SCRIPT

:BOOTUP
@set version=1.7.9
@set tooltitle=FastBuildBATs
@title %tooltitle% Boot Up...
@set mode=user
@cls
:: -----------------------
:: ##User Configuration
:: -----------------------
@set root=%~dp0.
@set userConfig_file=%~1
@set userConfig_default=%root%\.userConfig.bat.default
@if not exist %userConfig_default% @echo FATAL: PROGRAM STARTED IN AN UNUSUAL WAY. PLEASE USE '.ALWAYSSTARTME.BAT' & goto :EOF
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
@set min_config_ver=1.79
@if not defined config_ver set error_config=1
@if defined config_ver (@if not [%config_ver%] GEQ [%min_config_ver%] set error_config=1)
@if [%error_config%]==[1] @echo ^".userConfig.bat^" file outdated. Please delete it and restart the tool. & @echo Press any key to navigate to file in explorer... & pause 1>NUL & @explorer %root% & exit
:: -----------------------
::   1. INTERFACE SETTINGS
@echo ##Validating Interface settings...
@if not defined username set username=Coder
@if not defined fancy_dashboard set fancy_dashboard=1
@if not defined fancy_theme set "fancy_theme=Green"
@if not defined cls_keep_dashboard set cls_keep_dashboard=1
@if not defined exit_splash_off set exit_splash_off=0
:: -----------------------
::   2. CUSTOM TEXT EDITOR SETTINGS
@echo ##Validating Custom text editor settings...
@if defined dir_notepad set path=%PATH%;%dir_notepad%
@if not defined notepad_exec set notepad_exec=notepad
@if defined dir_notepad (if not exist "%dir_notepad%" @echo WARNING: DIR_NOTEPAD path is missing! & pause)
@WHERE %notepad_exec% >nul 2>nul
@if %ERRORLEVEL% NEQ 0 (@echo ERROR: The selected NOTEPAD is not working! & set error_config=1)
@if [%error_config%]==[1] @echo Please edit ^".userConfig.bat^" file manually . & @echo Press any key to navigate to file in explorer... & pause 1>NUL & @explorer %root% & exit
@set isConfigLoaded=yes
:: -----------------------
::   3. PROGRAM DEPENDENCIES PATH SETTINGS
@echo ##Validating Program dependencies path settings...
@if defined dir_git (if not exist "%dir_git%" @echo ERROR: DIR_GIT path is missing! & set error_config=1)
@if defined dir_gradle (if not exist "%dir_gradle%" @echo ERROR: DIR_GRADLE path is missing! & set error_config=1)
@if defined dir_7zip (if not exist "%dir_7zip%" @echo ERROR: DIR_7ZIP path is missing! & set error_config=1)
@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & goto AFTERCONFIG
@if defined dir_git set path=%PATH%;%dir_git%
@if defined dir_gradle set path=%PATH%;%dir_gradle%
@if defined dir_7zip set path=%PATH%;%dir_7zip%
:: -----------------------
::   4. PROJECT SETTINGS
@echo ##Validating Project settings...
@if not defined project_title set project_title=Project
:: fpx_root
@if not defined fpx_root echo ERROR: FPX_ROOT not defined! & set error_config=1
@if defined fpx_root (if not exist %fpx_root% @echo ERROR: FPX_ROOT path is missing! & set error_config=1)
:: jboss_root
@if not defined jboss_root echo ERROR: JBOSS_ROOT not defined! & set error_config=1
@if defined jboss_root (if not exist %jboss_root% @echo ERROR: JBOSS_ROOT path is missing! & set error_config=1)
:: local_temp_log
@if not defined local_temp_log echo ERROR: LOCAL_TEMP_LOG not defined! & set error_config=1
@if defined local_temp_log (if not exist %local_temp_log% @echo ERROR: LOCAL_TEMP_LOG path is missing! & set error_config=1)
:: prefix
@if not defined webview_prefix set webview_prefix=
@if not defined ejb_prefix set ejb_prefix=
@if not defined war_ear_common_prefix set war_ear_common_prefix=

@echo ##Validating Project sub-directory paths...
:: webview subpaths
@if not defined fpx_webview_dir echo ERROR: FPX_WEBVIEW_DIR not defined! & set error_config=1
@if defined fpx_webview_dir (if not exist %fpx_webview_dir% @echo ERROR: FPX_WEBVIEW_DIR path is missing! & set error_config=1)
:: first time skip distribution folders
@if not exist %fpx_webview_dir%\distributions (goto SKIPWEBVIEWDSTR)
@if not defined fpx_war_dir echo ERROR: FPX_WAR_DIR not defined! & set error_config=1
@if defined fpx_war_dir (if not exist %fpx_war_dir% @echo ERROR: FPX_WAR_DIR path is missing! & set error_config=1)
:SKIPWEBVIEWDSTR
@if not defined fpx_ejb_client_dir echo ERROR: FPX_EJB_CLIENT_DIR not defined! & set error_config=1
@if defined fpx_ejb_client_dir (if not exist %fpx_ejb_client_dir% @echo ERROR: FPX_EJB_CLIENT_DIR path is missing! & set error_config=1)
@if not defined fpx_resource_dir echo ERROR: FPX_RESOURCE_DIR not defined! & set error_config=1
@if defined fpx_resource_dir (if not exist %fpx_resource_dir% @echo ERROR: FPX_RESOURCE_DIR path is missing! & set error_config=1)
@if not defined fpx_thymeleaf_dir echo ERROR: FPX_THYMELEAF_DIR not defined! & set error_config=1
@if defined fpx_thymeleaf_dir (if not exist %fpx_thymeleaf_dir% @echo ERROR: FPX_THYMELEAF_DIR path is missing! & set error_config=1)
:: EJB subpaths
@if not defined fpx_ejb_dir echo ERROR: FPX_EJB_DIR not defined! & set error_config=1
@if defined fpx_ejb_dir (if not exist %fpx_ejb_dir% @echo ERROR: FPX_EJB_DIR path is missing! & set error_config=1)
:: first time skip distribution folders
@if not exist %fpx_ejb_dir%\distributions (goto SKIPWEBVIEWDSTR)
@if not defined fpx_ejb_jar_dir echo ERROR: FPX_EJB_JAR_DIR not defined! & set error_config=1
@if defined fpx_ejb_jar_dir (if not exist %fpx_ejb_jar_dir% @echo ERROR: FPX_EJB_JAR_DIR path is missing! & set error_config=1)
@if not defined fpx_ear_dir echo ERROR: FPX_EAR_DIR not defined! & set error_config=1
@if defined fpx_ear_dir (if not exist %fpx_ear_dir% @echo ERROR: FPX_EAR_DIR path is missing! & set error_config=1)
:SKIPEJBDSTR
:: jboss subpaths
@if not defined jboss_bin_dir echo ERROR: JBOSS_BIN_DIR not defined! & set error_config=1
@if defined jboss_bin_dir (if not exist %jboss_bin_dir% @echo ERROR: JBOSS_BIN_DIR path is missing! & set error_config=1)
@if not defined jboss_deploy_dir echo ERROR: JBOSS_DEPLOY_DIR not defined! & set error_config=1
@if defined jboss_deploy_dir (if not exist %jboss_deploy_dir% @echo ERROR: JBOSS_DEPLOY_DIR path is missing! & set error_config=1)

@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & goto AFTERCONFIG
:: -----------------------
::   5. JBOSS SETTINGS
@echo ##Validating JBOSS settings...
@if not defined jboss_start_minimized set jboss_start_minimized=0
@if not defined jboss_start_autoswitch_env set jboss_start_autoswitch_env=1
@if not defined jboss_rerun_autoswitch set jboss_rerun_autoswitch=1
@if not defined jboss_uat_batname echo ERROR: UAT_BATNAME not defined! & set error_config=1
@if defined jboss_uat_batname (if not exist "%jboss_bin_dir%\%jboss_uat_batname%" @echo ERROR: UAT batch file is missing! & set error_config=1)
@if not defined jboss_fpxnew_batname echo ERROR: FPXNEW_BATNAME not defined! & set error_config=1
@if defined jboss_fpxnew_batname (if not exist "%jboss_bin_dir%\%jboss_fpxnew_batname%" @echo ERROR: FPXNEW batch file is missing! & set error_config=1)
@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & goto AFTERCONFIG
:: -----------------------
::   6. GRADLE SETTINGS
@echo ##Validating Gradle settings...
@if not defined Penv echo ERROR: PENV not defined! & set error_config=1
@if defined Penv (if not exist "%fpx_webview_dir%\config_%Penv%.groovy" (if not exist "%fpx_webview_dir%\gradle_%Penv%.properties" @echo ERROR: config_%Penv% file is missing in webview project folder! & set error_config=1))
@if defined Penv (if not exist "%fpx_ejb_dir%\config_%Penv%.groovy" (if not exist "%fpx_ejb_dir%\gradle_%Penv%.properties" @echo ERROR: config_%Penv% file is missing in EJB project folder! & set error_config=1))
@if not defined gradle_cmd_cleanbuild echo ERROR: CMD_CLEANBUILD not defined! & set error_config=1
@if defined gradle_cmd_cleanbuild (if "%gradle_cmd_cleanbuild%"=="" @echo ERROR: CMD_CLEANBUILD is blank! & set error_config=1)
@if not defined gradle_cmd_buildrelease echo ERROR: CMD_BUILDRELEASE not defined! & set error_config=1
@if defined gradle_cmd_buildrelease (if "%gradle_cmd_buildrelease%"=="" @echo ERROR: CMD_BUILDRELEASE is blank! & set error_config=1)
@if not defined gradle_enable_debug set gradle_enable_debug=0
@if not defined gradle_cmd_debug_flag set gradle_cmd_debug_flag=
@if [%error_config%]==[1] @echo Press any key to configure. . . & pause 1>NUL & call config.bat & goto AFTERCONFIG
:: -----------------------
::   7. EXPORT DEPLOYMENT ZIP SETTINGS
@echo ##Validating Export deployment zip settings...
@if not defined extargz_penv_refinement set extargz_penv_refinement=
@if not defined extargz_penv_reporting set extargz_penv_reporting=
@if not defined cmd_7z_tarball_prefix set cmd_7z_tarball_prefix=
:: -----------------------
::   8. ECLIPSE INTEGRATION SETTINGS
@echo ##Validating Eclipse integration settings...
@if not defined enable_eclipse set enable_eclipse=0
@if not defined startup_reload_eclipse set startup_reload_eclipse=0
@if "%enable_eclipse%"=="0" goto SKIPECLIPSE
@echo ##Validating Eclipse integration settings...
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
@echo ##Preparing program...
@set toolname=%tooltitle% v%version%
@set jboss_env=
@set dev_branch=
@set branch_categ=
::Detect git branch
@for /f %%i in ('git rev-parse --abbrev-ref HEAD') do @set dev_branch=%%i
::Set JBOSS ENV base on git branch
@call %userConfig_file% --detect-jboss-env
@if "%branch_categ%"=="" set "branch_categ=???"
::Set Penv base on git branch
@call %userConfig_file% --penv-default
@echo ##Starting program...
::@color 0A
@title %toolname% (%project_title%) [%dev_branch%]
@call welcome.bat
@echo on
@goto STARTUP

:AFTERCONFIG
@goto BOOTUP
@goto :EOF

:STARTUP
@if "%enable_eclipse%"=="1" (if "%startup_reload_eclipse%"=="1" (echo. & echo [33mStartup Tasks:[0m))
@if "%enable_eclipse%"=="1" (if "%startup_reload_eclipse%"=="1" (call :STARTUP_ECLIPSE))
@goto :EOF

:STARTUP_ECLIPSE
@call "eclipse.bat" "/autostart"
@goto :EOF