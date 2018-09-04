
setlocal EnableDelayedExpansion

set inst_path=%~dp0
set KLAYOUT_BITS_INST_PATH=%inst_path%

set dest_dir=%3
set arch=%1
set kit=%2

for /d %%b in (%inst_path%bit_*) do (

  echo -----------------------------------------------

  set bit_dir_name=%%~nb
  set bit_name=!bit_dir_name:bit_=!

  if exist %%b\.disabled (

    set "msg=NOT building !bit_name! for %arch% (%kit%) - %%b\.disabled file exists"
    echo !msg!

  ) else (

    set "msg=Building !bit_name! for %arch% (%kit%)"
    echo !msg!
    echo.
    set builddir=%TEMP%\klayout-bits\!bit_name!_%arch%_%kit%
    set "msg=Build dir is !builddir!"
    echo !msg!
    set instdir=%dest_dir%\!bit_name!_%arch%_%kit%
    if exist !builddir! rd /s /q !builddir!
    mkdir !builddir!
    pushd !builddir!
    if exist !instdir! rd /s /q !instdir!
    mkdir !instdir!
    call %%b\build_%arch%_%kit%.bat !instdir!
    popd

    echo Build finished.

  )

)

endlocal
