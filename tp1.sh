#!/bin/bash
#Script pur la validation des fichiers

directoryATraiter=$HOME/workspace/Tp1/Àtraiter

# Date plus le format approprié. Utilisé à travers plusieurs scripts
dt=$(date '+%Y-%m-%d %H:%M')

# Tout les regex utlisés pour le traitement sont utilisés ici
regexNomCourriel="\"(\w|\s)*\"\s<\w*@\w*\.com>"
regexDate="(Mon|Tue|Wed|Thu|Fri|Sat|Sun),\s([0-9]\s|1[0-9]\s|2[0-9]\s|3[0-1]\s)(Jul|Aug|Sep|Oct|Nov|Dec|Jan|Feb|Mar|Apr|May|Jun)\s(201[89])\s(([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9])"
regexSujet="(\w|\s){3,20}"
regexMessage=".*\S.*"

# Importations de toutes les méthodes servant au traitement des fichier mail
source $HOME/workspace/Tp1/scripts/afficherVerificationChamps.sh
source $HOME/workspace/Tp1/scripts/transfererMail.sh
source $HOME/workspace/Tp1/scripts/extraire/extraireChampsMail.sh

# Fonction Principal s'occupant de gerer le traitement des fichiers.
function Main
{
	for fichier in $(ls $directoryATraiter)
	do
		# Le Array champs contient les champs dans l'ordre suivant
		# [0] auteur
		# [1] date
		# [2] sujet
		# [3] destinataire
		# [4] message
		
		# On Extrait tous les champs contenu dans le fichier. champs est d'ordre global ici
		champs=()
		ExtraireChampsMail $directoryATraiter/$fichier
		
		# On affiche les résultats de la validation pour chaque champ dans la console. On change Valid a 0 si une validation a échoué
		isValid=1
		AfficherVerificationChamps 
		
		# On transfère le mail dans le dossier approprié à la fin du traitement
		TransfererMail
	done
}

# Appel à la fonction principal Main. Un peu inutilie mais j'aime une structure propre
Main