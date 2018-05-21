@call .preLoad.bat
@if not exist %userConfig_file% copy "%userConfig_default%" "%userConfig_file%"
@echo [33mWaiting for user to finish configuration in new window... [0m 
@echo [33m(Program will reboot itself) [0m 
@call %notepad_exec% %userConfig_file%
::@call reboot.bat