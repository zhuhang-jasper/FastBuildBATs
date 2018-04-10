@call .preLoad.bat
@echo [95mUpdating WAR webview resources... [0m
@call up-res-templates.bat
@call up-res-static.bat
@call up-res-locale.bat
::@call up-war.bat
@echo [95mFinished Updating webview resources. [0m
