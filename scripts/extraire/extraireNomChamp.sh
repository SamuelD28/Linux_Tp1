# Fonction utilitaire permettant de traduire le numero de colone
# par son nom respectif
# $1
function ExtraireNomChamp
{
	p_nomChamp=""
	case $1 in
	    0) p_nomChamp="Auteur" ;;
	    1) p_nomChamp="Date" ;;
	    2) p_nomChamp="Sujet" ;; 
	    3) p_nomChamp="Destinataire" ;;
	    4) p_nomChamp="Message" ;;
		*) p_nomChamp="Null";;
	esac
	echo "$p_nomChamp"
}