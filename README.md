
# Purpose

This set of scripts will build the requisites for KLayout builds with
MSVC 2017, both for 32 and 64bit. These are:

  * libexpat: XML parser for use with Python standalone modules
  * libcurl: HTTP/HTTPS access for Python standalone tools
  * zlib: Compression library
  * python: A basic installation including a debug variant
  * ruby: Basic Ruby required to support DRC and other DSL's


# Requirements

  * git installed in PATH
  * MSVC 2017 installed (e.g. community edition)
  * Helper tools:
    (1) cmake.exe in PATH
    (2) ruby.exe, bison.exe, flex.exe, sed.exe in PATH

For (1) use cmake for Windows: https://cmake.org/files/v3.12/cmake-3.12.1-win64-x64.msi

For (2) use MSYS2:
  * install "pacman -S ruby bison flex sed"
  * set PATH=c:\msys64\usr\bin;%PATH%

Note: cmake must be taken from the Windows installation!


# Script Usage

To build all:

  `buildall.bat -t <installation dir>`

To build 32 bit only:

  `buildall.bat -p 32 ...`

To build "microbit" only (curl, expat, ptw, and zlib, but not python nor ruby):

  `buildall.bat -only micro`

# Latest release downloads:

microbits:
[ ![Download](https://api.bintray.com/packages/lightwave-lab/klayout/klayout-microbits/images/download.svg) ](https://bintray.com/lightwave-lab/klayout/klayout-microbits/_latestVersion)
