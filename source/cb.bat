@call .preLoad.bat
@pushd "%fpx_admin_dir%"
@echo [33mGRADLE ^> %fpx_admin_dir%\%gradle_cmd_cleanbuild% [0m
@call %gradle_cmd_cleanbuild%
@popd