@call .preLoad.bat
@for /D %%f in (%jboss_deploy_dir%\fpx-admin-webview*) do @explorer "%%f\WEB-INF\classes\templates"