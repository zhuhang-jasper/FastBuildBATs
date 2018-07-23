@call .preLoad.bat
@for /D %%f in (%jboss_deploy_dir%\%webview_prefix_name%*) do @explorer "%%f\WEB-INF\classes\templates"