-- Active: 1678796343157@@127.0.0.1@3306@cp
--BDD cp--
CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;

        SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné

        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        
        UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
END;



INSERT INTO produit (designation, prix_achat, prix_vente) VALUES ('Lot de 12', 42, 8400);
INSERT INTO commande (id_client, date_commande, remise) values (3, '2023-04-03', 30);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) values (4, 6, 20, 3);


SELECT id_commande, ((prix*quantite)-(prix*quantite*remise/100)) as Total_avec_remise
FROM lignedecommande l
JOIN commande c ON c.id = l.id_commande;

/*
SELECT sum(prix*quantite)
FROM lignedecommande
*/
