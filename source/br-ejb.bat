@call .preLoad.bat

@if not exist %fpx_ear_dir% (goto BUILD)
@pushd "%fpx_ear_dir%"
@for /D %%f in (%ejb_prefix%ejb-ear*) do @echo [33mRemoving old EAR ^>^> %%f [0m & @rmdir %%f /S /Q

:BUILD
@echo [33mGRADLE ^> %fpx_ejb_dir%\%gradle_cmd_buildrelease%%Penv% [0m
@cd %fpx_ejb_dir%

@setlocal
@set command=%gradle_cmd_buildrelease%%Penv%
@if "%gradle_enable_debug%"=="1" set command=%command% %gradle_cmd_debug_flag%
@call %command%
@endlocal
@popd