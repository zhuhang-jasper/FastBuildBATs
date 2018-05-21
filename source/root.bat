@call .preLoad.bat

@if "%~1"=="e" (goto EXPLORE)
@if "%cd%\."=="%root%" (goto CD_PROJECTPATH)

:CD_ROOTPATH
@cd %root%@goto :EOF

:CD_PROJECTPATH
@cd %fpx_root%
@goto :EOF

:EXPLORE
@explorer %root%
@goto :EOF
