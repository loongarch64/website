#!/usr/bin/env bash

verlte() {
    [  "$1" = "`echo -e "$1\n$2" | sort -V | head -n1`" ]
}

ver=`hugo version|awk '{print $2}'`
version=${ver#v*}

if verlte 0.7 $version ; then
  hugo --printI18nWarnings --disableFastRender --ignoreCache server
else
  hugo --i18n-warnings --disableFastRender --ignoreCache server
fi
