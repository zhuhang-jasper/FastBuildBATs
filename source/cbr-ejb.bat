@call .preLoad.bat
@echo [95mBuilding deployable EAR and Updating new EJB client... [0m
@call cb-ejb.bat
@call br-ejb.bat
@call mv-ejb.bat
@echo [95mFinished Building deployable EAR and Updating new EJB client. [0m
