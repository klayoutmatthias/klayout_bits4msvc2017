
# Purpose

This set of scripts will build the requisites for KLayout builds with
MSVC 2017, both for 32 and 64bit. These are:

  * libexpat: XML parser for use with Python standalone modules
  * libcurl: HTTP/HTTPS access for Python standalone tools
  * zlib: Compression library
  * python: A basic installation including a debug variant
  * ruby: Basic Ruby required to support DRC and other DSL's
  * openssl: Support for HTTPS


# Requirements

  * git installed in PATH
  * MSVC 2017 installed (e.g. community edition). Or MSVC2019 with compiler 14.1.
  * Helper tools:
    (1) ruby.exe, bison.exe, flex.exe, sed.exe in PATH
    (2) cmake.exe in PATH
    (3) perl (for OpenSSL, Windows version)
    (4) nasm (for OpenSSL)
    (5) host Python (for Python)

For (1) use MSYS2:
  * ```install "pacman -S ruby bison flex sed"```
  * ```set PATH=c:\msys64\usr\bin;%PATH%```

For (2) use cmake for Windows: https://cmake.org/files/v3.12/cmake-3.12.1-win64-x64.msi
  * ```set "PATH=c:\Program Files\cmake\bin;%PATH%"```

For (3) use Strawberry Perl from http://strawberryperl.com
  * ```set "PATH=c:\strawberry\perl\bin;%PATH%"```

For (4) use NASM from https://www.nasm.us
  * ```set "PATH=c:\Program Files\NASM;%PATH%"```

For (5) use Anaconda3 from https://repo.anaconda.com/archive/Anaconda3-2021.05-Windows-x86_64.exe
  * ```set anaconda=c:\ProgramData\Anaconda3```
  * ```set "PATH=%anaconda%;%anaconda%\Library\mingw-w64\bin;%anaconda%\Library\usr\bin;%anaconda%\Library\bin;%anaconda%\Scripts;%anaconda%\bin;%PATH%"```

Note: cmake and perl must be taken from the Windows installation! Make sure they are in the path before MSYS2 components.


# Script Usage

Set TEMP environment variable to a suitable build directory.

To build all:

  ```buildall.bat -t <installation dir>```

To build 32 bit only:

  ```buildall.bat -32 ...```
