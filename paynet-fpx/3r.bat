@call isConfigured
@setlocal
@set msg=Rebuild, Redeploy, Rerun
@call cBegin "%msg%" 97
@call cbr-all.bat
@call deploy.bat
@call rerun.bat
@call cEnd "%msg%" 97
@endlocal