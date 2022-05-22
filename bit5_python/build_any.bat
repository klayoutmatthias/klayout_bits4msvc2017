
setlocal

set instdir=%1

set git_url=https://github.com/python/cpython.git
set tag=v3.9.13

rem MSVC 2017:
set vctools_ver=v141

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

cd PCBuild

rem skip debug part
goto release

:debug
rem build debug version
call build.bat -e -c Debug -p %PYTHON_BUILD_PLATFORM% "/p:PlatformToolset=%vctools_ver%"

mkdir %instdir%\libs
mkdir %instdir%\lib
mkdir %instdir%\bin
mkdir %instdir%\include

xcopy /i /y %PYTHON_BUILD_SUBDIR%\python*.lib %instdir%\libs
xcopy /i /y %PYTHON_BUILD_SUBDIR%\*.pdb %instdir%\bin
xcopy /i /y %PYTHON_BUILD_SUBDIR%\*.pyd %instdir%\bin
xcopy /i /y %PYTHON_BUILD_SUBDIR%\*.exe %instdir%\bin
xcopy /i /y %PYTHON_BUILD_SUBDIR%\*.dll %instdir%\bin

rd /s /q %PYTHON_BUILD_SUBDIR%

:release
rem build release version
call build.bat -e -c Release -p %PYTHON_BUILD_PLATFORM% "/p:PlatformToolset=%vctools_ver%"

xcopy /i /y %PYTHON_BUILD_SUBDIR%\python*.lib %instdir%\libs
xcopy /i /y %PYTHON_BUILD_SUBDIR%\*.pdb %instdir%\bin
xcopy /i /y %PYTHON_BUILD_SUBDIR%\*.pyd %instdir%\bin
xcopy /i /y %PYTHON_BUILD_SUBDIR%\*.exe %instdir%\bin
xcopy /i /y %PYTHON_BUILD_SUBDIR%\*.dll %instdir%\bin

xcopy /i /y /s ..\Include\* %instdir%\include
xcopy /i /y ..\PC\pyconfig.h %instdir%\include
xcopy /i /y /e ..\lib\* %instdir%\lib

endlocal
