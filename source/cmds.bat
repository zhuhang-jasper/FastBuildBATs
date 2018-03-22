@echo off
echo  Commands: 
echo     cb-ejb   =   clean build EJB
echo     br-ejb   =   buildRelease EJB
echo     mv-ejb   =   export EJB client JAR to webview libs folder
echo    cbr-ejb   =   produce deployable EAR ^& ^"mv-ejb^" ^(cb ^+ br^) 
echo     cb       =   clean build webview
echo     br       =   buildRelease webview
echo    cbr       =   produce deployable WAR ^(cb ^+ br^) 
echo    cbr-all   =   produce deployable EAR ^& WAR ^(cbr ^+ cbr-ejb^) 
echo    src       =   open file location for source codes
echo    src-th    =   open file location for thymeleaf templates
echo    war       =   open file location for WAR
echo    ear       =   open file location for EAR
echo    jboss     =   open file location for JBOSS deployment
echo    jboss-th  =   open file location for JBOSS thymeleaf templates
echo    leaf      =   update webview resources in WAR ^& JBOSS (template/locale)
echo    up-res    =   update webview resources in WAR ^& JBOSS (template/static/locale)
echo    up-war    =   update WAR folder in JBOSS deployment
echo    up-ear    =   update EAR folder in JBOSS deployment
echo    deploy    =   update WAR ^& EAR folders to JBOSS deployment
echo    dodeploy  =   clean JBOSS marker files ^& autogen .dodeploy
echo    run       =   start JBOSS server (UAT)
echo    run2      =   start JBOSS server (FPXNEW)
echo    rerun     =   live reDeploy JBOSS (rename .deployed ^-^> .dodeploy)
echo    2r        =   one click Rebuild, Redeploy, Rerun (exclude EJB)
echo    3r        =   one click Rebuild, Redeploy, Rerun
echo    3run[2]   =   one click Rebuild, Redeploy, Run[Run2]
echo  Others ^>^> [config]//[reboot]//[welcome]//[cmds]//[edit :cmd]
@echo on