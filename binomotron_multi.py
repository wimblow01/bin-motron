import mysql.connector as mysqlpyth
import datetime
from random import sample, shuffle


# connexion bdd

conn = mysqlpyth.connect(
    host="localhost",
    port="8081",
    user="root", 
    password="root", 
    database="binome")

#créer un curseur de base de données pour effectuer des opérations SQL
cur = conn.cursor()

# définition de la date du jour
date = datetime.date.today()

# création des listes
liste_apprenant = []
liste_binome = []

# importe les valeurs de la bdd
cur.execute("SELECT id_apprenant FROM apprenant")

#récupérer toutes les lignes de la dernière instruction exécutée.
res = cur.fetchall()
for row in res:
  id_p = row[0]
  liste_apprenant.append(id_p)

# renseignement de la taille des groupes
longueur_groupe = int(input("Renseigner le nombre de personnes dans le groupe : "))

# boucle de création des binomes
longueur_liste = len(liste_apprenant)
while longueur_liste>0:
    if longueur_liste>=longueur_groupe:
        binome = sample(liste_apprenant, longueur_groupe)
        liste_apprenant = [name for name in liste_apprenant if name not in binome]
        longueur_liste -= longueur_groupe

        print(binome)
    else:
        longueur_liste = 0
        binome = (liste_apprenant)
        print(binome)

    liste_binome.append(binome)

# mise en ordre des valeurs des binomes
for i in range (len(liste_binome)) :
  for e in range (len(liste_binome[i])) :

    #exécuter le curseur avec la méthode execute() et transmet la requête SQL
    cur.execute("INSERT INTO apprenant_groupe_projet VALUES (%s,%s,%s)", (liste_binome[i][e], i+1, date))
    
    # print(liste_binome[i][e])
    # print(i)

# archivage des données
conn.commit()