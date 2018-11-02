# Fonction utilitaire qui vérifie un champ avec un regex
# $1 champ à vérifié
# $2 regex à comparé
# retourne 1 pour true et 0 pour false
function VerificationRegexChamp
{
	if [[ $1 =~ $2 ]]
		then
			return 1 #Retourne 1 pour True
		else
			return 0 #Retourne 0 pour false
	fi
}
