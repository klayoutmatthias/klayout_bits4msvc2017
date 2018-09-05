
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars32"
set EXPAT_BUILD_PLATFORM=Win32
%~dp0build_any.bat %1

endlocal
