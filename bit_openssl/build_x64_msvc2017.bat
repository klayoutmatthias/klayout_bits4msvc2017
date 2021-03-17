
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars64"
set OPENSSL_BUILD_PLATFORM="VC-WIN64A"
%~dp0build_any.bat %1

endlocal
