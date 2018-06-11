::DISPLAY HELP DOCUMENTATION FOR COMMANDS
::INPUT PARAMETER IS COMMAND TO SHOW HELP DOC

@setlocal
@if "%~1"=="" (goto HELP)
@if "%~1"=="mainprogram" (goto MAINPROGRAM)
@for /f "tokens=1 delims=/ " %%a in ("%~1") do @set arg=%%a
@set file="%root%\%arg%.bat"
@if not exist %file% (goto NOTFOUND)

::Validate If HELP defined for specified command
::@findstr /ri /c:"^ *:%arg% " /c:"^ *:%arg%$" "%~f0" >nul 2>nul && (call :REDIRECT "%arg%" & goto :EOF)
@call :REDIRECT "%arg%"
::@echo [33mHELP documentation not added for '%arg%' command.[0m
@goto ENDHELP

:REDIRECT
@if "%~1"=="help" (goto help)
@echo [97mHELP Doc:[0m
@goto %~1 2>nul || @echo [33mHELP documentation not added for '%arg%' command.[0m
@goto :EOF

:HELP
@echo This is HELP Doc for FastBuildBAT program.
@echo.
@echo USAGE:
@echo     help [command] 
@echo         command   Displays help information on that command.
@echo.
@echo  Alternatively, you can use the '/?' switch on any command.
@goto ENDHELP

:MAINPROGRAM
@echo [33mFastBuildBAT is a small program written using MS-DOS commands. It is a set
@echo of BATCH scripts to help you build and deploy project source code easily.
@echo.
@echo Some features include:
@echo   - GRADLE Build commands (clean build ^& buildRelease)
@echo   - Auto update EJB client JAR file for WAR building
@echo   - Switch gradle environment (Penv) easily
@echo   - Sync Thymeleaf HTML changes for instant effect in browser F5
@echo   - Deploy WAR ^& EAR to local JBOSS (Run ^& Kill easily)
@echo   - Export project as a '.tar.gz' for quick office deployment
@echo   - GIT implementation (branch info, pull)
@echo   - Explorer shortcuts to frequently accessed folders[0m
@echo.
@echo  [33mTo list useful commands, enter ^'cmds^'. [0m
@echo  [33mTo view complete list of commands, enter ^'cmds /all^'. [0m
@goto ENDHELP

:: ==========================
::     HELP DOCUMENTATION
:: ==========================

:ROOT
@echo Change command-line directory to tool path using 'CD'.
@echo If current path is already tool path, return project path.
@echo.
@echo USAGE:
@echo     ROOT [e] [/?]
@echo         e           Specify to open explorer to ^<TOOL_PATH^>.
@echo.
@echo   ^<TOOL_PATH^>     =  "%root%"
@echo   ^<PROJECT_PATH^>  =  "%fpx_root%"
@echo.
@echo Examples:
@echo   ^> root         ...  Change directory to ^<TOOL_PATH^> or ^<PROJECT_PATH^>.
@echo   ^> root e       ...  Opens file explorer to ^<TOOL_PATH^>.
@goto ENDHELP

:EDIT
@echo Opens command source code (batch file) in text editor.
@echo.
@echo USAGE:
@echo     EDIT command [/?]
@echo         command           Specifies command to be edited.
@echo.
@echo Examples:
@echo   ^> edit run         ...  Opens run.bat in text editor
@goto ENDHELP

:PULL
@echo Perform GIT PULL on project. Confirmation will be prompt before pull.
@echo.
@echo USAGE:
@echo     PULL branch [/?]
@echo         branch           (Optional) Specifies branch name for git pull.
@echo                          If empty, default branch is used (USERCONFIG).
@echo.
@echo   Use command "config" to set default branch. 
@echo.
@echo Examples:
@echo   ^> pull               ...  GIT pull from default branch defined in config.
@echo   ^> pull reporting     ...  GIT pull from 'reporting' branch.
@goto ENDHELP

:CB-EJB
@echo Gradle clean build EJB using ^<GRADLE_CB_COMMAND^>.
@echo.
@echo   ^<GRADLE_CB_COMMAND^>    =  "%gradle_cmd_cleanbuild%%Penv%"
@goto ENDHELP

:BR-EJB
@echo Gradle buildRelease EJB using ^<GRADLE_BR_COMMAND^> and
@echo output EAR in ^<GRADLE_EAR_DIST^>.
@echo.
@echo   ^<GRADLE_BR_COMMAND^>    =  "%gradle_cmd_buildrelease%%Penv%"
@echo   ^<GRADLE_EAR_DIST^>     =  "%fpx_ear_dir%"
@goto ENDHELP

:MV-EJB
@echo Copies client JAR from ^<GRADLE_EJB_JAR^> to ^<GRADLE_WAR_CLIENT_EJB^> 
@echo for WAR building.
@echo.
@echo   ^<GRADLE_EJB_JAR^>         =  "%fpx_ejb_jar_dir%"
@echo   ^<GRADLE_WAR_CLIENT_EJB^>  =  "%fpx_ejb_client_dir%"
@goto ENDHELP

:CBR-EJB
@echo Gradle builds EAR file ^(clean build ^+ build release^) and output 
@echo in ^<GRADLE_EAR_DIST^>. Updates client JAR at ^<GRADLE_WAR_CLIENT_EJB^>
@echo for WAR file building.
@echo.
@echo Following Commands executed in order:
@echo   CB-EJB, BR-EJB, MV-EJB
@echo.
@echo   ^<GRADLE_CB_COMMAND^>   =  "%gradle_cmd_cleanbuild%%Penv%"
@echo   ^<GRADLE_BR_COMMAND^>   =  "%gradle_cmd_buildrelease%%Penv%"
@echo   ^<GRADLE_EAR_DIST^>     =  "%fpx_ear_dir%"
@echo   ^<GRADLE_WAR_CLIENT_EJB^>  =  "%fpx_ejb_client_dir%"
@goto ENDHELP

:CB
@echo Gradle clean build WAR using ^<GRADLE_CB_COMMAND^>.
@echo.
@echo   ^<GRADLE_CB_COMMAND^>    =  "%gradle_cmd_cleanbuild%%Penv%"
@goto ENDHELP

:BR
@echo Gradle buildRelease WAR using ^<GRADLE_BR_COMMAND^> and
@echo output WAR in ^<GRADLE_WAR_DIST^>.
@echo.
@echo   ^<GRADLE_BR_COMMAND^>    =  "%gradle_cmd_buildrelease%%Penv%"
@echo   ^<GRADLE_WAR_DIST^>      =  "%fpx_war_dir%"
@goto ENDHELP

:CBR
@echo Gradle builds WAR file ^(clean build ^+ build release^) and output 
@echo in ^<GRADLE_WAR_DIST^>.
@echo.
@echo   ^<GRADLE_CB_COMMAND^>    =  "%gradle_cmd_cleanbuild%%Penv%"
@echo   ^<GRADLE_BR_COMMAND^>    =  "%gradle_cmd_buildrelease%%Penv%"
@echo   ^<GRADLE_WAR_DIST^>      =  "%fpx_war_dir%"
@goto ENDHELP

:CBR-ALL
@echo Gradle builds WAR ^& EAR file ^(clean build ^+ build release^) and output 
@echo in ^<GRADLE_EAR_DIST^> and ^<GRADLE_WAR_DIST^>.
@echo for WAR file building.
@echo.
@echo Following Commands executed in order:
@echo   CBR-EJB, CBR
@echo.
@echo   ^<GRADLE_CB_COMMAND^>   =  "%gradle_cmd_cleanbuild%%Penv%"
@echo   ^<GRADLE_BR_COMMAND^>   =  "%gradle_cmd_buildrelease%%Penv%"
@echo   ^<GRADLE_EAR_DIST^>     =  "%fpx_ear_dir%"
@echo   ^<GRADLE_WAR_DIST^>      =  "%fpx_war_dir%"
@goto ENDHELP

:DEPLOY
@echo Copies WAR and EAR folders from local Gradle distributions at
@echo ^<GRADLE_WAR_DIST^> ^& ^<GRADLE_EAR_DIST^> to ^<JBOSS_DEPLOYMENTS^>.
@echo.
@echo USAGE:
@echo     DEPLOY [subfolder] [/?]
@echo         subfolder          (Optional) Specifies sub-path within ^<JBOSS_DEPLOYMENTS^> 
@echo                            to deploy WAR and EAR.
@echo                            If empty, root of ^<JBOSS_DEPLOYMENTS^> will be used.
@echo.
@echo   ^<GRADLE_WAR_DIST^>   = "%fpx_war_dir%"
@echo   ^<GRADLE_EAR_DIST^>   = "%fpx_ear_dir%"
@echo   ^<JBOSS_DEPLOYMENTS^> = "%jboss_deploy_dir%"
@echo.
@echo   Use command "dodeploy" to clean ^& rebuild JBOSS markers.
@echo.
@echo Examples:
@echo   ^> deploy        ... Copy latest built WAR ^& EAR to "JBOSS\standalone\deployments\"
@echo   ^> deploy abc    ... Copy latest built WAR ^& EAR to "JBOSS\standalone\deployments\abc\"
@goto ENDHELP

:DODEPLOY
@echo Creates '.dodeploy' JBOSS marker files for all WAR and EAR folders.
@echo Also removes all other marker files such as: '.isdeploying','.deployed',
@echo '.failed','.undeployed',etc (Refer JBOSS Documentation)
@echo.
@echo USAGE:
@echo     DODEPLOY [subfolder] [/?]
@echo         subfolder          (Optional) Specifies sub-path within ^<JBOSS_DEPLOYMENTS^> 
@echo                            that contains the WAR and EAR.
@echo                            If empty, root of ^<JBOSS_DEPLOYMENTS^> will be used.
@echo.
@echo   ^<JBOSS_DEPLOYMENTS^>  =  "%jboss_deploy_dir%"
@echo.
@echo Examples:
@echo   ^> dodeploy        ... Takes WAR ^& EAR from "JBOSS\standalone\deployments\"
@echo                         and produces 'war.dodeploy' and 'ear.dodeploy'
@echo   ^> dodeploy abc    ... Takes WAR ^& EAR from "JBOSS\standalone\deployments\abc\"
@echo                         and produces 'war.dodeploy' and 'ear.dodeploy'
@goto ENDHELP

:BD
@echo One-click rebuild ^& redeploy. Gradle rebuilds WAR ^& EAR then copies
@echo to ^<JBOSS_DEPLOYMENTS^>.
@echo.
@echo Following Commands executed in order:
@echo   CBR-ALL, DEPLOY
@echo.
@echo   ^<JBOSS_DEPLOYMENTS^>        =  "%jboss_deploy_dir%"
@echo.
@echo   Use command "2r/3r" to start JBOSS after deploying.
@goto ENDHELP

:RUN
@echo Start JBOSS server using ^<JBOSS_UAT_BATCHFILE^> and deploy 
@echo WAR ^& EAR in ^<JBOSS_DEPLOYMENTS^>. Environment ^= 'UAT'.
@echo.
@echo Following Commands also executed before starting JBOSS:
@echo   KILL, DODEPLOY
@echo.
@echo   ^<JBOSS_CMD_TITLE^>       =  "JBOSS_MyClear_UAT"
@echo   ^<JBOSS_UAT_BATCHFILE^>   =  "%jboss_uat_batname%"
@echo   ^<JBOSS_DEPLOYMENTS^>     =  "%jboss_deploy_dir%"
@echo.
@echo   Use command "run2" for 'FPXNEW' environment.
@goto ENDHELP

:RUN2
@echo Start JBOSS server using ^<JBOSS_FPXNEW_BATCHFILE^> and deploy 
@echo WAR ^& EAR in ^<JBOSS_DEPLOYMENTS^>. Environment ^= 'FPXNEW'.
@echo.
@echo Following Commands also executed before starting JBOSS:
@echo   KILL, DODEPLOY
@echo.
@echo   ^<JBOSS_FPXNEW_BATCHFILE^>   =  "%jboss_fpxnew_batname%"
@echo   ^<JBOSS_DEPLOYMENTS^>        =  "%jboss_deploy_dir%"
@echo.
@echo   Use command "run" for 'UAT' environment.
@goto ENDHELP

:2R
@echo One-click rebuild, redeploy, rerun ^(only WAR^). Gradle rebuilds
@echo WAR, copy to ^<JBOSS_DEPLOYMENTS^> and restart JBOSS server.
@echo.
@echo Following Commands executed in order:
@echo   CBR-ALL, DEPLOY, RERUN
@echo.
@echo   ^<JBOSS_DEPLOYMENTS^>        =  "%jboss_deploy_dir%"
@echo.
@echo   Use command "3r" to include EAR.
@goto ENDHELP

:3R
@echo One-click rebuild, redeploy, rerun. Gradle rebuilds WAR ^& EAR,
@echo copy to ^<JBOSS_DEPLOYMENTS^> and restart JBOSS server.
@echo.
@echo Following Commands executed in order:
@echo   CBR-ALL, DEPLOY, RERUN
@echo.
@echo   ^<JBOSS_DEPLOYMENTS^>        =  "%jboss_deploy_dir%"
@echo.
@echo   Use command "3run/3run2" to specify environment.
@goto ENDHELP

:3RUN
@echo One-click rebuild, redeploy, run. Gradle rebuilds WAR ^& EAR,
@echo copy to ^<JBOSS_DEPLOYMENTS^> and start JBOSS server using
@echo ^<JBOSS_UAT_BATCHFILE^> Environment ^= 'UAT'.
@echo.
@echo Following Commands executed in order:
@echo   CBR-ALL, DEPLOY, RUN2
@echo.
@echo   ^<JBOSS_UAT_BATCHFILE^>   =  "%jboss_uat_batname%"
@echo   ^<JBOSS_DEPLOYMENTS^>        =  "%jboss_deploy_dir%"
@echo.
@echo   Use command "3run2" for 'FPXNEW' environment.
@goto ENDHELP

:3RUN2
@echo One-click rebuild, redeploy, run. Gradle rebuilds WAR ^& EAR,
@echo copy to ^<JBOSS_DEPLOYMENTS^> and start JBOSS server using
@echo ^<JBOSS_FPXNEW_BATCHFILE^> Environment ^= 'FPXNEW'.
@echo.
@echo Following Commands executed in order:
@echo   CBR-ALL, DEPLOY, RUN2
@echo.
@echo   ^<JBOSS_FPXNEW_BATCHFILE^>   =  "%jboss_fpxnew_batname%"
@echo   ^<JBOSS_DEPLOYMENTS^>        =  "%jboss_deploy_dir%"
@echo.
@echo   Use command "3run" for 'UAT' environment.
@goto ENDHELP

:RERUN
@echo Restart ongoing JBOSS server, 
@echo or Start JBOSS server using last-executed batch file.
@goto ENDHELP

:KILL
@echo Terminates all running JBOSS servers by killing CMDs with
@echo the following Window Title:
@echo   "JBOSS_MyClear_*"         - CMDs running normally
@echo   "Select JBOSS_MyClear_*"  - CMDs frozen in text selection mode
@goto ENDHELP

:LEAF
@echo Copy latest Thymeleaf templates(HTML) and Message locale to sync WAR file
@echo in ^<GRADLE_WAR_DIST^> ^& deploy to ^<JBOSS_DEPLOYMENTS^>.
@echo Any front-end changes will take effect immediately upon refresh in browser.
@echo.
@echo Content included:  
@echo "%fpx_thymeleaf_dir%"
@echo "%fpx_resource_dir%\locale"
@echo.
@echo   ^<JBOSS_DEPLOYMENTS^>  =  "%jboss_deploy_dir%"
@echo   ^<GRADLE_WAR_DIST^>    =  "%fpx_war_dir%"
@echo.
@echo   Use command "up-res" to include static contents(CSS,JS,images,etc). 
@goto ENDHELP

:UP-RES
@echo Copy latest Thymeleaf templates(HTML), Message locale, ^& static contents(CSS,JS)
@echo to sync WAR file in ^<GRADLE_WAR_DIST^> ^& deploy to ^<JBOSS_DEPLOYMENTS^>.
@echo Any front-end changes will take effect immediately upon refresh in browser.
@echo.
@echo Content included:  
@echo "%fpx_thymeleaf_dir%"
@echo "%fpx_resource_dir%\locale"
@echo "%fpx_resource_dir%\static"
@echo.
@echo   ^<JBOSS_DEPLOYMENTS^>  =  "%jboss_deploy_dir%"
@echo   ^<GRADLE_WAR_DIST^>    =  "%fpx_war_dir%"
@echo.
@echo   Use command "leaf" to exclude static contents(CSS,JS,images,etc). 
@goto ENDHELP

:TARGZ
@echo Export local WAR ^& EAR from "JBOSS\standalone\deployments\", with 'dodeploy' 
@echo marker files, into a '.tar.gz' file using 7zip.  
@echo Upon success, opens explorer to output folder.
@echo.
@echo USAGE:
@echo     targz [subfolder] [/?]
@echo         subfolder          (Optional) Specifies sub-path within ^<JBOSS_DEPLOYMENTS^> 
@echo                            that contains the WAR and EAR. 
@echo                            If empty, root of ^<JBOSS_DEPLOYMENTS^> will be used.
@echo.
@echo   ^<JBOSS_DEPLOYMENTS^>  =  "%jboss_deploy_dir%"
@echo.
@echo Examples:
@echo   ^> targz         ... Takes WAR ^& EAR from "JBOSS\standalone\deployments\"
@echo                        and produces a 'local.tar.gz'. (if current Penv=local)
@echo   ^> targz abc     ... Takes WAR ^& EAR from "JBOSS\standalone\deployments\abc\"
@echo                        and produces a 'local.tar.gz'. (if current Penv=local)
@goto ENDHELP

:EXTARGZ
@setlocal
@set "tempPenv="
@if "%branch_categ%"=="refinement" (set tempPenv=%extargz_penv_refinement%)
@if "%branch_categ%"=="reporting" (set tempPenv=%extargz_penv_reporting%)
@echo Gradle builds WAR ^& EAR, then exports together with 'dodeploy' markers into
@echo a '.tar.gz' file using 7zip, without replacing any local JBOSS deployments. 
@echo However, previous GRADLE build distributions will be overwritten.
@echo Upon success, opens explorer to output folder.
@echo.
@echo USAGE:
@echo     extargz Penvironment [/soft /war] [/?]
@echo         Penvironment        Specifies the environment to perform Gradle build.
@echo                             Also known as Penv. Options such as:
@echo                              'dev, local, office, office_phase2, sit'
@echo                             If empty, default extargz Penv is used (USERCONFIG).
@echo.
@echo   Use command "config" to set default Penv. 
@echo.
@echo Examples:
@echo   ^> extargz                 ... Uses default extargz Penv defined in config.
@echo                                 Current default = '%tempPenv%'
@echo   ^> extargz office          ... Gradle build WAR ^& EAR (Penv=office), and
@echo                                 produces a 'office.tar.gz'.
@echo   ^> extargz office /war     ... Only Gradle build WAR (Penv=office), takes
@echo                                 EAR from previous gradle build distributions.
@echo   ^> extargz office /soft    ... Takes WAR ^& EAR from previous gradle build 
@echo                                 distributions.
@echo                                 WAR changes from LEAF ^& UP-RES are included.
@echo.
@echo [33mSuggestions:
@echo   ^> extargz office            ... For refinement office deployment.
@echo   ^> extargz office_phase2     ... For reporting office deployment.[0m
@endlocal
@goto ENDHELP

:ECLIPSE
@echo Updates gradle.build in ^<FPX_EJB_PATH^> with the custom build.prop 
@echo defined in USERCONFIG based on JBOSS env. Upon finishing task, 
@echo refresh project in Eclipse IDE to refetch correct dependencies.
@echo Note: gradle.build file will be backed up.
@echo.
@echo USAGE:
@echo     eclipse [/clean /r] [/?]
@echo         /clean      Undo modification of build.gradle file.
@echo         /r          Undo modification of build.gradle file.
@echo.
@echo   ^<FPX_EJB_PATH^>    = "%fpx_ejb_dir%"
@echo   REPORTING file      =  "build.gradle.eclipse.reporting"
@echo   REFINEMENT file     =  "build.gradle.eclipse.refinement"
@echo.
@echo   Use command "config" to locate custom gradle.build file path. 
@echo   Within custom file, please add eclipse-related modifications
@echo.
@echo Examples:
@echo   ^> eclipse           ... Back-ups ^& Updates gradle.build file.
@echo   ^> eclipe /clean     ... Restore backed-up gradle.build.
@echo   ^> eclipse -r        ... Restore backed-up gradle.build.
@goto ENDHELP

:: =========================
::     HELP DOC END HERE
:: =========================

:NOTFOUND
@echo '%arg%' is not a valid command.
@goto ENDHELP

:ENDHELP
@endlocal
@goto :EOF