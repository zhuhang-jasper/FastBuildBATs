@call .preLoad.bat
@pushd "%fpx_war_dir%"
@(for /D %%f in (%webview_prefix%webview*) do @echo [33mUpdating WAR... ^>^> Message LOCALE [0m & @rmdir "%%f\WEB-INF\classes\locale" /S /Q & @xcopy "%fpx_resource_dir%\locale" "%%f\WEB-INF\classes\locale" /E /Q /I /Y )
@cd "%jboss_deploy_dir%"
@(for /D %%f in (%webview_prefix%webview*) do @echo [33mUpdating JBOSS... ^>^> %%f ^(Message LOCALE^) [0m & @rmdir "%%f\WEB-INF\classes\locale" /S /Q & @xcopy "%fpx_resource_dir%\locale" "%%f\WEB-INF\classes\locale" /E /Q /I /Y )
@popd
