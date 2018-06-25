@call .preLoad.bat
@if not exist %fpx_ear_dir% echo [31mNo EAR found! Please perform gradle build.[0m & goto :EOF
@explorer "%fpx_ear_dir%"