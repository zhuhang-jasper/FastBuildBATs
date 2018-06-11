@call .preLoad.bat
::@setlocal
@set msg=Rebuild and Redeploy
@call %fcBegin% "%msg%" 97
@call cbr-all.bat
@call deploy.bat
@call %fcEnd% "%msg%" 97
::@endlocal