@call isConfigured
@pushd "%fpx_ejb_dir%"
@echo [33mExecute GRADLE %fpx_ejb_dir%\%gradle_cmd_cleanbuild% [0m
@%gradle_cmd_cleanbuild% & @popd