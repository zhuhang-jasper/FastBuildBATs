@call .preLoad.bat

@setlocal
@set cmd_pull=git pull -v --no-rebase ^"origin^"
@if "%~1"=="" (goto DEFAULT) else (goto MANUAL)

:DEFAULT
@cd %fpx_root%
@set branch_to_pull=
::Get Default branch settings
@call .userConfig.bat --git-default "branch_to_pull"
@if "%branch_to_pull%"=="" (goto NO_INPUT)
@echo [33mGIT Default pulling from %branch_to_pull%... [0m
@echo [33mGIT ^>[0m %cmd_pull% %branch_to_pull%
@%cmd_pull% %branch_to_pull%
@goto END

:MANUAL
@cd %fpx_root%
@echo.
@echo [33mGIT Directory ^>[0m %fpx_root%
@echo [33mGIT Command   ^>[0m %cmd_pull% %~1
@echo.
@SET /P AREYOUSURE=Confirm pull (Y/N)?
@IF /I "%AREYOUSURE%" NEQ "Y" (goto END)
@echo [33mGIT pulling from %~1... [0m
@echo [33mGIT ^>[0m %cmd_pull% %~1
@%cmd_pull% %~1
@goto END

:NO_INPUT
@echo [31mERROR: No branch specified. ^(Example: pull reporting^) [0m
@echo [33mSUGGEST: Use command "config" to set default branch for pulling. [0m
@goto END

:END@endlocal
