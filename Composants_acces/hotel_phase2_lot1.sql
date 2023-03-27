-- Active: 1678796343157@@127.0.0.1@3306@hotel_phase2
--Afficher la liste des hôtels. Le résultat doit faire apparaître le nom de l’hôtel et la ville
SELECT hot_nom, hot_ville FROM hotel;


--Afficher la ville de résidence de Mr White Le résultat doit faire apparaître le nom, le prénom, et l'adresse du client
SELECT cli_nom, cli_prenom, cli_adresse, cli_ville FROM client
WHERE cli_nom = "White";


--Afficher la liste des stations dont l’altitude < 1000 Le résultat doit faire apparaître le nom de la station et l'altitude
SELECT sta_nom, sta_altitude FROM station
WHERE sta_altitude < 1000;


--Afficher la liste des chambres ayant une capacité > 1 Le résultat doit faire apparaître le numéro de la chambre ainsi que la capacité
SELECT cha_numero, cha_capacite FROM chambre
WHERE cha_capacite > 1;


--Afficher les clients n’habitant pas à Londre Le résultat doit faire apparaître le nom du client et la ville
SELECT cli_nom, cli_ville FROM client
WHERE cli_ville !='Londre';


--Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie>3 Le résultat doit faire apparaître le nom de l'hôtel, ville et la catégorie
SELECT hot_nom, hot_ville,hot_categorie FROM hotel
WHERE hot_ville = 'Bretou' and hot_categorie > 3;