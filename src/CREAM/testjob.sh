#!/bin/sh

tar -zxf probes.tar.gz

for probe in `cat probe_list`; do
  ./probes/${probe} > ${probe}.out 2>&1
  echo $? > ${probe}.res
  sed -i -e '1s/$/|/g' -e "1s/^/$(hostname): /" -e ':a;N;$!ba;s/\n/\\n/g' ${probe}.out
done

exit 0