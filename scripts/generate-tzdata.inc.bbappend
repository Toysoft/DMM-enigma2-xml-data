#!/bin/sh

if [ -z "$1" ]; then
	echo "usage: $0 <filename>"
	exit 1
fi

TIMEZONEXML="$1"

printf 'FILES_${PN}_opendreambox = "                             \\\n'

for ZONE in `grep '<zone .*/>' $TIMEZONEXML | sed -e 's,.*zone="\(.*\)".*,\1,' | sort -u`; do
	printf "                %-40s \\\\\n" \${datadir}/zoneinfo/$ZONE
done

printf '                %-40s \\\n' \${sysconfdir}/localtime
printf '                %-40s "\n' \${sysconfdir}/timezone

