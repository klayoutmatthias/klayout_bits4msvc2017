
setlocal

set instdir=%1

set git_url=https://github.com/python/cpython.git
set tag=v3.6.6

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

cd PCBuild
call build.bat -c Release -p %PYTHON_BUILD_PLATFORM% -e -t Rebuild

mkdir %instdir%\libraries
mkdir %instdir%\lib
mkdir %instdir%\bin
mkdir %instdir%\include

xcopy %PYTHON_BUILD_SUBDIR%\python*.lib %instdir%\libraries
xcopy %PYTHON_BUILD_SUBDIR%\*.pdb %instdir%\bin
xcopy %PYTHON_BUILD_SUBDIR%\*.pyd %instdir%\bin
xcopy %PYTHON_BUILD_SUBDIR%\*.exe %instdir%\bin
xcopy %PYTHON_BUILD_SUBDIR%\*.dll %instdir%\bin
xcopy ..\Include\* %instdir%\include
xcopy ..\PC\pyconfig.h %instdir%\include
xcopy /e ..\lib\* %instdir%\lib

rd /s /q %PYTHON_BUILD_SUBDIR%
call build.bat -c Debug -p %PYTHON_BUILD_PLATFORM% -e -t Rebuild

xcopy %PYTHON_BUILD_SUBDIR%\python*.lib %instdir%\libraries
xcopy %PYTHON_BUILD_SUBDIR%\*.pdb %instdir%\bin
xcopy %PYTHON_BUILD_SUBDIR%\*.pyd %instdir%\bin
xcopy %PYTHON_BUILD_SUBDIR%\*.exe %instdir%\bin
xcopy %PYTHON_BUILD_SUBDIR%\*.dll %instdir%\bin

endlocal
