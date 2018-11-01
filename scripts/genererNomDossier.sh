function GenererNomDossier
{
	p_nomDossier=$(echo "$1" | egrep -o "^\"(\w|\s)*\"")
	p_nomDossier=${p_nomDossier//' '/_}
	p_dossierLenght=$(( ${#p_nomDossier} - 2 ))
	echo "${p_nomDossier:1:p_dossierLenght}"
}
