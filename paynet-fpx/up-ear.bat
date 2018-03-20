@call isConfigured
@pushd "%jboss_deploy_dir%"
@for /D %%f in (fpx-admin-ejb-ear*) do @echo [33mDeleting old EAR from JBOSS dpl ^>^> %%f [0m & @rmdir %%f /S /Q
@cd "%fpx_ear_dir%"
@for /D %%f in (fpx-admin-ejb-ear*) do @echo [33mCopying new EAR to JBOSS dpl ^>^> %%f [0m & @xcopy %%f "%jboss_deploy_dir%\%%f" /E /Q /I /Y
@popd
