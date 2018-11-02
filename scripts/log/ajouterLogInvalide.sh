function AjouterLogInvalide
{
	logInvalide="[$dt] invalide/$1 : INVALIDE"
	echo "$logInvalide"  >> ./courriels.log
}