@call .preLoad.bat
@echo [33mDeleting old EJB client JAR files...[0m
@del /S /Q "%fpx_ejb_client_dir%\%ejb_prefix%ejb-client*"
@pushd "%fpx_ejb_jar_dir%"
@echo [33mExporting EJB client JAR file to Webview libs folder...[0m
@if not exist "%fpx_ejb_client_dir%" mkdir "%fpx_ejb_client_dir%"
@copy %ejb_prefix%ejb-client* "%fpx_ejb_client_dir%\" /Y & @popd