@call isConfigured
@pushd "%fpx_war_dir%"
@(for /D %%f in (fpx-admin-webview*) do @echo [33mUpdating WAR... ^>^> Thymeleaf STATIC [0m & @rmdir "%%f\WEB-INF\classes\static" /S /Q & @xcopy %fpx_resource_dir%\static "%%f\WEB-INF\classes\static" /E /Q /I )
@popd

