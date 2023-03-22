-- Active: 1678796343157@@127.0.0.1@3306@papyrus_phase3
--Quelles sont les commandes du fournisseur 09120 ?
SELECT e.numfou, e.numcom
FROM entcom e
WHERE numfou='9120';

--Afficher le code des fournisseurs pour lesquels des commandes ont été passées.




--Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseur concernés.



--Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la quantité annuelle est inférieur est inférieure à 1000 (informations à fournir : n° produit, libellé produit, stock, stock actuel d'alerte, quantité annuelle)





--Quels sont les fournisseurs situés dans les départements 75 78 92 77 ? L’affichage (département, nom fournisseur) sera effectué par département décroissant, puis par ordre alphabétique
 


--Quelles sont les commandes passées au mois de mars et avril ?



--7. Quelles sont les commandes du jour qui ont des observations particulières ? (Affichage numéro de commande, date de commande)




-- 8. Lister le total de chaque commande par total décroissant (Affichage numéro de commande et total)




--9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura dans le calcul du total les articles commandés en quantité supérieure ou égale à 1000. (Affichage numéro de commande et total)





--10. Lister les commandes par nom fournisseur (Afficher le nom du fournisseur, le numéro de commande et la date)





--11. Sortir les produits des commandes ayant le mot "urgent' en observation? Introduction langage SQL dans SQL Server afpa  2007– Informatique et télécoms – filière étude - développementr 6/10 (Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et le sous total = quantité commandée * Prix unitaire)




--12. Coder de 2 manières différentes la requête suivante : Lister le nom des fournisseurs susceptibles de livrer au moins un article



--13. Coder de 2 manières différentes la requête suivante Lister les commandes (Numéro et date) dont le fournisseur est celui de la commande 70210 :



--14. Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés sur Prix1) que le moins cher des rubans (article dont le premier caractère commence par R). On affichera le libellé de l’article et prix1



--15. Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est triée par produit puis fournisseur



--16. Éditer la liste des fournisseurs susceptibles de livrer les produit dont le stock est inférieur ou égal à 150 % du stock d'alerte et un délai de livraison d'au plus 30 jours. La liste est triée par fournisseur puis produit



--17. Avec le même type de sélection que ci-dessus, sortir un total des stocks par fournisseur trié par total décroissant



--18. En fin d'année, sortir la liste des produits dont la quantité réellement commandée dépasse 90% de la quantité annuelle prévue.



--19. Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant que les prix indiqués sont hors taxes et que le taux de TVA est 20%.




--20. Existe-t-il des lignes de commande non cohérentes avec les produits vendus par les fournisseurs. ?