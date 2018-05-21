@call .preLoad.bat
::@setlocal
@set msg=Rebuild, Redeploy, Run JBOSS (FPXNEW)
@call %fcBegin% "%msg%" 97
@call cbr-all.bat
@call deploy.bat
@call run2.bat
@call %fcEnd% "%msg%" 97
::@endlocal