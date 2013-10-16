#!/bin/bash
# vytvory html soubor pro prohlizeni dat
id_link="https://www.facebook.com/photo.php?fbid="
while read data; do
	url=`echo $data | cut -d " " -f 1`
	echo "<img src=\""$url"\"/>" >> index.html
	comment=`echo $data | cut -d " " -f 2`
	echo "<p>Pocet komentaru: "$comment"</p>" >> index.html
	id=`echo $data | cut -d " " -f 3`
	echo "<a href=\""$id_link$id"\">odkaz</a>" >> index.html
	count=`echo $data | cut -d " " -f 4`
	echo "<p>Pocet lajku: "$count"</p>" >> index.html
	echo "<br>" >> index.html
done < end_data