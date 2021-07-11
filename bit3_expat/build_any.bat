
setlocal

set instdir=%1

set git_url=https://github.com/libexpat/libexpat.git
set tag=R_2_2_6

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

cd expat
rem v141 is for MSVC 2017 (v142 for MSVC 2019)
cmake -DCMAKE_GENERATOR_PLATFORM=%EXPAT_BUILD_PLATFORM% -T v141 .
msbuild expat.sln /p:Configuration=Release /p:Platform=%EXPAT_BUILD_PLATFORM%

mkdir %instdir%\libraries
mkdir %instdir%\bin
mkdir %instdir%\include

xcopy /y Release\*.lib %instdir%\libraries
xcopy /y Release\*.dll %instdir%\bin
xcopy /y lib\expat*.h %instdir%\include

endlocal
