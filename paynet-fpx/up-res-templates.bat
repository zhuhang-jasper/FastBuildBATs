@call isConfigured
@pushd "%fpx_war_dir%"
@(for /D %%f in (fpx-admin-webview*) do @echo [33mUpdating WAR... ^>^> Thymeleaf TEMPLATES [0m & @rmdir "%%f\WEB-INF\classes\templates" /S /Q & @xcopy %fpx_thymeleaf_dir% "%%f\WEB-INF\classes\templates" /E /Q /I )
@popd

