
call "%MSVC2017_COMPILER_INST%\vcvars64"
set CURL_BUILD_PLATFORM=x64
%~dp0build_any.bat %1
