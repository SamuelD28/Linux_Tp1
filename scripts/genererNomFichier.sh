# Fonction générant un nom pour le fichier qui modifiras le nom du fichier
# originale
# retourne un string du nom de fichier
function GenererNomFichier
{
	p_compteur=1
	p_fileName=$(date '+%Y%m%d%H%M')
	p_fileExtension="_${p_compteur}.eml"
	
	# Tant que le fichier existe, on incrément le compteur
	while [ -e $1/$p_fileName$p_fileExtension ]
	do 
		p_compteur=$((p_compteur+1))
		p_fileExtension="_${p_compteur}.eml"
	done
	echo "${p_fileName}${p_fileExtension}"
}
