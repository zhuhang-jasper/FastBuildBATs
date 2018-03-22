@call .preLoad.bat
@setlocal
@set msg=Rebuilding all source codes to make WAR and EAR
@call %fcBegin% "%msg%" 96
@call cbr-ejb.bat
@call cbr.bat
@call %fcEnd% "%msg%" 96
@endlocal