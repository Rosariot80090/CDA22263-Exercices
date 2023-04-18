-- Active: 1678796343157@@127.0.0.1@3306@hotel
--Afficher la liste des hôtels avec leur station

CREATE VIEW v_hotel_station
AS
SELECT h.hot_nom as nom_hotel, s.sta_nom as nom_station
FROM hotel h
JOIN station s on s.sta_id = h.hot_sta_id;

SELECT * FROM v_hotel_station;

--Afficher la liste des chambres et leur hôtel



--Afficher la liste des réservations avec le nom des clients



--Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station

CREATE VIEW v_sta_hot_cha
AS
SELECT s.sta_nom, h.hot_nom, ch.cha_numero
FROM station s
JOIN hotel h on h.hot_sta_id = s.sta_id
JOIN chambre ch on ch.cha_hot_id = h.hot_id;
SELECT * FROM v_sta_hot_cha;

--Afficher les réservations avec le nom du client et le nom de l’hôtel