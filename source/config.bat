@call .preLoad.bat
@if not exist %userConfig_file% copy "%userConfig_default%" "%userConfig_file%"
@start %notepad_exec% %userConfig_file%