#!/bin/bash -e

syntax() {

  echo "Create klayout-bits zip files"
  echo ""
  echo "Synopsis:"
  echo "  mkzip.sh <version> <build-dir>"
  echo ""
  echo "Example:"
  echo "  mkzip.sh 3.0 /c/jenkins/build-klayout-bits/INSTALL"
  echo ""
  echo "This script creates two zip files:"
  echo "  * klayout-bits-<version>.zip          Full package"
  echo "  * klayout-microbits-<version>.zip     Reduces package for building PyPI packages"
  exit 0
}

version=
build=

for a in $*; do
  case $a in
  -h)
    syntax
    ;;
  -*)
    echo "*** ERROR: unknown option $a"
    exit 1
    ;;
  *)
    if [ "$version" = "" ]; then
      version="$a"
    elif [ "$build" = "" ]; then
      build="$a"
    else
      echo "*** ERROR: too many arguments (see -h for details)"
      exit 1
    fi
  esac
done

if [ "$version" = "" ]; then
  echo "*** ERROR: missing version (see -h for details)"
  exit 1
fi

if [ "$build" = "" ]; then
  echo "*** ERROR: missing build directory (see -h for details)"
  exit 1
fi

if ! [ -e $build ]; then
  echo "*** ERROR: build path $build does not exist!"
  exit 1
fi

build=$(realpath $build)

if ! [ -e "$build/msvc2017" ]; then
  echo "*** ERROR: $build does not seem to be an installation directory for klayout-bit packages"
  exit 1
fi

echo "Creating:"
echo "  klayout-bits-$version.zip"
echo "  klayout-microbits-$version.zip"
echo "from $build"
echo ""

out=$(pwd)

tmp=.tmp
rm -rf $tmp
mkdir $tmp
cd $tmp

dest=klayout-bits-$version
destm=klayout-microbits-$version

rm -rf $out/$dest.zip $out/$destm.zip

mkdir $dest
echo "Copying files ..."
cp -R $build/msvc* $dest
echo "Creating $dest.zip archive ..."
zip -r $out/$dest.zip $dest

mv $dest $destm
echo "Removing unused packages ..."
for rm in openssl ruby python; do
  echo "  Removing $rm"
  rm -rf $destm/msvc*/*/$rm
done
echo "Creating $destm.zip archive ..."
zip -r $out/$destm.zip $destm

echo "Cleaning up ..."
rm -rf $destm

cd ..

echo "Created:"
echo "  $dest.zip"
echo "  $destm.zip"
echo "Done."

