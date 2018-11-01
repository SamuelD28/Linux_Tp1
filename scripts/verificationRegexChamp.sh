function VerificationRegexChamp
{
	if [[ $1 =~ $2 ]]
		then
			return 1 #Retourne 1 pour True
		else
			return 0 #Retourne 0 pour false
	fi
}
