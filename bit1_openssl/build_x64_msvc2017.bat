
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars64" -vcvars_ver=14.1
set OPENSSL_BUILD_PLATFORM="VC-WIN64A"
set OPENSSL_DO_BAT=do_win64a.bat
%~dp0build_any.bat %1

endlocal
