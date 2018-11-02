BEGIN { print "Date            Courriel                                 À              De"}
{ 
	if ($5 == courriel)
	{
		if ($7 == "OK")
		{
		   print("$1 $2 $3 $6")
		}
	}

}
END { }