#!/bin/bash

set -o nounset
set -o errexit

readonly prog_name=$(basename $0)
readonly prog_dir=$(dirname $0)
readonly args="$@"

cd $prog_dir/..

rm -rf build
mkdir build

cp -r osx-installer/InstallMedicalSpellChecker build/

# OS X requires a UFT-8 dictionary.
iconv -f UTF-16LE -t UTF-8 US-English-Medical-Dictionary.dic > build/InstallMedicalSpellChecker/scripts/dictionary

chmod a+x build/InstallMedicalSpellChecker/scripts/postinstall

pkgbuild \
	--nopayload \
	--scripts build/InstallMedicalSpellChecker/scripts \
	--identifier com.calumjeadie.medical-spell-checker \
	'build/Install Medical Spell Checker.pkg'