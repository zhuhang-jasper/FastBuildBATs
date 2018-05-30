@call .preLoad.bat

@if "%~1"=="/clean" (goto UNDOECLIPSE)
@if "%~1"=="/r" (goto UNDOECLIPSE)
@if "%enable_eclipse%"=="1" goto DOECLIPSE
@echo [33mEclipse Disabled. Enter "config" to change.[0m
@goto :EOF

:DOECLIPSE
@pushd "%fpx_ejb_dir%"
::Assume already applied Eclipse plugin
@if exist "build.gradle.bak" (echo [33mEclipse already configured.[0m & popd & goto :EOF)
@echo [31mSetup ECLIPSE dependencies[0m
@echo [33mBack up build.gradle...[0m
@copy build.gradle "build.gradle.bak" /Y >nul
@if "%branch_categ%"=="reporting" goto REPORTING
@if "%branch_categ%"=="refinement" goto REFINEMENT
@goto :EOF

:REPORTING
@echo [33mUpdating to '%custom_gradle_build_reporting_filename%' ...[0m
@copy %custom_gradle_build_reporting_filename% "build.gradle" /Y >nul
@goto ECLIPSE

:REFINEMENT
@echo [33mUpdating to '%custom_gradle_build_refinement_filename%' ...[0m
@copy %custom_gradle_build_refinement_filename% "build.gradle" /Y >nul
@goto ECLIPSE

:ECLIPSE
::@echo [33mGRADLE ^> Generating Eclipse Files...[0m
::@call gradle eclipse >nul
@echo [33mGRADLE ^> Done! Please refresh Gradle project within Eclipse.[0m
@popd
@goto :EOF

:UNDOECLIPSE
@pushd "%fpx_ejb_dir%"
@echo [31mClean Gradle ECLIPSE Changes[0m
@echo [33mRestoring build.gradle...[0m
@copy build.gradle.bak "build.gradle" /Y
@del /Q "build.gradle.bak" >NUL 2>&1
@popd
@goto :EOF