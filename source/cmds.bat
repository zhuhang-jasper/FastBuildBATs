@echo off
@if "%~1"=="/all" (goto ALL)

:COMMON
echo  Most Useful Commands:
echo    pull ^:1       =   git pull from default/input branch
echo    cbr-ejb       =   build deployable EAR ^& update EJB client
echo    cbr           =   build deployable WAR
echo    cbr-all       =   one click build deployable EAR ^& WAR
echo    deploy        =   update WAR ^& EAR folders in JBOSS deployment
echo    run/run2      =   start JBOSS server (UAT)/(FPXNEW)
echo    leaf          =   deploy changes (thymeleaf/locale)
echo    up-res        =   deploy changes (thymeleaf/static/locale)
echo    kill          =   close all running JBOSS servers
echo    rerun         =   kill ^& rerun last started JBOSS server
echo    bd            =   one click Rebuild, Redeploy
echo    3run/3run2    =   one click Rebuild, Redeploy, Run/Run2
echo    2r            =   one click Rebuild, Redeploy, Rerun (only WAR)
echo    3r            =   one click Rebuild, Redeploy, Rerun (WAR ^& EJB)
echo    targz         =   export local jboss deployments as .tar.gz file
echo    extargz ^:1 ^:2 =   gradle build ^& export as .tar.gz file (no traces)
echo    src           =   open explorer to folder ^> source code 
echo    src-th        =   open explorer to folder ^> thymeleaf
echo    jboss         =   open explorer to folder ^> JBOSS deployment
echo    log           =   open explorer to folder ^> LOG_path set in USER CONFIG
echo    workspace     =   open explorer to folder ^> user workspace
echo    eclipse       =   update dependencies for Eclipse IDE (build.gradle)
echo  Others ^>^> [config]//[help]//[reboot]//[welcome]//[edit]//[root]
echo.
echo  [33mTo view complete list of commands, use ^"cmds /all^". [0m
@goto END

:ALL
echo  All Available Commands:
echo     cb-ejb       =   clean build EJB
echo     br-ejb       =   buildRelease EJB
echo     mv-ejb       =   export EJB client JAR to webview libs folder
echo    cbr-ejb       =   produce deployable EAR ^& ^"mv-ejb^" ^(cb ^+ br^) 
echo     cb           =   clean build webview
echo     br           =   buildRelease webview
echo    cbr           =   build deployable WAR ^(cb ^+ br^) 
echo    cbr-all       =   build deployable EAR ^& WAR ^(cbr ^+ cbr-ejb^) 
echo    src           =   open explorer to folder ^> project src code 
echo    src-th        =   open explorer to folder ^> thymeleaf
echo    war           =   open explorer to folder ^> WAR distr
echo    ear           =   open explorer to folder ^> EAR distr
echo    jboss         =   open explorer to folder ^> JBOSS deployment
echo    jboss-th      =   open explorer to folder ^> JBOSS WAR thymeleaf
echo    log           =   open explorer to folder ^> LOG_path set in USER CONFIG
echo    workspace     =   open explorer to folder ^> user workspace
echo    leaf          =   deploy changes (thymeleaf/locale)
echo    up-res        =   deploy changes (thymeleaf/static/locale)
echo    up-war        =   update WAR folder in JBOSS deployment
echo    up-ear        =   update EAR folder in JBOSS deployment
echo    deploy        =   update WAR ^& EAR folders in JBOSS deployment
echo    dodeploy      =   clean JBOSS marker files ^& autogen .dodeploy
echo    run/run2      =   start JBOSS server (UAT)/(FPXNEW)
echo    kill          =   close all running JBOSS servers
echo    rerun         =   kill ^& rerun last started JBOSS server
echo    bd            =   one click Rebuild, Redeploy
echo    3run/3run2    =   one click Rebuild, Redeploy, Run/Run2
echo    2r            =   one click Rebuild, Redeploy, Rerun (only WAR)
echo    3r            =   one click Rebuild, Redeploy, Rerun (WAR ^& EJB)
echo    pull ^:1       =   git pull from default/input branch
echo    targz         =   export local jboss deployments as .tar.gz file
echo    extargz ^:1 ^:2 =   gradle build ^& export as .tar.gz file (no traces)
echo    eclipse       =   update dependencies for Eclipse IDE (build.gradle)
echo  Others ^>^> [config]//[help]//[reboot]//[welcome]//[edit]//[root]
@goto END

:END
@echo on