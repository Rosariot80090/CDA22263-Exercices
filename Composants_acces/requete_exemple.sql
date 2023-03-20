--Afficher toutes les informations concernant les employés
SELECT * FROM employe;

--Afficher toutes les informations concernant les départements
SELECT * FROM dept;

--Afficher le nom, la date d'embauche, le numéro du supérieur, 
--le numéro de département et le salaire de tous les employés. 
SELECT nom, dateemb, nosup, nodep,salaire 
FROM employe;

--Afficher le titre de tous les employés avec suppression des doublons. 
SELECT DISTINCT titre 
FROM employe;

--Afficher le nom, le numéro d'employé et le numéro du
--département des employés dont le titre est « Secrétaire ». 
SELECT nom, noemp, nodep, titre 
FROM employe
WHERE titre="secretaire";

--Afficher le nom et le numéro de département dont le numéro de
--département est supérieur à 40.
SELECT nom, nodep
FROM employe
WHERE nodep > 40;

 --Afficher le nom et le prénom des employés dont le nom est
--alphabétiquement antérieur au prénom.
SELECT nom, prenom
FROM employe
WHERE nom<prenom;

--Afficher le nom, le salaire et le numéro du département des employés
--dont le titre est « Représentant », le numéro de département est 35 et
--le salaire est supérieur à 20000.
SELECT nom, salaire, nodep
FROM employe
WHERE titre="representant" AND nodep="35" AND salaire>20000;


--Afficher le nom, le titre et le salaire des employés dont le titre est
--« Représentant » ou dont le titre est « Président ».


--Afficher le nom, le titre, le numéro de département, le salaire des
--employés du département 34, dont le titre est « Représentant » ou
--« Secrétaire ».


--Afficher le nom, le titre, le numéro de département, le salaire des
--employés dont le titre est Représentant, ou dont le titre est Secrétaire
--dans le département numéro 34.


--Afficher le nom, et le salaire des employés dont le salaire est compris
--entre 20000 et 30000. 


--Afficher le nom des employés commençant par la lettre « H ».
16.Afficher le nom des employés se terminant par la lettre « n ».
17.Afficher le nom des employés contenant la lettre « u » en 3ème
position.
18.Afficher le salaire et le nom des employés du service 41 classés par
salaire croissant.
19.Afficher le salaire et le nom des employés du service 41 classés par
salaire décroissant.
20.Afficher le titre, le salaire et le nom des employés classés par titre
croissant et par salaire décroissant. 
1.Afficher le taux de commission, le salaire et le nom des employés
classés par taux de commission croissante. 
22.Afficher le nom, le salaire, le taux de commission et le titre des
employés dont le taux de commission n'est pas renseigné.
23.Afficher le nom, le salaire, le taux de commission et le titre des
employés dont le taux de commission est renseigné.
24.Afficher le nom, le salaire, le taux de commission, le titre des
employés dont le taux de commission est inférieur à 15.
25. Afficher le nom, le salaire, le taux de commission, le titre des
employés dont le taux de commission est supérieur à 15. 
26.Afficher le nom, le salaire, le taux de commission et la commission des
employés dont le taux de commission n'est pas nul. (la commission
est calculée en multipliant le salaire par le taux de commission)
27. Afficher le nom, le salaire, le taux de commission, la commission des
employés dont le taux de commission n'est pas nul, classé par taux de
commission croissant.
28. Afficher le nom et le prénom (concaténés) des employés. Renommer
les colonnes
29. Afficher les 5 premières lettres du nom des employés.
30. Afficher le nom et le rang de la lettre « r » dans le nom des
employés.
31. Afficher le nom, le nom en majuscule et le nom en minuscule de
l'employé dont le nom est Vrante.
32. Afficher le nom et le nombre de caractères du nom des employés. 




