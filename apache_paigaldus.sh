# apache paigasdusskript
#
# kontrollime, mitu korda apache2 korral ok installed
# sõnad on leitud ja vastus salvestame
# muutuja sisse:
APACHE2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')
# kui APACHE2 muutuja väärtus  võrdub 0-ga
if [ $APACHE2 -eq 0 ]; then
	#siis ok intalled ei ole leitud
	#ja väljastame vastav teade ning
	#paigaldame teenus
	echo "Paigaldame apache2"
	apt install apache2
	echo "Apache2 on paigaldatud"
# kui APACHE2 muutuja väärtus võrdu 1-ga
elif [ $APACHE2 -eq 1 ]; then
	# siis on installed on leitud  kord
	# ja teenud on juba paigaldatud
	echo "apache2 on juba paigandatud"
	# stardime selle ja näitame staatust
	service apache2 start
	service apache2 status
# lõpetame tingimuslause
fi
# Kui skript Apache installeerimiseks on valmis, siis täidame skripti edasi, et te kohe,
# peale Apache paigaldamist redigeerika. Ja et veebiserveri lehekülje pealkiri oleks sinu pärane:
sed -i "s/Apache2 Debian Default Page/Kristjan Debian Default Page/g" /var/www/html/index.html
# skripti lõpp
