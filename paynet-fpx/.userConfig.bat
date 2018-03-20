:: --------------
:: Change Variables below
:: --------------
:: FOLDER PATHS
@set project_title=FPX - MyClear
@set jboss_root=D:\jboss-eap-6.4-fpx
@set fpx_root=D:\.projects\paynet-fpx
:: GRADLE COMMANDS
::  Penv = local//dev//office//...
@set Penv=local
@set gradle_cmd_cleanbuild=gradle clean build -Penv=%Penv%
@set gradle_cmd_buildrelease=gradle buildRelease -Penv=%Penv%
:: JBOSS STANDALONE BATCH FILE NAME
:: @set jboss_uat_batname=standalone-start-full.bat
:: @set jboss_fpxnew_batname=standalone-start-full.bat
@set jboss_uat_batname=standalone-start-uat.bat
@set jboss_fpxnew_batname=standalone-start-fpxnew.bat
::
@set isConfigLoaded=yes