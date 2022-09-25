@echo off

:initialize

set DEBUG_COMMAND=
set DEBUG_REDIRECT=
set MOD_PROJECT_FOLDER=
set MOD_NAME=
set MOD_VERSION=
set MOD_SOURCE=
set MOD_TARGET=
set MOD_LOCAL_FOLDER=
set ARGUMENT_1=
set ARGUMENT_2=

:processarguments

set ARGUMENT_1=%1

if "%ARGUMENT_1%"=="/D" goto setupdebug
if "%ARGUMENT_1%"=="/d" goto setupdebug
if "%ARGUMENT_1%"=="/DEBUG" goto setupdebug
if "%ARGUMENT_1%"=="/debug" goto setupdebug

if "%ARGUMENT_1%"=="/?" goto usage
if "%ARGUMENT_1%"=="-?" goto usage
if "%ARGUMENT_1%"=="/HELP" goto usage
if "%ARGUMENT_1%"=="/help" goto usage

if "%ARGUMENT_1%"=="" goto setup

set MOD_PROJECT_FOLDER=%ARGUMENT_1%

goto usage

:setupdebug

set DEBUG_COMMAND=echo
set DEBUG_REDIRECT=
set ARGUMENT_2=%2
if "%ARGUMENT_2%"=="" goto setup

set MOD_PROJECT_FOLDER=%ARGUMENT_2%

goto setup

:setup

set MOD_NAME=zalchemy
set MOD_VERSION=0.0.1
set MOD_LOCAL_FOLDER=%USERPROFILE%\Zomboid\mods
set MOD_TARGET=%MOD_LOCAL_FOLDER%\%MOD_NAME%

if "%MOD_PROJECT_FOLDER%"=="" goto usedefaultprofilefolder

SET MOD_SOURCE=%MOD_PROJECT_FOLDER%\Contents\mods\%MOD_NAME%

if not "%DEBUG_COMMAND%"=="" goto debug

goto main

:usedefaultprofilefolder

set MOD_SOURCE=%USERPROFILE%\Zomboid\Workshop\%MOD_NAME%\Contents\mods\%MOD_NAME%

if not "%DEBUG_COMMAND%"=="" goto debug

goto main

:main

rmdir /S /Q %MOD_TARGET%
xcopy /S /E /V /Y /I /Q %MOD_SOURCE% %MOD_TARGET%

goto cleanup

:debug

echo DEBUG: Command line arguments: %*
echo DEBUG: Environment variables:
set | %windir%\system32\find.exe "DEBUG_"
set | %windir%\system32\find.exe "MOD_"
set | %windir%\system32\find.exe "ARGUMENT_"
echo.

%DEBUG_COMMAND% rmdir /S %MOD_TARGET% %DEBUG_REDIRECT%
%DEBUG_COMMAND% xcopy /P /S /E /V /W /I /F /-Y %MOD_SOURCE% %MOD_TARGET% %DEBUG_REDIRECT%

pause

goto end

:usage
echo Deploy Project Zomboid mod files to local mods folder.
echo.
echo deploytolocalmodfolder [/D] [path]
echo deploytolocalmodfolder [/?]
echo.
echo [path]         Specifies the mod project root folder to copy from.
echo.
echo /D             Debug mode used for troubleshooting execution of this script.
echo./?             Display this help and exit.
echo.

pause

goto cleanup

:cleanup

set DEBUG_COMMAND=
set DEBUG_REDIRECT=
set MOD_PROJECT_FOLDER=
set MOD_NAME=
set MOD_VERSION=
set MOD_SOURCE=
set MOD_TARGET=
set MOD_LOCAL_FOLDER=
set ARGUMENT_1=
set ARGUMENT_2=

goto end

:end
