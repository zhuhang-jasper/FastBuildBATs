@set isHelp=false
@set param=%*
@set param=%param:/?=-help-%
@for %%a in (%param%) do @(if [%%a]==["-help-"] set isHelp=true)