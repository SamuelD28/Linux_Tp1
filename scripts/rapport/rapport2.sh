{
    if (NF == 8)
    {
        auteurs[$5] = 0;
        auteurs[$7] = 0;
        envoyes[$5]++;
        recus[$7]++;
    }
        
}
END{
    for (auteur in auteurs)
    {
        nbEnvoyes = auteurs[auteur] + envoyes[auteur];
        nbRecus   = auteurs[auteur] + recus[auteur];
        print auteur " | envoyés : " nbEnvoyes " recu : " nbRecus
    }
}