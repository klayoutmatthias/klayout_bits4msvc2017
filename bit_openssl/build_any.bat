
setlocal

set instdir=%1

set git_url=https://github.com/openssl/openssl.git
set tag=OpenSSL_1_0_2u

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

perl Configure %OPENSSL_BUILD_PLATFORM% --prefix=%instdir%
call ms\do_nasm.bat
nmake -f ms\ntdll.mak
nmake -f ms\ntdll.mak install

endlocal
