
call "%MSVC2017_COMPILER_INST%\vcvars32"
set RUBY_BUILD_TARGET=
%~dp0build_any.bat %1
