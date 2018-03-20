@call isConfigured
@setlocal
@set msg=(Webview)Rebuild, Redeploy, Rerun
@call cBegin "%msg%" 97
@call cbr.bat
@call up-war.bat
@call rerun.bat
@call cEnd "%msg%" 97
@endlocal