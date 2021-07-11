
setlocal

set instdir=%1

set git_url=https://github.com/madler/zlib.git
set tag=v1.2.11

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

nmake /f win32\Makefile.msc

mkdir %instdir%\lib
mkdir %instdir%\bin
mkdir %instdir%\include
xcopy /y zlib*.lib %instdir%\lib
xcopy /y zdll*.lib %instdir%\lib
xcopy /y zlib*.pdb %instdir%\bin
xcopy /y zlib*.dll %instdir%\bin
xcopy /y zlib.h %instdir%\include
xcopy /y zconf.h %instdir%\include

endlocal
