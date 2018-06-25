@call .preLoad.bat
@for /D %%f in (%jboss_deploy_dir%\%webview_prefix%webview*) do @explorer "%%f\WEB-INF\classes\templates"