@call .preLoad.bat
::@setlocal
@set msg=Rebuild, Redeploy, Rerun
@call %fcBegin% "%msg%" 97
@call cbr-all.bat
@call deploy.bat
@call rerun.bat
@call %fcEnd% "%msg%" 97
::@endlocal