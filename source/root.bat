@call .preLoad.bat

@if "%~1"=="e" (explorer %root%) else ( @if "%cd%\"=="%root%" (cd %fpx_root%) else (cd %root%) )
