@if "%~1"=="" (echo ERROR: No command specified. ^(Example: edit run^) & goto END)
:BODY
@setlocal
@set file="%root%\%~1.bat"
@if not exist %file% (echo ERROR: Command not exist. & goto END)
@start %notepad_exec% %file%
@endlocal
:END