
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars32" -vcvars_ver=14.1
%~dp0build_any.bat %1

endlocal
