@call .preLoad.bat
@pushd "%fpx_ejb_dir%"
@echo [33mGRADLE ^> %fpx_ejb_dir%\%gradle_cmd_cleanbuild%%Penv% [0m
@call %gradle_cmd_cleanbuild%%Penv%
@popd
