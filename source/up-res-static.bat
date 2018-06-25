@call .preLoad.bat
@pushd "%fpx_war_dir%"
@(for /D %%f in (%webview_prefix%webview*) do @echo [33mUpdating WAR... ^>^> Thymeleaf STATIC [0m & @rmdir "%%f\WEB-INF\classes\static" /S /Q & @xcopy "%fpx_resource_dir%\static" "%%f\WEB-INF\classes\static" /E /Q /I /Y )
@cd "%jboss_deploy_dir%"
@(for /D %%f in (%webview_prefix%webview*) do @echo [33mUpdating JBOSS... ^>^> %%f ^(Thymeleaf STATIC^) [0m & @rmdir "%%f\WEB-INF\classes\static" /S /Q & @xcopy "%fpx_resource_dir%\static" "%%f\WEB-INF\classes\static" /E /Q /I /Y )
@popd
