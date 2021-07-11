
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars32" -vcvars_ver=14.1
set OPENSSL_BUILD_PLATFORM="VC-WIN32"
set OPENSSL_DO_BAT=do_nasm.bat
%~dp0build_any.bat %1

endlocal
