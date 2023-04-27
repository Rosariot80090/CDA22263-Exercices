-- Active: 1678796343157@@127.0.0.1@3306@papyrus_phase3
DELIMITER |
DROP TRIGGER after_update_acommander; 
CREATE TRIGGER after_update_acommander 
AFTER UPDATE ON produit
--après modification de la table produit
FOR EACH ROW

UPDATE artcommander
--va mettre à jour la table artcommander 'sous certaines conditions si (stkphy<stkale)'. Cette contient 3 champs (codart, date, qte)

SET artcommander.qte = artcommander.qte + 1; --met à jour champs Qte

WHERE artcommander.codart = NEW.codart;
/*
BEGIN
    --lorsque le stock physique devient inférieur ou égal au stock d'alerte, une nouvelle ligne est insérée dans la table ARTICLES_A_COMMANDER. 
    DECLARE p.stkphy INT; --je déclare la variable sur laquelle repose le TRIGGER

    DECLARE ac.qte INT;

    SET p.stkphy = NEW.p.stkphy --stock physique prendra une nouvelle valeur après commande

    SET NEW.p.stkphy =  (SELECT (p.stkale-p.stkphy)) FROM produit WHERE ac.codart=p.codart;

    IF --condition d'intervention--

    SELECT codart, stkale, stkphy, (stkale-stkphy) as QTE_a_Commnder
    FROM produit 
    WHERE NEW.stkphy = (stkale-stkphy);

    NEW.stkphy < stkale 
    THEN
    QTE = (stkale - stkphy)

    END IF;


END |

DELIMITER;
*/
SELECT p.codart, p.stkale, p.stkphy, (stkphy-stkale) as QTE_a_Commnder
FROM produit p
WHERE (stkphy-stkale) < 0;

CREATE TABLE Articles_a_commander (

    Codart char(4),
    Date DATE DEFAULT CURTIME(),
    Qte int(11),
    Foreign Key (codart) REFERENCES produit(codart)
);

DELIMITER $$

CREATE OR REPLACE TRIGGER update_produit AFTER UPDATE ON papyrus.produit
    FOR EACH ROW
    BEGIN
        DECLARE    
            Diff INT;
        SET Diff = NEW.stkale - NEW.stkphy ;
            IF NEW.stkphy <= NEW.stkale THEN
            INSERT INTO Articles_a_commander(
                codart,
                Qte)
            VALUES(
                NEW.codart,
                Diff
            );
    END IF;