-- Active: 1678796343157@@127.0.0.1@3306@northwind

-- 1. Liste des contacts français :

SELECT c.CompanyName,c.ContactName,c.ContactTitle,c.Phone,c.Fax,c.Country
FROM customers c
WHERE c.Country="France";

--2. Produits vendus par le fournisseur "Exotic Liquids" :

SELECT p.ProductName AS Produit,p.UnitPrice AS Prix
FROM suppliers s
RIGHT JOIN products p ON p.SupplierID=s.SupplierID 
WHERE s.CompanyName="Exotic Liquids";

--3. Nombre de produits vendus par les fournisseurs Français dans l'ordre décroissant :

SELECT s.CompanyName,s.SupplierID,COUNT(s.CompanyName)AS NbreProduits
FROM suppliers s
JOIN products p ON p.SupplierID=s.SupplierID
WHERE s.Country="France"
GROUP BY s.CompanyName
ORDER BY COUNT(s.CompanyName) desc;


--4. Liste des clients Français ayant plus de 10 commandes :

SELECT c.CustomerID,c.CompanyName,COUNT(o.OrderID)AS NbreCommandes
FROM customers c
right JOIN orders o ON o.CustomerID=c.CustomerID
WHERE c.Country="France"
GROUP BY o.CustomerID
HAVING COUNT(o.OrderID)>10;

--5. Liste des clients ayant un chiffre d'affaires > 30000 :

SELECT c.CustomerID,c.CompanyName,sum(od.Quantity*od.UnitPrice)AS CA, c.Country
FROM customers c
RIGHT JOIN orders o ON o.CustomerID=c.CustomerID
LEFT JOIN orderdetails od ON od.OrderID=o.OrderID
LEFT JOIN products p ON p.ProductID=od.ProductID
GROUP BY c.CompanyName
HAVING SUM(od.Quantity*od.UnitPrice)>30000
ORDER BY sum(od.Quantity*od.UnitPrice)desc;

--6. Liste des pays dont les clients ont passé commande de produits fournis par "Exotic Liquids" :

SELECT DISTINCT  s.CompanyName,o.ShipCountry
FROM suppliers s
RIGHT JOIN products p ON p.SupplierID=s.SupplierID
RIGHT JOIN orderdetails od ON od.ProductID=p.ProductID
LEFT JOIN orders o ON o.OrderID=od.OrderID
LEFT JOIN customers c ON c.CustomerID=o.CustomerID 

WHERE s.CompanyName="Exotic Liquids"
ORDER BY o.ShipCountry;

--7. Montant des ventes de 1997 :

SELECT EXTRACT(YEAR FROM o.OrderDate)AS "Année",sum(od.Quantity*od.UnitPrice)AS MontantVentes97
FROM orderdetails od
JOIN orders o ON o.OrderID=od.OrderID
LEFT JOIN products p ON p.ProductID=od.ProductID
WHERE EXTRACT(YEAR FROM o.OrderDate)=1997;

--8. Montant des ventes de 1997 mois par mois :

SELECT EXTRACT(MONTH FROM o.OrderDate)AS"Mois",sum(od.Quantity*od.UnitPrice)AS MontantVentes97
FROM orders o
JOIN orderdetails od ON o.OrderID=od.OrderID

WHERE EXTRACT(YEAR FROM o.OrderDate)=1997
GROUP BY EXTRACT(MONTH FROM o.OrderDate);

--9. Depuis quelle date le client "Du monde entier" n'a plus commandé ?

SELECT c.CompanyName,max(o.OrderDate)
FROM orders o
JOIN customers c ON c.CustomerID=o.CustomerID
WHERE c.CompanyName="Around the Horn";


--10. Quel est le délai moyen de livraison en jours ?

SELECT AVG(DATEDIFF(o.ShippedDate,o.OrderDate))AS "Délai Moyen de livraison en jours"
FROM orders o;



