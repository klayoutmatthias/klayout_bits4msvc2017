
setlocal

set instdir=%1

set git_url=https://github.com/python/cpython.git
set tag=v3.9.2

rem MSVC 2017:
set vctools_ver=v141

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

cd PCBuild
call build.bat -c Debug -p %PYTHON_BUILD_PLATFORM% -e -t Rebuild "/p:PlatformToolset=%vctools_ver%"

mkdir %instdir%\libs
mkdir %instdir%\lib
mkdir %instdir%\bin
mkdir %instdir%\include

xcopy /y %PYTHON_BUILD_SUBDIR%\python*.lib %instdir%\libs
xcopy /y %PYTHON_BUILD_SUBDIR%\*.pdb %instdir%\bin
xcopy /y %PYTHON_BUILD_SUBDIR%\*.pyd %instdir%\bin
xcopy /y %PYTHON_BUILD_SUBDIR%\*.exe %instdir%\bin
xcopy /y %PYTHON_BUILD_SUBDIR%\*.dll %instdir%\bin

rd /s /q %PYTHON_BUILD_SUBDIR%
call build.bat -c Release -p %PYTHON_BUILD_PLATFORM% -e -t Rebuild "/p:PlatformToolset=%vctools_ver%"

xcopy /y %PYTHON_BUILD_SUBDIR%\python*.lib %instdir%\libs
xcopy /y %PYTHON_BUILD_SUBDIR%\*.pdb %instdir%\bin
xcopy /y %PYTHON_BUILD_SUBDIR%\*.pyd %instdir%\bin
xcopy /y %PYTHON_BUILD_SUBDIR%\*.exe %instdir%\bin
xcopy /y %PYTHON_BUILD_SUBDIR%\*.dll %instdir%\bin

xcopy /y /s ..\Include\* %instdir%\include
xcopy /y ..\PC\pyconfig.h %instdir%\include
xcopy /y /e ..\lib\* %instdir%\lib

endlocal
