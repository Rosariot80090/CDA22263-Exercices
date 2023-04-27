-- Active: 1678796343157@@127.0.0.1@3306@hotel
-- BDD Hotel --

CREATE [OR REPALCE] TRIGGER nomtrigger
    {BEFORE [ AFTER] INSERT OR UPDATE OR DELETE}
    ON Nomdetable [FOR EACH ROW] 
    [WHEN condition]

--Nous voulons interdire l'insertion des stations dont l'altitude est inférieur à 1000m.-- Donc INTERDIRE l'écriture suivante: sta_altitude étant inférieur à 1000m.

DROP TRIGGER insert_station;
CREATE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW
    BEGIN
        DECLARE altitude INT;
        SET altitude = NEW.sta_altitude;
        IF altitude<1000 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
        END IF;
END;


 insert into station (sta_nom, sta_altitude) values ('station du bas', 666);


--modif_reservation : interdire la modification des réservations (on autorise l'ajout et la suppression).
DROP TRIGGER IF EXISTS before_update_modif_reservation;
CREATE TRIGGER before_update_modif_reservation 
/*l'action interdiction doit intervenir BEFORE toute action de modification. INSERT et DELETE sont sans restriction*/ 
BEFORE UPDATE ON reservation
    FOR EACH ROW
    BEGIN
        DECLARE res_date DATE;
        SET res_date = NEW.res_date;
       
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Les modifications sont interdites !';
        END IF;
END;

--insert_reservation : interdire l'ajout de réservation pour les hôtels possédant déjà 10 réservations.




--insert_reservation2 : interdire les réservations si le client possède déjà 3 réservations.




--insert_chambre : lors d'une insertion, on calcule le total des capacités des chambres pour l'hôtel, si ce total est supérieur à 50, on interdit l'insertion de la chambre.

