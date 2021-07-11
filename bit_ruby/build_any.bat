
setlocal

set instdir=%1

set git_url=https://github.com/ruby/ruby.git
set tag=v2_7_4

echo "Checking out sources ..."

git clone %git_url% sources
cd sources
git checkout --detach tags/%tag%

call win32\configure --prefix=%instdir% %RUBY_BUILD_TARGET%
nmake
nmake install

endlocal
