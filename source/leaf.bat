@call .preLoad.bat
@echo [95mUpdating WAR Thymeleaf and LOCALE... [0m
@call up-res-templates.bat
@call up-res-locale.bat
::@call up-war.bat
@echo [95mFinished Updating Thymeleaf and LOCALE. [0m
