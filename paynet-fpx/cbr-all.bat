@call isConfigured
@setlocal
@set msg=Rebuilding all source codes to make WAR and EAR
@call cBegin "%msg%" 96
@call cbr-ejb.bat
@call cbr.bat
@call cEnd "%msg%" 96
@endlocal