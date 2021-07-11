
setlocal

set instdir=%1

set git_url=https://github.com/ruby/ruby.git
set tag=v2_7_4

echo "Checking out sources ..."

set openssl_dir=%instdir%\..\openssl
set zlib_dir=%instdir%\..\zlib

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

set "PATH=%openssl_dir%\bin;%PATH%"

rem configure does not like backslashes, so we convert openssl and zlib dirs using forward slashes
call win32\configure --prefix=%instdir% %RUBY_BUILD_TARGET% --with-openssl-dir=%openssl_dir:\=/% --with-zlib-dir=%zlib_dir:\=/%
nmake
nmake install

endlocal
