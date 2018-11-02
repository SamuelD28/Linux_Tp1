#Fonction s'occupant de transferer tout le mail dans les
# dossiers appropriés.

source $HOME/workspace/Tp1/scripts/utilitaire/verificationFichierExiste.sh
source $HOME/workspace/Tp1/scripts/generer/genererNomCompanie.sh
source $HOME/workspace/Tp1/scripts/generer/genererNomDossier.sh
source $HOME/workspace/Tp1/scripts/generer/genererNomFichier.sh
source $HOME/workspace/Tp1/scripts/log/ajouterLogValide.sh
source $HOME/workspace/Tp1/scripts/log/ajouterLogInvalide.sh

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