function GenererNomFichier
{
	p_compteur=1
	p_fileName=$(date '+%Y%m%d%H%M')
	p_fileExtension="_${p_compteur}.eml"
	
	while [ -e $1/$p_fileName$p_fileExtension ]
	do 
		p_compteur=$((p_compteur+1))
		p_fileExtension="_${p_compteur}.eml"
	done
	echo "${p_fileName}${p_fileExtension}"
}
