
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars64" -vcvars_ver=14.1
set PNG_BUILD_PLATFORM=x64
%~dp0build_any.bat %1

endlocal
