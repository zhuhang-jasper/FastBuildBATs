@call .preLoad.bat
@setlocal
@set msg=Updating WAR and EAR folders in JBOSS
@call %fcBegin% "%msg%" 95
@call up-ear.bat
@call up-war.bat
@call %fcEnd% "%msg%" 95
@endlocal