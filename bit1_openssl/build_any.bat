
setlocal

set instdir=%1

set git_url=https://github.com/openssl/openssl.git
set tag=OpenSSL_1_1_1k

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

perl Configure %OPENSSL_BUILD_PLATFORM% --prefix=%instdir% enable-static-engine
nmake -f makefile 
nmake -f makefile install

endlocal
