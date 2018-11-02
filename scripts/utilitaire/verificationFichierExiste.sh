# Fontion utilitaire qui verifie si un dossier existe deja
# $1 chemin vers le dossier
function VerifierDossierExiste
{
	if [ ! -d $1 ]
		then
		$(mkdir $1)
	fi
}
