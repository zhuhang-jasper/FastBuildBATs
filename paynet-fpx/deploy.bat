@call isConfigured
::@echo [95mUpdating WAR and EAR folders in JBOSS... [0m
@setlocal
@set msg=Updating WAR and EAR folders in JBOSS
@call cBegin "%msg%" 95
@call up-ear.bat
@call up-war.bat
@call cEnd "%msg%" 95
@endlocal
::@echo [95mFinished Updating WAR and EAR folders in JBOSS. [0m