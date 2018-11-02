function AjouterLogValide
{
	logValide="[$dt] $1/$2/$3 : $1 -> $4 OK" 
	echo "$logValide" >> ./courriels.log
}