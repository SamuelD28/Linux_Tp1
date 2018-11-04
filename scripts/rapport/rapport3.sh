BEGIN { print "Date              Courriel                                      À                    De" }

{
gsub(/\[/,"",$1)

	if ($dt >= date1 && $dt <= date2)
	{
		
		if ($8 == "OK")
		{
		   print $1 " " $2 " " $3 " " $5 " " $7
		}
	}
}

END { }
