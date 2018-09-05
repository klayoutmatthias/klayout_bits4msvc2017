
setlocal

set instdir=%1

set git_url=https://github.com/libexpat/libexpat.git
set tag=R_2_2_6

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

cd expat
cmake -DCMAKE_GENERATOR_PLATFORM=%EXPAT_BUILD_PLATFORM% .
msbuild expat.sln /p:Configuration=Release /p:Platform=%EXPAT_BUILD_PLATFORM%

mkdir %instdir%\libraries
mkdir %instdir%\bin
mkdir %instdir%\include

xcopy Release\*.lib %instdir%\libraries
xcopy Release\*.dll %instdir%\bin
xcopy lib\expat*.h %instdir%\include

endlocal
