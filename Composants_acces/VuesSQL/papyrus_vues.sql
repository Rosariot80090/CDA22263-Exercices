-- Active: 1678796343157@@127.0.0.1@3306@papyrus_phase3
/* BDD papyrus_phase3.sql*/

--v_GlobalCde correspondant à la requête : A partir de la table Ligcom, afficher par code produit, la somme des quantités commandées et le prix total correspondant : on nommera la colonne correspondant à la somme des quantités commandées, QteTot et le prix total, PrixTot.
CREATE VIEW v_GlobalCde
AS
SELECT codart, sum(qtecde) as QteTot, sum(qtecde*priuni) as PrixTot
FROM ligcom 
group by codart
order by codart
;

SELECT * FROM `v_GlobalCde`;

--v_VentesI100 correspondant à la requête : Afficher les ventes dont le code produit est le I100 (affichage de toutes les colonnes de la table Vente).
CREATE VIEW v_VentesI100 AS
SELECT *
FROM vente 
WHERE codart = 'I100'
;

SELECT * FROM `v_VentesI100`;


--A partir de la vue précédente, créez v_VentesI100Grobrigan remontant toutes les ventes concernant le produit I100 et le fournisseur 00120.
--CREATE VIEW v_VentesI100Grobrigan
CREATE VIEW `v_VentesI100Grobrigan`
AS
SELECT * FROM `v_VentesI100`
WHERE numfou = 00120
;

