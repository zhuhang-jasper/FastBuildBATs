@call .preLoad.bat
@setlocal
@set msg=(Webview)Rebuild, Redeploy, Rerun
@call %fcBegin% "%msg%" 97
@call cbr.bat
@call up-war.bat
@call rerun.bat
@call %fcEnd% "%msg%" 97
@endlocal