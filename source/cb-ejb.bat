@call .preLoad.bat
@pushd "%fpx_ejb_dir%"
@echo [33mExecute GRADLE %fpx_ejb_dir%\%gradle_cmd_cleanbuild% [0m
@call %gradle_cmd_cleanbuild%
@popd
