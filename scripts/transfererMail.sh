#Fonction s'occupant de transferer tout le mail dans les
# dossiers appropriés.

directoryTraites=$HOME/workspace/Tp1/Traités
directoryInvalides=$HOME/workspace/Tp1/Invalides

function TransfererMail
{
	if [ $isValid -eq 0 ]
		then
			nomFichier=$(GenererNomFichier $directoryInvalides)
			$(mv $directoryATraiter/$fichier $directoryInvalides/$nomFichier)

			AjouterLogInvalide $p_nomFichier
		else 
			p_nomCompanie=$(GenererNomCompanie "${champs[0]}")
			VerifierDossierExiste $directoryTraites/$p_nomCompanie
			
			p_nomDossier=$(GenererNomDossier "${champs[0]}")
			VerifierDossierExiste $directoryTraites/$p_nomCompanie/$p_nomDossier
			
			p_nomFichier=$(GenererNomFichier  $directoryTraites/$p_nomCompanie/$p_nomDossier)
			$(mv $directoryATraiter/$fichier $directoryTraites/$p_nomCompanie/$p_nomDossier/$p_nomFichier)

			AjouterLogValide $p_nomDossier $p_nomFichier ${champs[0]} ${champs[3]}
	fi
}