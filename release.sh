#!/bin/bash

./build.sh

# A hack, because beebasm doesn't allow string variables
BUILD=`grep -i EQUS src/BUILD.asm | cut -d\" -f2`

mkdir -p releases

release=releases/adfs_${BUILD}_$(date +"%Y%m%d_%H%M").zip
cd build
zip -qr ../${release} *
cd ..
unzip -l ${release}
