function GenererNomCompany
{
	p_company=$(echo $1 | egrep -o "<\w*@\w*\.com>")
	p_companyLenght=$(( ${#p_company} - 2 ))
	echo "${p_company:1:p_companyLenght}"
}