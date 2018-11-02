# Fonction générant le nom de la compagnie qui à envoyé le mail
# $1 contient le champ auteur du mail
# retourne un string du nom générer 
function GenererNomCompanie
{
	p_company=$(echo $1 | egrep -o "\w*@\w*\.com")
	p_company=$(echo $p_company | cut -f2 -d '@')
	echo "${p_company}"
}