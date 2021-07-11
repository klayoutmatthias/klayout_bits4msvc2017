
setlocal

set instdir=%1

set git_url=https://github.com/vancegroup-mirrors/pthreads-win32.git
set tag=v-2-9-1-release

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

git apply %~dp0\patch
nmake /f Makefile clean VCE

mkdir %instdir%\libraries
mkdir %instdir%\bin
mkdir %instdir%\include
xcopy /y pthread*.lib %instdir%\libraries
xcopy /y pthread*.dll %instdir%\bin
xcopy /y pthread*.pdb %instdir%\bin
xcopy /y *.h %instdir%\include

endlocal
