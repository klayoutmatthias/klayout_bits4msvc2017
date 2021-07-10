
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars64" -vcvars_ver=14.1
set CURL_BUILD_PLATFORM=x64
%~dp0build_any.bat %1

endlocal
