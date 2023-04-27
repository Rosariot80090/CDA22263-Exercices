-- Active: 1678796343157@@127.0.0.1@3306@hotel_phase2
-- BDD Hotel --

--CREATE [OR REPALCE] TRIGGER nomtrigger
  --  {BEFORE [ AFTER] INSERT OR UPDATE OR DELETE}
    --ON Nomdetable [FOR EACH ROW] 
    --[WHEN condition]
-------------------------------------------EXEMPLE-------------------------------------------------------

--Nous voulons interdire l'insertion des stations dont l'altitude est inférieur à 1000m.-- Donc INTERDIRE l'écriture suivante: sta_altitude étant inférieur à 1000m.

CREATE OR REPLACE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW
    BEGIN
        DECLARE altitude INT; --Vérifier ACTION sur la VALEUR "ALTITUDE" de la Table STATION
        SET altitude = NEW.sta_altitude; --La valeur entrée dans "altidude " viendra affecter Nouvellement la colonne sta_altitude 
        IF altitude<1000 THEN  --Si l'altitude est inférieure à 1000 mètres, ALORS MSG d'Erreur
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude, ne peut être inférieure 1000 mètres!';
        END IF;
END;

 insert into station (sta_nom, sta_altitude) values ('station du bas', 666); --la Table 'station' comprend les colonnes (sta_id, sta_nom, sta_altitude). J'insert seulement les nouvelles valeurs sta_nom et sta_altitude. sta_id étant auto_incrémentée.

-------------------------------------------EXO 1 ------------------------------
--modif_reservation : interdire la modification (UPDATE) des réservations (on autorise l'ajout et la suppression).


CREATE OR REPLACE TRIGGER before_update_modif_reservation 
/*l'action interdiction doit intervenir BEFORE toute action de modification. INSERT et DELETE sont sans restriction*/ 


BEFORE UPDATE ON reservation
    FOR EACH ROW
    BEGIN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Les modifications sont interdite !';        
    END;

--Je teste: je veux modifier la date de "réservation" du client 1 de la table "STATION";

update reservation
set res_date = '2017-01-10 00:00:00'
where res_cli_id ='3';


--insert_reservation : interdire l'ajout de réservation pour les hôtels possédant déjà 10 réservations.

select r.res_cha_id, h.hot_nom, r.res_id, cli.cli_id, cli.cli_nom
from reservation r
join client cli on cli.cli_id = r.res_cli_id
join chambre c on c.cha_id = r.res_cha_id 
join hotel h on h.hot_id = c.cha_hot_id


--insert_reservation2 : interdire les réservations si le client possède déjà 3 réservations.

Données des tables insufisantes




--insert_chambre : lors d'une insertion, on calcule le total des capacités des chambres pour l'hôtel, si ce total est supérieur à 50, on interdit l'insertion de la chambre.

