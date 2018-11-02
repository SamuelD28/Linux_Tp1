# Fonction s'occupant de d'afficher la validation dans la console

source $HOME/workspace/Tp1/scripts/extraire/extraireNomChamp.sh

function AfficherVerificationChamps
{
	# Format utilisés pour un message valide ou invalide
	p_formatValid="\e[92m%-22s%s\e[39m\n"
	p_formatInvalid="\e[31m%-22s%s\e[39m\n"
	
	echo -e "\e[96m\n~~~~~~~~$fichier~~~~~~~~\e[39m";
	
	# On ittère à travers tout les champs de notre array pour verifier si une valeur correspond à 0
	# qui indique que la vérification à échoué
	for i in ${!champs[*]}
	do 
		p_nomChamp=$(ExtraireNomChamp $i)
		if [ "${champs[$i]}" == "0" ]
			then
				printf "$p_formatInvalid" $p_nomChamp "Invalide"
				isValid=0 # Valid devient False
			else
				printf "$p_formatValid" $p_nomChamp  "Valide"
		fi
	done
	
	echo -e "\e[96m////////////////////////////\e[39m";
}