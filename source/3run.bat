@call .preLoad.bat
::@setlocal
@set msg=Rebuild, Redeploy, Run JBOSS (UAT)
@call %fcBegin% "%msg%" 97
@call cbr-all.bat
@call deploy.bat
@call run.bat
@call %fcEnd% "%msg%" 97
::@endlocal