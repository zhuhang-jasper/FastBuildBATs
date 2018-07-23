@call .preLoad.bat
@if not exist %fpx_war_dir% echo [31mNo WAR found! Please perform gradle build.[0m & goto :EOF
@pushd "%fpx_war_dir%"
@(for /D %%f in (%webview_prefix_name%*) do @echo [33mUpdating WAR... ^>^> Thymeleaf TEMPLATES [0m & @rmdir "%%f\WEB-INF\classes\templates" /S /Q & @xcopy %fpx_thymeleaf_dir% "%%f\WEB-INF\classes\templates" /E /Q /I /Y )
@cd "%jboss_deploy_dir%"
@(for /D %%f in (%webview_prefix_name%*) do @echo [33mUpdating JBOSS... ^>^> %%f ^(Thymeleaf TEMPLATES^) [0m & @rmdir "%%f\WEB-INF\classes\templates" /S /Q & @xcopy %fpx_thymeleaf_dir% "%%f\WEB-INF\classes\templates" /E /Q /I /Y )
@popd
