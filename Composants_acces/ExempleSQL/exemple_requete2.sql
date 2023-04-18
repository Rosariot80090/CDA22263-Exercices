        --JONTURES--

--Rechercher le prénom des employés et le numéro de la région de leur département.  
SELECT prenom, noregion
FROM employe
JOIN dept ON nodept=nodep;

--Rechercher le numéro du département, le nom du département, le nom des employés classés par numéro de département (renommer les tables utilisées).
SELECT e.nodep, d.nom, e.nom
FROM employe e
JOIN dept d ON d.nodept=e.nodep;


-- Rechercher le nom des employés du département Distribution.
SELECT e.nodep, d.nom, e.nom
FROM employe e
JOIN dept d ON d.nodept=e.nodep
WHERE d.nom='distribution';


        --AUTO-JOINTURES--

--Rechercher le nom et le salaire des employés qui gagnent plus que leur patron, et le nom et le salaire de leur patron.
SELECT e.nom as employe, e.salaire, p.nom as patron, p.salaire
FROM employe e
JOIN employe p ON e.nosup = p.noemp
WHERE p.salaire<e.salaire;


        --SOUS-REQUETES--

--Rechercher le nom et le titre des employés qui ont le même titre que Amartakaldire.;
SELECT nom, titre FROM employe WHERE nom='Amartakaldire';
SELECT * FROM employe WHERE titre=(SELECT titre FROM employe 
WHERE nom="amartakaldire" );


--Rechercher le nom, le salaire et le numéro de département desemployés qui gagnent plus qu'un seul employé du département 31, classés par numéro de département et salaire.
SELECT nom, MAX(salaire), noemp, nodep FROM employe
WHERE nodep='31';


--Rechercher le nom, le salaire et le numéro de département des employés qui gagnent plus que tous les employés du département 31, classés par numéro de département et salaire.
SELECT nom, salaire, noemp, nodep FROM employe
WHERE salaire> (select min(salaire) from employe where nodep='31');


--Rechercher le nom et le titre des employés du service 31 qui ont un titre que l'on trouve dans le département 32.
SELECT nom, titre, nodep FROM employe
WHERE nodep='31' AND titre IN (SELECT titre FROM employe WHERE nodep='32');


--Rechercher le nom et le titre des employés du service 31 qui ont un titre l'on ne trouve pas dans le département 32.
SELECT nom, titre, nodep FROM employe
WHERE nodep='31' AND titre  NOT IN (SELECT titre FROM employe WHERE nodep='32');

--Rechercher le nom, le titre et le salaire des employés qui ont le même titre et le même salaire que Fairent.
SELECT nom, titre, salaire FROM employe
WHERE titre=(select titre from employe where nom='Fairent') and salaire=(select salaire from employe where nom='Fairent');


        --REQUETES EXTERNES--

--Rechercher le numéro de département, le nom du département, le nom des employés, en affichant aussi les départements dans lesquels il n'y a personne, classés par numéro de département
SELECT d.nodept, d.nom as dept, e.nom as employe 
FROM dept d
JOIN employe e ON e.nodep = d.nodept
ORDER BY nodept;
--cette requête n'affiche que les employes par département
SELECT d.nodept, d.nom as dept, e.nom as employe 
FROM dept d
LEFT JOIN employe e ON e.nodep = d.nodept
ORDER BY nodept;
--cette requête avec LEFT prend tout ce qu'il y a dans la table DEPT avec ou sans employe

        --LES GROUPES--

-- Calculer le nombre d'employés de chaque titre
SELECT titre, count(nom) as Nbre_employe FROM employe
GROUP BY titre;

--Calculer la moyenne des salaires et leur somme, par région.
SELECT noregion, AVG(salaire), SUM(salaire)
FROM dept d
JOIN employe e ON e.nodep = d.nodept
GROUP BY noregion;

        --HAVING--

--Afficher les numéros des départements ayant au moins 3 employés.
SELECT e.nodep, count(e.nom) as nbre_employe 
FROM employe e
group by e.nodep
having count(e.nom)>=3;


--Afficher les lettres qui sont l'initiale d'au moins trois employés.
select substring(nom,1,1) from employe
group by substring(nom,1,1)
having count(nom)>=3;


--Rechercher le salaire maximum et le salaire minimum parmi tous les salariés et l'écart entre les deux.
SELECT MAX(salaire), MIN(salaire), (MAX(salaire)-MIN(salaire)) as ecart
FROM employe;


--Rechercher le nombre de titres différents.
SELECT count (distinct (titre)) FROM employe;


--Pour chaque titre, compter le nombre d'employés possédant ce titre.
SELECT distinct titre, count(nom) FROM employe
group by titre;


--Pour chaque nom de département, afficher le nom du département et le nombre d'employés.
SELECT distinct d.nom as dept, count(e.nom) as nbre_employe
FROM employe e
JOIN dept d ON d.nodept = e.nodep
group by dept;

--Rechercher les titres et la moyenne des salaires par titre dont la moyenne est supérieure à la moyenne des salaires des Représentants.
SELECT titre, AVG(salaire) as Salaire_Moyen
FROM employe
group by titre
having Salaire_Moyen > (SELECT avg(salaire) FROM employe where titre ="representant");

--Rechercher le nombre de salaires renseignés et le nombre de taux de commission renseignés
SELECT count(salaire), count(tauxcom) from employe;



