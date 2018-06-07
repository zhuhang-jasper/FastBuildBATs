@call .preLoad.bat
@pushd "%fpx_admin_dir%"
@echo [33mGRADLE ^> %fpx_admin_dir%\%gradle_cmd_cleanbuild%%Penv% [0m

@setlocal
@set command=%gradle_cmd_cleanbuild%%Penv%
@if "%gradle_enable_debug%"=="1" set command=%command% %gradle_cmd_debug_flag%
@call %command%
@endlocal
@popd