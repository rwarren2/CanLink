#!/bin/bash
#
#
echo "Trying to load [$1] in [$0]." >> /tmp/crap
source /home/ubuntu/passWords.sh
mv -f $1 /home/www-data/ingest/.
MYFILE=`echo $1 | rev | cut -d "/" -f 1 | rev`
echo "ld_dir('/home/www-data/ingest', '${MYFILE}','http://canlink.library.ualberta.ca/canlinkmaindataset');" | isql -U dba -P "${VIRTUOSO_PASSWORD}"
echo "rdf_loader_run();"  | isql -U dba -P "${VIRTUOSO_PASSWORD}"
