BEGIN { print "Date               Courriel                                      De" }

{ 
	if ($5 == courriel)
	{
		
		if ($8 == "OK")
		{
		   print $1 " " $2 " " $3 " " $7
		}
	}
}

END { }
