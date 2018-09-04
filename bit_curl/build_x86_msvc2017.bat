
call "%MSVC2017_COMPILER_INST%\vcvars32"
set CURL_BUILD_PLATFORM=x86
%~dp0build_any.bat %1
