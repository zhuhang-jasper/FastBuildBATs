@call isConfigured
@echo [33mRenaming .deployed to .dodeploy...[0m
@pushd "%jboss_deploy_dir%"
@ren *.deployed *.dodeploy 2>NUL & popd
@if defined jboss_env (@echo [31m///// %jboss_env% /////[0m)
@echo [31mRestarting JBOSS in previous terminal...[0m