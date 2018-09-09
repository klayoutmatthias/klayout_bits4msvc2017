
setlocal

set instdir=%1

set git_url=https://github.com/vancegroup-mirrors/pthreads-win32.git
set tag=v-2-9-1-release

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

git apply %KLAYOUT_BITS_INST_PATH%\bit_ptw\patch
nmake /f Makefile clean VCE

mkdir %instdir%\libraries
mkdir %instdir%\bin
mkdir %instdir%\include
xcopy pthread*.lib %instdir%\libraries
xcopy pthread*.dll %instdir%\bin
xcopy pthread*.pdb %instdir%\bin
xcopy *.h %instdir%\include

endlocal
