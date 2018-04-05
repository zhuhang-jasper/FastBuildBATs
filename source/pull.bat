@call .preLoad.bat
@cd %fpx_root%
@if "%~1"=="" (echo ERROR: No branch specified. ^(Example: pull reporting^) & goto END)
:BODY
@setlocal
@echo [33mGIT ^>[0m git pull origin %~1
@SET /P AREYOUSURE=Confirm branch name (Y/N)?
@IF /I "%AREYOUSURE%" NEQ "Y" (goto END)
@echo [33mGIT ^>[0m Pulling from %~1...
@git pull origin %~1
@endlocal
:END