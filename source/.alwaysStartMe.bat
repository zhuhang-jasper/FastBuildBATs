::ALWAYS RUN THIS BATCH FILE WITH PARAMETER = WORKSPACE FULL PATH
:: Example usage: .alwaysStartMe.bat "D:\project-name\."

@set source_code_root=%~dp0.
@cd /d %source_code_root%
@set "sys_workspace=%~1"
@if "%sys_workspace%"=="" set "sys_workspace=%source_code_root%" & goto STARTUP
@if exist "%sys_workspace%" goto STARTUP
@echo Failed to detect workspace. Check workspace path or leave parameter empty. & pause
@goto :EOF

:STARTUP
@start /b .bootshell.bat "%sys_workspace%"
::@cmd /k ".bootshell.bat" & rem //old method
@exit