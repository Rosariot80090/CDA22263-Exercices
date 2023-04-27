-- Active: 1678796343157@@127.0.0.1@3306@papyrus_phase3
--BDD papyrus_phase3--

--Exercice 1 : création d'une procédure stockée sans paramètre

--POUR MEMOIRE-Afficher le code des fournisseurs pour lesquels des commandes ont été passées.
SELECT f.numfou, e.numcom
FROM fournis f
JOIN entcom e on e.numfou = f.numfou;
    --cette requête affiche les codes fournisseurs et les numéros de commandes passées
SELECT distinct f.numfou
FROM fournis f
JOIN entcom e on e.numfou = f.numfou;
    --cette requête affiche uniquement le code des fournisseurs qui ont passé commande.

--créez la procédure stockée Lst_fournis correspondant à la requête n°2 afficher le code des fournisseurs pour lesquels une commande a été passée.
DELIMITER |
    CREATE PROCEDURE List_fournis ()
        BEGIN
            SELECT distinct f.numfou
            FROM fournis f
            JOIN entcom e on e.numfou = f.numfou;
        END |

DELIMITER ;

call List_fournis();

--Exécutez la pour vérifier qu’elle fonctionne conformément à votre attente.

--Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée :
SHOW CREATE PROCEDURE List_fournis;


--Exercice 2 : création d'une procédure stockée avec un paramètre en entrée

--Créer la procédure stockée Lst_Commandes, qui liste les commandes ayant un libellé particulier dans le champ obscom (cette requête sera construite à partir de la requête n°11 Sortir les produits des commandes ayant le mot "urgent' en observation).
DELIMITER |
    CREATE or REPLACE PROCEDURE Lst_Commandes ()
        BEGIN
            SELECT e.numcom, e.obscom, f.nomfou, p.codart, p.libart, (l.qtecde * l.priuni) as sous_total
            FROM entcom e
            JOIN ligcom l ON l.numcom = e.numcom
            JOIN produit p ON p.codart = l.codart
            JOIN fournis f ON f.numfou = e.numfou
            where e.obscom not like '%urgent%';
        END |
DELIMITER;

call Lst_Commandes();


--Exercice 3 : création d'une procédure stockée avec plusieurs paramètres

--Créer la procédure stockée CA_ Fournisseur, qui pour un code fournisseur et une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée (cette requête sera construite à partir de la requête n°19). 
--On exécutera la requête que si le code fournisseur est valide, c'est-à-dire dans la table FOURNIS.


DELIMITER |

CREATE PROCEDURE CA_Founisseur(in numfou int, in datcom date, out TotalHT FLOAT )
    BEGIN
        SELECT  f.numfou, e.numcom, e.datcom, (l.qteliv * l.priuni) AS TotalHT
        FROM entcom e
        JOIN fournis f on f.numfou = e.numfou
        JOIN ligcom l on l.numcom = e.numcom
       
        WHERE f.numfou = e.numfou and e.datcom = datcom

        
               ;
    END |
DELIMITER;

SET @p0 = '9150';

SET @p1 = DATE('1993');

CALL CA_Founisseur(@p0, @p1, @p2);

SELECT @p2 = 'TotalHT';




--Testez cette procédure avec différentes valeurs des paramètres.

-- CA NE FONCTIONNE PAS !!!! --