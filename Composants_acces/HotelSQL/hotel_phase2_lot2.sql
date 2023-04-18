-- Active: 1678796343157@@127.0.0.1@3306@hotel_phase2
--Afficher la liste des hôtels avec leur station Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, la catégorie, la ville)
SELECT sta_nom, hot_nom, hot_categorie, hot_ville
FROM station sta
JOIN hotel hot ON hot.hot_sta_id = sta.sta_id;

--Afficher la liste des chambres et leur hôtel Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre)
SELECT hot_nom, hot_categorie, hot_ville, cha_numero
FROM hotel
JOIN chambre ON cha_hot_id = hot_id;


--Afficher la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre et sa capacité)
SELECT hot_nom, hot_categorie, hot_ville, cha_numero, cha_capacite
FROM hotel h
JOIN chambre c ON c.cha_hot_id = h.hot_id
WHERE hot_ville = 'Bretou' and cha_capacite > 1;

--Afficher la liste des réservations avec le nom des clients Le résultat doit faire apparaître le nom du client, le nom de l’hôtel, la date de réservation
SELECT cli_nom, hot_nom, res_date
FROM client c
JOIN reservation r ON r.res_cli_id = c.cli_id
JOIN chambre ch ON ch.cha_id = r.res_cha_id
JOIN hotel h ON h.hot_id = ch.cha_hot_id;

--Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, le numéro de la chambre et sa capacité)
SELECT sta_nom, hot_nom, cha_numero, cha_capacite
FROM station s
JOIN hotel h ON h.hot_sta_id = s.sta_id
JOIN chambre c ON c.cha_hot_id = h.hot_id;

--Afficher les réservations avec le nom du client et le nom de l’hôtel Le résultat doit faire apparaître le nom du client, le nom de l’hôtel, la date de début du séjour et la durée du séjour
SELECT cli_nom, hot_nom, res_date_debut, res_date_fin, DATEDIFF(res_date_fin,res_date_debut) as duree
FROM client c
JOIN reservation r on r.res_cli_id = c.cli_id
JOIN chambre ch on ch.cha_id = r.res_cha_id
JOIN hotel h on h.hot_id = ch.cha_hot_id;



