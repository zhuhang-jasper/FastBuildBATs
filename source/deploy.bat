@call .preLoad.bat
@setlocal
@if not "%~1"=="" (goto NOTRACE)
@set msg=Updating WAR and EAR folders in JBOSS
@goto BODY

:NOTRACE
@set msg=Exporting WAR and EAR without traces
@goto BODY

:BODY
@call %fcBegin% "%msg%" 95
@call up-ear.bat %~1
@call up-war.bat %~1
@call %fcEnd% "%msg%" 95
@endlocal