@if "%1"=="" (@echo No command specified. ^(Example: edit run^)) else (@start %notepad_exec% %root%\%1.bat)
