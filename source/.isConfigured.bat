@if "%isConfigLoaded%"=="yes" (goto :EOF)
@echo FATAL: Configuration not set. Please start with .alwaysStartMe.bat
@echo Press any key to close . . .
@pause 1>NUL
@exit
