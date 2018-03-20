@call isConfigured
@pushd "%fpx_war_dir%"
@(for /D %%f in (fpx-admin-webview*) do @echo [33mUpdating WAR... ^>^> Message LOCALE [0m & @rmdir "%%f\WEB-INF\classes\locale" /S /Q & @xcopy %fpx_resource_dir%\locale "%%f\WEB-INF\classes\locale" /E /Q /I )
@popd

