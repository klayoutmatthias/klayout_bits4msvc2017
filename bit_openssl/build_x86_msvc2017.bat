
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars32"
set OPENSSL_BUILD_PLATFORM="VC-WIN32"
%~dp0build_any.bat %1

endlocal
