
setlocal EnableDelayedExpansion

call "%MSVC2017_COMPILER_INST%\vcvars32"
set PYTHON_BUILD_PLATFORM=Win32
set PYTHON_BUILD_SUBDIR=win32
%~dp0build_any.bat %1

endlocal
