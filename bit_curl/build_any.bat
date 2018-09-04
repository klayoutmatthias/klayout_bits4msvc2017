
setlocal

set instdir=%1

set git_url=https://github.com/curl/curl.git
set tag=curl-7_61_0

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

call buildconf.bat
cd winbuild
nmake /f Makefile.vc mode=dll MACHINE=%CURL_BUILD_PLATFORM%
cd ..

mkdir %instdir%\libraries
mkdir %instdir%\bin
mkdir %instdir%\include

xcopy builds\libcurl-vc-%CURL_BUILD_PLATFORM%-release-dll-ipv6-sspi-winssl\bin\* %instdir%\bin
xcopy builds\libcurl-vc-%CURL_BUILD_PLATFORM%-release-dll-ipv6-sspi-winssl-obj-lib\*.lib %instdir%\libraries
xcopy include\curl\*.h %instdir%\include

endlocal
