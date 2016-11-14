#!/usr/bin/env bash

VERT="\\033[1;32m"
NORMAL="\\033[0;39m"
ROUGE="\\033[1;31m"
JAUNE="\\033[1;33m"

echo "$JAUNE Installation des la base de données ...$NORMAL"

php bin/console cache:clear -e dev
php bin/console doctrine:database:drop --force --if-exists -e dev
php bin/console doctrine:database:create -e dev
php bin/console doctrine:schema:drop -n --force -e dev
php bin/console doctrine:schema:create -e dev

php bin/console fos:user:create plimsky test@gmail.com test --super-admin

echo "$VERT ____________________________________________________________________ [FAIT] $NORMAL\n"
echo "$JAUNE Vidage du cache et application des permissions sur les répertoires ...$NORMAL"

php bin/console cache:clear -e dev
chmod -R 777 /var/tmp/api/cache/ /var/tmp/api/logs/ app/Resources/

HTTPDUSER=`ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX /var/tmp/
setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX /var/tmp/

echo "$VERT ____________________________________________________________________ [FAIT] $NORMAL\n"