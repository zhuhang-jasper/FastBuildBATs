::ALWAYS RUN THIS BATCH FILE TO START TOOL
@set root=%~dp0.
@cd /d %root%
@if "%~1"=="" set "config_file=%root%\.userConfig.bat" & goto STARTUP
@if exist "%~1" set "config_file=%~1" & goto STARTUP
@echo Failed to load config file. Check parameter. & pause
@goto :EOF

:STARTUP
@start /b .bootshell.bat "%config_file%"
::@cmd /k ".bootshell.bat" & rem //old method
@exit