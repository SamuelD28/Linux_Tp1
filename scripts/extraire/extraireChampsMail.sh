# Fonction s'occupant de créer un array avec touts les champs nécéssaires
# pour le traitement des données
# $1 chemin vers le fichier

source $HOME/workspace/Tp1/scripts/extraire/extraireChampMail.sh

function ExtraireChampsMail
{
	p_champs=()
	
	auteur=$(ExtraireChampMail "auteur" $regexNomCourriel $1)
	date=$(ExtraireChampMail "date" $regexDate $1)
	sujet=$(ExtraireChampMail "sujet" $regexSujet $1)
	destinataire=$(ExtraireChampMail "destinataire" $regexNomCourriel $1)
	message=$(ExtraireChampMail "message" $regexMessage $1)
	
	champs[0]="$auteur"; 
	champs[1]="$date";
	champs[2]="$sujet";
	champs[3]="$destinataire";
	champs[4]="$message";
}