@call .preLoad.bat
@pushd "%fpx_war_dir%"
@for /D %%f in (fpx-admin-webview*) do @echo [33mRemoving old WAR ^>^> %%f [0m & @rmdir %%f /S /Q
@echo [33mGRADLE ^> %fpx_admin_dir%\%gradle_cmd_buildrelease%%Penv% [0m
@cd %fpx_admin_dir%
@call %gradle_cmd_buildrelease%%Penv%
@popd