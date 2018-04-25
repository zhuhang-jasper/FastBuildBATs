@call .preLoad.bat
@if "%~1"=="" (echo ERROR: No branch specified. ^(Example: pull reporting^) & goto END)
:BODY
@cd %fpx_root%
@setlocal
@echo.
@echo [33mGIT Directory ^>[0m %fpx_root%
@echo [33mGIT Command   ^>[0m git pull origin %~1
@echo.
@SET /P AREYOUSURE=Confirm pull (Y/N)?
@IF /I "%AREYOUSURE%" NEQ "Y" (goto END)
@echo [33mGIT ^>[0m Pulling from %~1...
@git pull -v --no-rebase ^"origin^" %~1
@endlocal
:END