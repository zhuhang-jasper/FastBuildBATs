@set isConfigCheck=.isConfigured.bat
@set fcBegin=.cBegin.bat
@set fcEnd=.cEnd.bat
@set isHelpCheck=.isHelp.bat

::Validate batch file exist
@if not exist "%~dp0.\%isConfigCheck%" (call :MISSING "%isConfigCheck%")
@if not exist "%~dp0.\%fcBegin%" (call :MISSING "%fcBegin%")
@if not exist "%~dp0.\%fcEnd%" (call :MISSING "%fcEnd%")
@if not exist "%~dp0.\%isHelpCheck%" (call :MISSING "%isHelpCheck%")

::Check if userConfig file is loaded
@call %isConfigCheck%

::Check if user input help argument
@call %isHelpCheck% %*

::Return to program
@goto :EOF

:MISSING
@echo [31mFATAL: "%~1" not found in: [0m
@echo [31m"%~dp0" [0m
@echo [33mPlease update tool. Press any key to close. . . [0m
@pause 1>NUL
@exit
@goto :EOF