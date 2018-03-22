@call .preLoad.bat
@pushd "%fpx_admin_dir%"
@echo [33mExecute GRADLE %fpx_admin_dir%\%gradle_cmd_cleanbuild% [0m
@%gradle_cmd_cleanbuild% & @popd