@call isConfigured
@echo [33mDeleting old marker files...[0m
@del /Q "%jboss_deploy_dir%\*.*" >NUL 2>&1
@echo [33mAutobuild new .dodeploy marker files...[0m
@for /D %%f in (%jboss_deploy_dir%\fpx-admin*) do @copy NUL %%f.dodeploy >NUL




