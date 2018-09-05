
setlocal

set instdir=%1

set git_url=https://github.com/madler/zlib.git
set tag=v1.2.11

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

nmake /f win32\Makefile.msc

mkdir %instdir%\libraries
mkdir %instdir%\bin
mkdir %instdir%\include
xcopy zlib*.lib %instdir%\libraries
xcopy zdll*.lib %instdir%\libraries
xcopy zlib*.pdb %instdir%\bin
xcopy zlib*.dll %instdir%\bin
xcopy zlib.h %instdir%\include
xcopy zconf.h %instdir%\include

endlocal
