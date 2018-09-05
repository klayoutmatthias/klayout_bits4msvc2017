
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars64"
%~dp0build_any.bat %1

endlocal
