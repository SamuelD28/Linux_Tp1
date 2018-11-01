function ExtraireChampMail
{
	colone=0
	case $1 in
	    auteur) colone=1;;
	    date) colone=2 ;;
	    sujet) colone=3 ;; 
	    destinataire) colone=4 ;;
	    message) colone=5 ;;
		*) colone=-1;;
	esac
	champ=$(cut -f$colone -d ';' $directoryATraiter/$fichier)
	
	#Methodes permettant de verifier que l'information recu correspond aux criteres
	VerificationRegexChamp "$champ" $2  #2 correspond au regex
	if [ $? -eq 0 ]
		then
			echo $? #Si la verification a echouer, on retourne 0
		else
			echo "$champ" #Si la verification a reussi, on retourn le champ
	fi
}