@call isConfigured
@pushd "%jboss_deploy_dir%"
@for /D %%f in (fpx-admin-webview*) do @echo [33mDeleting old WAR from JBOSS dpl ^>^> %%f [0m & @rmdir %%f /S /Q
@cd "%fpx_war_dir%"
@for /D %%f in (fpx-admin-webview*) do @echo [33mCopying new WAR to JBOSS dpl ^>^> %%f [0m & @xcopy %%f "%jboss_deploy_dir%\%%f" /E /Q /I /Y
@popd