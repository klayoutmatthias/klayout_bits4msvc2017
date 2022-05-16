
setlocal

set instdir=%1

set git_url=https://github.com/glennrp/libpng.git
set tag=v1.6.37

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

rem point to zlib so cmake can detect it
set PATH=%instdir%\..\zlib\bin;%PATH%

cd expat
rem v141 is for MSVC 2017 (v142 for MSVC 2019)
cmake -DCMAKE_GENERATOR_PLATFORM=%PNG_BUILD_PLATFORM% -T v141 .
msbuild libpng.sln /p:Configuration=Release /p:Platform=%PNG_BUILD_PLATFORM%

mkdir %instdir%\libraries
mkdir %instdir%\bin
mkdir %instdir%\include

xcopy /y Release\*.lib %instdir%\libraries
xcopy /y Release\*.dll %instdir%\bin
xcopy /y Release\*.exe %instdir%\bin
xcopy /y png*.h %instdir%\include

endlocal
