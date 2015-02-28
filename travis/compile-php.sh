#!/bin/bash
export CCASFLAGS="-m$phpint"
export CPPFLAGS="-m$phpint"
export LDFLAGS="-m$phpint"

if [ -n "$phplfs" ]
then
  export CFLAGS="-m$phpint -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
else
  export CFLAGS="-m$phpint"
fi

curl -L "http://php.net/get/php-$phpver.tar.bz2/from/this/mirror" | tar xj
pushd "php-$phpver"
./configure \
  --without-pear \
  --with-curl
make
popd
