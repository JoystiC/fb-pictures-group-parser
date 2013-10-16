#!/bin/bash
# ziskani poctu lajku a komentaru
url="https://graph.facebook.com/?ids=https://www.facebook.com/photo.php?fbid="
url_likes_start="https://graph.facebook.com/"
url_likes_end="/likes?limit=100"
touch likes
touch likes_url
touch comments
while read data; do
	curl $url$data > comments_url
	curl $url_likes_start$data$url_likes_end > likes_url
	grep -o "name" likes_url | wc -l >> likes
	grep -o "\"message\"" comments_url | wc -l >> comments
done < ids






 


