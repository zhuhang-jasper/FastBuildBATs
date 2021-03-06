@call .preLoad.bat

@if not exist %fpx_war_dir% (goto BUILD)
@pushd "%fpx_war_dir%"
@for /D %%f in (%webview_prefix_name%*) do @echo [33mRemoving old WAR ^>^> %%f [0m & @rmdir %%f /S /Q

:BUILD
@echo [33mGRADLE ^> %fpx_webview_dir%\%gradle_cmd_buildrelease%%Penv% [0m
@cd %fpx_webview_dir%

@setlocal
@set command=%gradle_cmd_buildrelease%%Penv%
@if "%gradle_enable_debug%"=="1" set command=%command% %gradle_cmd_debug_flag%
@call %command%
@endlocal
@popd