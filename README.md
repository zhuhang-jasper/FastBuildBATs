# FastBuildBATs
Developer tool for managing, building &amp; deploying Gradle Project (Gradle, JBOSS, Git, 7zip)

## About
FastBuildBAT is a small program written using MS-DOS commands.
It is a set of BATCH scripts to help you build and deploy project source code easily. Some features include:
- GRADLE Build commands (clean build ^& buildRelease)
- Auto update EJB client JAR file for WAR building
- Switch gradle environment (Penv) easily
- Smart commands upon changing branch between reporting/refinement 
- Sync Thymeleaf HTML changes for instant effect in browser F5
- Deploy WAR ^& EAR to local JBOSS (Run ^& Kill easily)
- Export project as a '.tar.gz' for quick office deployment
- GIT implementation (branch info, pull)
- Eclipse implementation (swapping gradle.build for fast dependency refresh)
- Explorer shortcuts to frequently accessed folders
- more... (See "FILE_LIST_LOG.txt" or Enter "cmds" command in tool)

## Minimum Requirement
Windows 10 or above. To support colorful STDOUT.

## Instructions
(Optional) Setup gradle,git,7zip in environment variables, or do in step 6.
1. Copy prepared shortcut to desktop.
2. Update shortcut to point to "source/.alwaysStartMe.bat".
3. Run from shortcut.
4. Enter "CONFIG" command to do user configurations.
5. Done.

You can edit any command by typing "EDIT xxx" where xxx is the command name.
