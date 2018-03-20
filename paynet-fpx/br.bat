@call isConfigured
@pushd "%fpx_war_dir%"
@for /D %%f in (fpx-admin-webview*) do @echo [33mRemoving old WAR ^>^> %%f [0m & @rmdir %%f /S /Q
@echo [33mExecute GRADLE %fpx_admin_dir%\%gradle_cmd_buildrelease% [0m
@cd %fpx_admin_dir%
@%gradle_cmd_buildrelease% & @popd