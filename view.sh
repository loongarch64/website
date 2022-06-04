#!/usr/bin/bash

ver=`hugo version|awk '{print $2}'`
version=${ver#v*}
result=`vercmp $version 0.7`

if [ $result -gt 0 ]; then
  hugo --printI18nWarnings --disableFastRender --ignoreCache server
else
  hugo --i18n-warnings --disableFastRender --ignoreCache server
fi
