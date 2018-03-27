@set version=1.4.5
@set name=FastBuildBATs v%version%
::
@set root=%~dp0
@set path=%PATH%;%root%
@cd /d "%root%"
@set userConfig_file=.userConfig.bat
@if exist .userConfig.bat (@echo userConfig exists) else (@copy ".userConfig.bat.default" ".userConfig.bat")
:: --------------
:: Load User Configuration
:: --------------
@call %userConfig_file%
:: --------------
:: Setting variables
:: --------------
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
:: --------------
:: Program Starts
:: --------------
::@color 0A
@title %name% (%project_title%)
@call welcome.bat
@echo on