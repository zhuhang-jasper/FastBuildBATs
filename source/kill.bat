@call .preLoad.bat

:: Count running jboss instances
@set runningJboss=0
@set runningJbossSel=0
@for /f "tokens=1 delims=" %%# in ('tasklist /fi "WINDOWTITLE eq JBOSS_MyClear*" ^| find /i /c /n "cmd.exe"') do @set runningJboss=%%#
@for /f "tokens=1 delims=" %%# in ('tasklist /fi "WINDOWTITLE eq Select JBOSS_MyClear*" ^| find /i /c /n "cmd.exe"') do @set runningJbossSel=%%#

@if "%runningJboss%%runningJbossSel%"=="00" (goto NOTHING)

:SOMETHING
@echo [33mKilling on-going running JBOSS servers...[0m

:: Kill jboss CMD
@if not "%runningJboss%"=="0" (@taskkill /IM cmd.exe /FI "WINDOWTITLE eq JBOSS_MyClear*")

:: Kill jboss CMD that is frozen in text selection mode
:: The word "Select" is prepended to window title
@if not "%runningJbossSel%"=="0" (@taskkill /IM cmd.exe /FI "WINDOWTITLE eq Select JBOSS_MyClear*")

@goto :EOF

:NOTHING
@echo [33mINFO: No on-going JBOSS server to be terminated. [0m
@goto :EOF