-- Active: 1678796343157@@127.0.0.1@3306@northwind

--9. Depuis quelle date le client "Du monde entier" n'a plus commandé ? (Date de la dernière commande)

DELIMITER |
    CREATE or REPLACE PROCEDURE derniereCommande (IN p_company varchar(40))
    --j'appelle ma procedure derniereCommande et je affecte un paramètre en entrée(IN) p_company et le Type (VARCHAR). nommage p_company où p pour dire procédure et company un nomDeParametre.
        BEGIN
            SELECT c.CompanyName,max(o.OrderDate)
            --max(o.OrderDate) max étant la date maximum(dernièreDate) àl'inverse min (premiereDate)
            FROM orders o
            JOIN customers c ON c.CustomerID=o.CustomerID
            --condition OU le CompanyName sera le paramètre d'entrée
            WHERE c.CompanyName=p_company;

        END |

DELIMITER ;
--j'entre le paramètre de recherche de la dernière commande en entrant le nom de la company qui va devenir le paramètre.
call derniereCommande('Around the Horn');

--10. Quel est le délai moyen de livraison en jours ?
DELIMITER |
CREATE or REPLACE PROCEDURE moyenneLivraison ()
    BEGIN
        SELECT AVG(DATEDIFF(o.ShippedDate,o.OrderDate))AS "Délai Moyen de livraison en jours"
        FROM orders o;
    END|
DELIMITER ;

CALL moyenneLivraison ();

--Combien de commandes a effectué un client ?
DELIMITER |
CREATE OR REPLACE PROCEDURE cptCommande (IN p_customer VARCHAR(5), OUT p_nbCommande INT)
    BEGIN
    
        SELECT count(*) INTO p_nbCommande FROM orders 
        WHERE CustomerID = p_customer; 
      
    END |
DELIMITER ;

call cptCommande ('AROUT',@nbCde);

select (@nbCde);