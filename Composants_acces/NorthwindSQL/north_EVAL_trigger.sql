-- Active: 1678796343157@@127.0.0.1@3306@northwind
/*L'entreprise souhaite mettre en place cette règle de gestion:

--Pour tenir compte des coûts liés au transport, on vérifiera que pour chaque produit d’une commande, le client réside dans le même pays que le fournisseur du même produit*/

/*Il s'agit d'interdire l'insertion de produits dans les commandes ne satisfaisants pas à ce critère.*/

/*1. les OrderID ('numeroDeCommande') figurent dans les tables 'orders' et 'orderdetails'

2. les ProductID ('refenrceProduit') figurent dans 'orderdetails' et 'products'

3. SupplierID ('referenceFournisseur') figure dans 'suppliers' et 'products'
    --chaque référenceProduit relève d'un fournisseur et un seul 

4. CustomerID ('referenceClient') et SupplierID ont en commun l'attribut "Contry"

en appelant un produit, il doit répondre au critère s.Country = c.Country



Décrivez par quel moyen et avec quels outils (procédures stockées, trigger...) vous pourriez implémenter la règle de gestion suivante. */

Afin d'interdire l'insertion de produits ne satisfaisants pas à ce critrère, il convient d'utiliser un trigger (déclencheur) qui agit sur l'insertion INSERT d'un produit qui vérifie la règle énoncée suppra. Si le client ne réside pas dans le même pays que le fournisseur l'insertion du produit fournisseur ne sera pas acceptée. MESSAGE d'ERREUR 'Le client ne réside pas dans le même pays que le fournisseur!!!!''

DELIMITER |
CREATE OR REPLACE TRIGGER before_insert_produit
BEFORE INSERT ON orderdetails 
FOR EACH ROW
    
    BEGIN
       
       IF   (SELECT p.ProductID, p.ProductName, o.OrderID, o.CustomerID, s.Country AS Pays_Fournis, c.Country AS Pays_Client
                FROM  products p
                JOIN suppliers s ON s.SupplierID = p.SupplierID
                JOIN orderdetails od ON od .ProductID =p .ProductID
                JOIN orders o ON o.OrderID = od.OrderID 
                JOIN customers c ON c.CustomerID = o.CustomerID
                WHERE c.Country = s.Country and p.ProductID = s.SupplierID)
            THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Vérifier votre Règle de gestion Pays !';
        END IF;
    END |
DELIMITER;

 insert into orderdetails (OrderID, ProductID, UnitPrice , Quantity, Discount) values ('10626','11','14','3','0');





