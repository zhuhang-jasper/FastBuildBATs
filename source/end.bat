@call .preLoad.bat
@echo [33mKilling on-going running JBOSS servers...[0m
@taskkill /IM cmd.exe /FI "WINDOWTITLE eq Select JBOSS_MyClear*"
@taskkill /IM cmd.exe /FI "WINDOWTITLE eq JBOSS_MyClear*"