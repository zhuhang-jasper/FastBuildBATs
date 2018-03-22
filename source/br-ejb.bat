@call .preLoad.bat
@pushd "%fpx_ear_dir%"
@for /D %%f in (fpx-admin-ejb-ear*) do @echo [33mRemoving old EAR ^>^> %%f [0m & @rmdir %%f /S /Q
@echo [33mExecute GRADLE %fpx_ejb_dir%\%gradle_cmd_buildrelease% [0m
@cd %fpx_ejb_dir%
@%gradle_cmd_buildrelease% & @popd