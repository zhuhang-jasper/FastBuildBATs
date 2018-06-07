@call .preLoad.bat

@if not exist %fpx_ear_dir% (goto BUILD)
@pushd "%fpx_ear_dir%"
@for /D %%f in (fpx-admin-ejb-ear*) do @echo [33mRemoving old EAR ^>^> %%f [0m & @rmdir %%f /S /Q

:BUILD
@echo [33mGRADLE ^> %fpx_ejb_dir%\%gradle_cmd_buildrelease%%Penv% [0m
@cd %fpx_ejb_dir%
@call %gradle_cmd_buildrelease%%Penv%
@popd