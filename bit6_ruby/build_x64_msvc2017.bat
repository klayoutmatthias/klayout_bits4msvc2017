
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars64" -vcvars_ver=14.1
set "RUBY_BUILD_TARGET=--target=x64-mswin64"
%~dp0build_any.bat %1

endlocal
