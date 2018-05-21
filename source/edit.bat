@if "%~1"=="" (goto NOINPUT)

@setlocal
@set file="%root%\%~1.bat"
@if not exist %file% (goto NOFOUND)
@start %notepad_exec% %file%
@endlocal
@goto :EOF

:NOFOUND
@echo [31mERROR: '%~1' is not a valid command. [0m
@goto :EOF

:NOINPUT
@echo [31mERROR: No command specified.[0m
@call help.bat /EDIT