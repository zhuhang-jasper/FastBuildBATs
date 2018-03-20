@call isConfigured
@setlocal
@set msg=Rebuild, Redeploy, Run JBOSS (UAT)
@call cBegin "%msg%" 97
@call cbr-all.bat
@call deploy.bat
@call run.bat
@call cEnd "%msg%" 97
@endlocal