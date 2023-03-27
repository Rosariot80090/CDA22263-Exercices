--Afficher toutes les informations concernant les employés
SELECT * FROM employe;

--Afficher toutes les informations concernant les départements
SELECT * FROM dept;

--Afficher le nom, la date d'embauche, le numéro du supérieur, 
--le numéro de département et le salaire de tous les employés. 
SELECT nom, dateemb, nosup, nodep,salaire 
FROM employe;

        --SUPPRESSION DES DOUBLONS--

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

        --RESTRICTION--

 --Afficher le nom et le prénom des employés dont le nom est
--alphabétiquement antérieur au prénom.
SELECT nom, prenom
FROM employe
WHERE nom<prenom;

--Afficher le nom, le salaire et le numéro du département des employés dont le titre est « Représentant », le numéro de département est 35 et le salaire est supérieur à 20000.
SELECT nom, salaire, nodep
FROM employe
WHERE titre="representant" AND nodep="35" AND salaire>20000;


--Afficher le nom, le titre et le salaire des employés dont le titre est « Représentant » ou dont le titre est « Président ».
SELECT nom, titre, salaire
FROM employe
WHERE titre=("representant") or titre=("president");


--Afficher le nom, le titre, le numéro de département, le salaire des employés du département 34, dont le titre est « Représentant » ou « Secrétaire ».
SELECT nom, titre, nodep, salaire
FROM employe
WHERE nodep="34" and (titre="representant" or titre="secretaire");


--Afficher le nom, le titre, le numéro de département, le salaire des employés dont le titre est Représentant, ou dont le titre est Secrétaire dans le département numéro 34.

SELECT nom, titre, salaire, nodep
FROM employe
WHERE titre="representant" or (titre="secretaire" and nodep="34");


--Afficher le nom, et le salaire des employés dont le salaire est compris entre 20000 et 30000. 

SELECT nom, salaire
FROM employe
WHERE salaire >=20000 and salaire<=30000;

        -- NEGATION? RECHERCHE APPROCHÉ--

--Afficher le nom des employés commençant par la lettre « H ».
SELECT nom
FROM employe
WHERE nom 
LIKE 'h%';

--Afficher le nom des employés se terminant par la lettre « n ».
SELECT nom
FROM employe
WHERE nom 
LIKE '%n';


--Afficher le nom des employés contenant la lettre « u » en 3ème position.
SELECT nom
FROM employe
WHERE nom 
LIKE '__u%';

--Afficher le salaire et le nom des employés du service 41 classés par salaire croissant.

SELECT salaire, nom,nodep
FROM  employe
WHERE nodep="41" 
ORDER BY salaire; 


--Afficher le titre, le salaire et le nom des employés classés par titre croissant et par salaire décroissant. 
SELECT salaire, nom,nodep
FROM  employe
WHERE nodep="41" 
ORDER BY salaire desc; 


--Afficher le taux de commission, le salaire et le nom des employés classés par taux de commission croissante. 

SELECT salaire, nom, tauxcom
FROM  employe
ORDER BY tauxcom ; 


--Afficher le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission n'est pas renseigné.
SELECT nom, salaire, tauxcom, titre
FROM  employe
WHERE tauxcom is null; 


--Afficher le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission est renseigné.
SELECT nom, salaire, tauxcom, titre
FROM  employe
WHERE tauxcom is not null; 

--Afficher le nom, le salaire, le taux de commission, le titre des employés dont le taux de commission est inférieur à 15.
SELECT nom, salaire, tauxcom, titre
FROM  employe
WHERE tauxcom <15; 


--Afficher le nom, le salaire, le taux de commission et la commission des employés dont le taux de commission n'est pas nul. (la commission est calculée en multipliant le salaire par le taux de commission)
SELECT nom, salaire, tauxcom, (salaire*tauxcom)/100
FROM employe;


--Afficher le nom, le salaire, le taux de commission, la commission des employés dont le taux de commission n'est pas nul, classé par taux de commission croissant.
SELECT nom, salaire, tauxcom, (salaire*tauxcom)/100 as com
FROM employe
where tauxcom !="0"
order by tauxcom;

                --CONCATENATION--

--Afficher le nom et le prénom (concaténés) des employés. Renommer les colonnes
SELECT CONCAT(nom," ",prenom) as "identite"
FROM employe;

                --CHAINE DE CARACTERES--

--Afficher les 5 premières lettres du nom des employés.
SELECT SUBSTRING(nom, 1, 5)
FROM employe;


--Afficher le nom et le rang de la lettre « r » dans le nom des employés.
select locate('r', nom), nom
from employe;

--Afficher le nom, le nom en majuscule et le nom en minuscule de l'employé dont le nom est Vrante.
SELECT NOM, UPPER(nom), LOWER(nom)
FROM employe
WHERE nom="Vrante";


--Afficher le nom et le nombre de caractères du nom des employés. 
select nom, length(nom)
from employe;



