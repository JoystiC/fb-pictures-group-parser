#!/bin/bash

cat data_s_odkazy | grep -o 'data-starred-src="[\.,:a-žA-Ž0-9\_\/\-]*"' > res

# ziskani celkovych odkazu na fotky a id
touch links
while read data; do
	if grep -Fxq "$data" links; then
		continue
	else
		echo "$data" >> links
	fi
done < res

# ziskani odkazu na fotky
touch links_photos
while read data; do
	echo $data | cut -d "\"" -f 2 >> links_photos
done < links

# ziskani IDs
touch ids
while read data; do
	echo $data | cut -d '_' -f 2 >> ids
done < links