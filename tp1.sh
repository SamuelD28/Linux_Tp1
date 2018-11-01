#!/bin/bash
#Script pur la validation des fichiers

directoryATraiter=$HOME/workspace/Tp1/Àtraiter
directoryTraites=$HOME/workspace/Tp1/Traités
directoryInvalides=$HOME/workspace/Tp1/Invalides

fichiers=$(ls $directoryATraiter)

regexNomCourriel="\"(\w|\s)*\"\s<\w*@\w*\.com>"
regexDate="(Mon|Tue|Wed|Thu|Fri|Sat|Sun),\s([0-9]\s|1[0-9]\s|2[0-9]\s|3[0-1]\s)(Jul|Aug|Sep|Oct|Nov|Dec|Jan|Feb|Mar|Apr|May|Jun)\s(201[89])\s(([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9])"
regexSujet="(\w|\s){3,20}"
regexMessage=".*\S.*"

#a extraire
formatValid="\e[92m%-22s%s\e[39m\n"
formatInvalid="\e[31m%-22s%s\e[39m\n"

dt=$(date '+%Y-%m-%d %H:%M')

source ./scripts/extraireChampMail.sh
source ./scripts/verificationRegexChamp.sh
source ./scripts/verificationFichierExiste.sh
source ./scripts/genererNomFichier.sh
source ./scripts/genererNomDossier.sh
source ./scripts/genererNomCompany.sh

function AjouterLogValide
{
	logValide="[$dt] $1/$2/$3 : $1 -> $4 OK" 
	echo "$logValide" > ./courriels.log
}

function AjouterLogInvalide
{
	logInvalide="[$dt] invalide/$1 : INVALIDE"
	echo "$logInvalide"  > ./courriels.log
}

champs=()


# function ExtraireToutLesChamps
# {
	for fichier in $fichiers
	do
		echo -e "\e[96m\n~~~~~~~~$fichier~~~~~~~~\e[39m";
		
		auteur=$(ExtraireChampMail "auteur" $regexNomCourriel)
		date=$(ExtraireChampMail "date" $regexDate)
		sujet=$(ExtraireChampMail "sujet" $regexSujet)
		destinataire=$(ExtraireChampMail "destinataire" $regexNomCourriel)
		message=$(ExtraireChampMail "message" $regexMessage)
		
		champs[0]=$auteur; 
		champs[1]=$date;
		champs[2]=$sujet;
		champs[3]=$destinataire;
		champs[4]=$message;
		
		echo ${champs[*]}
		
		# if [ $isValid -eq 0 ]
		# 	then
		# 		nomFichier=$(GenererNomFichier $directoryInvalides)
		# 		$(mv $directoryATraiter/$fichier $directoryInvalides/$nomFichier)
	
		# 		AjouterLogInvalide $nomFichier
		# 	else 
		# 		company=$(GenererNomCompany "$auteur")
		# 		VerifierDossierExiste $directoryTraites/$company
				
		# 		nomDossier=$(GenererNomDossier "$auteur")
		# 		VerifierDossierExiste $directoryTraites/$company/$nomDossier
				
		# 		nomFichier=$(GenererNomFichier  $directoryTraites/$company/$nomDossier)
		# 		$(mv $directoryATraiter/$fichier $directoryTraites/$company/$nomDossier/$nomFichier)
	
		# 		AjouterLogValide $nomDossier $nomFichier $auteur $destinataire
		# fi
		
		echo -e "\e[96m////////////////////////////\e[39m";
	done
# }
