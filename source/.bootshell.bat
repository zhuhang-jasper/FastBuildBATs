:: -----------------------
:: ##Shell
:: -----------------------
:SHELL
@cd /d %~dp0
@call .bootup.bat
::@start /b /wait .bootup.bat & rem //low RAM
::@cmd /k ".bootup.bat" & rem //old method

:COMMANDER
@set isHelp=false
@set msg=
@echo.
@echo ^@%username%[97m^: %cd% [0m
@set ucmd=
@set /P ucmd=[97m ^> [0m

@if "%ucmd%"=="" (goto ENDCOMMAND)
::@echo User input is "%ucmd%" //debug

::block hard sensitive symbols
@cmd /v:on /c echo(^^!ucmd^^! | findstr /r "^[^|\&\^\"]*$^" > nul
@if %errorlevel% neq 0 (goto NOHARDSENSITIVE)

::handle '/?' arguments
@set "ucmd=%ucmd:/?=--help--%"
@call :PREPAREINPUT %ucmd%
@if "%ucmd2%"=="" (goto NOSENSITIVE)
@goto PREFILTER

::@CALLED
:PREPAREINPUT
@set "ucmd2=%*"
@goto :EOF

::@FLOW
:PREFILTER
::@echo Input text is "%ucmd%" //debug

::get input command
@set post_cmd=
@for /f %%a in ("%ucmd%") do @(set post_cmd=%%a & goto POSTFILTER)
@goto NOSENSITIVE

::@FLOW
:POSTFILTER
::Remove wrapping spaces
@set input_cmd=%post_cmd: =%
@call :PREPARECOMMAND %input_cmd%
@if "%input_cmd%"=="" (goto NOINPUT)

::handle soft sensitive symbols
@cmd /v:on /c echo(^^!input_cmd^^! | findstr /r "^[^|\&\^\\/?*:()<>\"]*$^" > nul
@if %errorlevel% neq 0 (goto NOSENSITIVE)

@goto PROCESSCOMMAND

::@CALLED
:PREPARECOMMAND
@set input_cmd=%*
@goto :EOF

::@FLOW
:PROCESSCOMMAND
::@echo Input command is "%input_cmd%" //debug
@set "ucmd=#s#%ucmd%"

::redirect certain commands
@if "%input_cmd%"=="cmd" (goto NOCMD)
@if "%input_cmd%"=="--help--" (goto HELP)
@if "%input_cmd%"=="devcfg" (set ucmd=edit .bootup)
@if "%input_cmd%"=="dev" (set ucmd=edit .bootshell)
@if "%input_cmd%"=="help" (set ucmd=%ucmd:#s#help=help.bat%)
@if "%input_cmd%"=="reboot" (goto ENDSHELL)

:: handle '--help--' arguments
@set "ucmd=%ucmd:#s#=%"
@set "ucmd=%ucmd:--help--="/?"%"
@call .isHelp.bat %ucmd%
@if "%isHelp%"=="true" (goto HELPCMD)
@call :EXECUTE %ucmd%
::AutoReboot after UserConfig
@if "%input_cmd%"=="config" (goto ENDSHELL)
@goto ENDCOMMAND

::@CALLED
:EXECUTE
@call %*
@goto :EOF

:HELP
::@call cmds.bat
@call help.bat mainprogram
@goto ENDCOMMAND

:HELPCMD
@call help.bat %input_cmd%
@goto ENDCOMMAND

:NOINPUT
@echo No command input ^:^) 
@goto ENDCOMMAND

:NOHARDSENSITIVE
@echo Sensitive character blocked.
@goto ENDCOMMAND

:NOSENSITIVE
@echo Unexpected input at this time.
::@echo Sensitive input not allowed. Example: ^( ^) ^& ^" ^/ ^| ^< ^> 
@goto ENDCOMMAND

:NOCMD
@echo Command Prompt not allowed in here!
@goto ENDCOMMAND

:ENDCOMMAND
@goto COMMANDER

::Make program rebootable
:ENDSHELL
::@if "%exitlevel%" NEQ "1" (goto BOOT)
@goto SHELL

@exit