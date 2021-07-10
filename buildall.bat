
@echo off

setlocal EnableDelayedExpansion

rem ----------------------------------------------------------
rem parse command lines

set "option="
for %%a in (%*) do (
   if not defined option (
      set arg=%%a
      if "!arg:~0,1!" equ "-" set "option=!arg!"
   ) else (
      set "option!option!=%%a"
      set "option="
   )
)

if defined option (
  echo buildall.bat - build all bits
  echo.
  echo Options:
  echo   -t {target-dir}    Specify the target directory where to install the bits
  echo   -p 32              Builds 32bit. Default: all
  echo   -p 64              Builds 64bit. Default: all
  echo.
  goto :eof
)

set dest_dir=%HOMEPATH%\klayout-bits-installed
if defined option-t (
  set dest_dir=%option-t%
)
echo Using for target directory: %dest_dir%
echo.

if defined option-p (
  if "%option-p%" == "32" (
    set option-32=1
  )
  if "%option-p%" == "64" (
    set option-64=1
  )
) else (
  set option-32=1
  set option-64=1
)

rem ----------------------------------------------------------
rem runs all builds

rem locate MSVC 2017 on the system

set MSVC2017_COMPILER_INST=notfound
rem VS 2017 sets exactly one install as the "main" install, so we may find MSBuild in there.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\SxS\VS7" /v 15.0 /reg:32 >nul 2>nul
if NOT ERRORLEVEL 1 (
  for /F "tokens=1,2*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\SxS\VS7" /v 15.0 /reg:32') DO (
    if "%%i"=="15.0" (
      if exist "%%k\VC\Auxiliary\Build" (
        set "MSVC2017_COMPILER_INST=%%k\VC\Auxiliary\Build"
        set "msg=Found MSVC installation at !MSVC2017_COMPILER_INST!"
        echo !msg!
      )
    )
  )
)

rem alternative way (VS2019)
if "%MSVC2017_COMPILER_INST%" == "notfound" (
  set vs_path=notfound
  for /f "delims=" %%i in ('"c:\program files (x86)\microsoft visual studio\installer\vswhere" -latest -prerelease -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath -products *') do (
    set "vs_path=%%i"
  )
  if not "vs_path" == "notfound" (
    set "MSVC2017_COMPILER_INST=!vs_path!\vc\Auxiliary\Build"
  )
)

if "%MSVC2017_COMPILER_INST%" == "notfound" (
  echo ERROR: Unable to find MSVC 2017 installation
  goto :eof
)

rem ----------------------------------------------------------
rem check for cmake in PATH

where cmake >nul 2>nul
if ERRORLEVEL 1 (
  echo ERROR: Unable to find cmake.exe in PATH
  goto :eof
)

rem ----------------------------------------------------------
rem check for nasm in PATH

where nasm >nul 2>nul
if ERRORLEVEL 1 (
  echo ERROR: Unable to find nasm.exe in PATH
  goto :eof
)

rem ----------------------------------------------------------
rem check for perl in PATH

where perl >nul 2>nul
if ERRORLEVEL 1 (
  echo ERROR: Unable to find perl.exe in PATH
  goto :eof
)

rem ----------------------------------------------------------
rem check for ruby in inst_path
rem ruby build also needs bison, sed in PATH

where ruby >nul 2>nul
if ERRORLEVEL 1 (
  echo ERROR: Unable to find ruby.exe in PATH
  goto :eof
)

where bison >nul 2>nul
if ERRORLEVEL 1 (
  echo ERROR: Unable to find bison.exe in PATH
  goto :eof
)

where sed >nul 2>nul
if ERRORLEVEL 1 (
  echo ERROR: Unable to find sed.exe in PATH
  goto :eof
)

rem ----------------------------------------------------------
rem runs the builds

if not exist %dest_dir% mkdir %dest_dir%

rd /s /q %TEMP%\klayout-bits
mkdir %TEMP%\klayout-bits

set inst_path=%~dp0
set kit=msvc2017

if defined option-32 (
  call %inst_path%build.bat x86 %kit% %dest_dir%
)
if defined option-64 (
  call %inst_path%build.bat x64 %kit% %dest_dir%
)

