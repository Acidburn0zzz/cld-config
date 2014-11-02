#! /bin/bash

# On se positionne au bon endroit"
path=`dirname $0`
cd "$path"

# On défini les variables
#gitrepo="git@github.com:aaaaadrien/cld-config.git"
package="etc/portage/package."
jour=$(date +"%d-%m-%Y")
heure=$(date +"%H:%M:%S")

# Début du script

for fic in "use" "keywords" "mask" "unmask"
do
	chemin="etc/portage/package.$fic/"
	if [ -f "/$chemin/custom" ]
	then
		echo "On sauvegarde le fichier package.$fic ..."
		
		if [ -d $chemin ]
		then
			cp "/$chemin/custom" "$chemin/custom"
		else
			mkdir -p "$chemin"
			cp "/$chemin/custom" "$chemin/custom"
		fi
	fi
done

git add *
git commit -m "Mise à jour de la configutaion le $jour à $heure"
git push origin master
