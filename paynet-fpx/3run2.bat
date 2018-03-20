@call isConfigured
@setlocal
@set msg=Rebuild, Redeploy, Run JBOSS (FPXNEW)
@call cBegin "%msg%" 97
@call cbr-all.bat
@call deploy.bat
@call run2.bat
@call cEnd "%msg%" 97
@endlocal