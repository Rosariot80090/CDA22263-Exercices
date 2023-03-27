-- Active: 1679136074823@@127.0.0.1@3306@papyrus_phase3
--Quelles sont les commandes du fournisseur 09120 ?
SELECT e.numfou, e.numcom
FROM entcom e
WHERE numfou='9120';

--Afficher le code des fournisseurs pour lesquels des commandes ont été passées.
SELECT f.numfou, e.numcom
FROM fournis f
JOIN entcom e on e.numfou = f.numfou;
    --cette requête affiche les codes fournisseurs et les numéris de commandes passées
SELECT distinct f.numfou
FROM fournis f
JOIN entcom e on e.numfou = f.numfou;
    --cette requête affiche uniquement le code des fournisseurs qui ont passé commande.


--Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseur concernés.
SELECT count(distinct f.numfou) as nbre_fournis_concerné, count(e.numcom) as nbre_cdes_passées
FROM fournis f
JOIN entcom e on e.numfou = f.numfou;


--Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la quantité annuelle est inférieur est inférieure à 1000 (informations à fournir : n° produit, libellé produit, stock, stock actuel d'alerte, quantité annuelle)
SELECT codart, libart, stkphy, stkale, qteann
FROM produit
where stkphy <= stkale and qteann < 1000;


--Quels sont les fournisseurs situés dans les départements 75 78 92 77 ? L’affichage (département, nom fournisseur) sera effectué par département décroissant, puis par ordre alphabétique
SELECT posfou, nomfou FROM fournis
where posfou  like '7%'
order by posfou;

SELECT posfou, nomfou FROM fournis WHERE posfou like "7%";
SELECT posfou, nomfou FROM fournis WHERE posfou like "7%"
union
SELECT posfou, nomfou FROM fournis where posfou like "9%"
order by posfou;

--Quelles sont les commandes passées au mois de mars et avril ?
SELECT numcom, datcom from entcom
where datcom between '2018-02-28' and '2018-05-01' ;


--7. Quelles sont les commandes du jour qui ont des observations particulières ? (Affichage numéro de commande, date de commande)
SELECT numcom, obscom, datcom FROM entcom
WHERE obscom !=' ';


-- 8. Lister le total de chaque commande par total décroissant (Affichage numéro de commande et total)
SELECT distinct e.numcom, sum(l.qtecde * l.priuni) as Total_Cde
FROM entcom e
JOIN ligcom l ON l.numcom = e.numcom
JOIN produit p ON p.codart = l.codart
JOIN vente v ON v.codart = p.codart
group by e.numcom
order by Total_Cde DESC;

--9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura dans le calcul du total les articles commandés en quantité supérieure ou égale à 1000. (Affichage numéro de commande et total)
SELECT distinct l.numcom, l.numlig, l.codart, l.qtecde, l.priuni, sum(l.qtecde * l.priuni) as total
FROM ligcom l
JOIN entcom e ON e.numcom = l.numcom
JOIN produit p ON p.codart = l.codart
JOIN vente v ON v.codart = p.codart
WHERE qtecde < 1000
group by l.numcom
order by l.numcom;


--10. Lister les commandes par nom fournisseur (Afficher le nom du fournisseur, le numéro de commande et la date)
select f.nomfou, e.numcom, e.datcom
from entcom e
join fournis f on f.numfou = e.numfou;

--11. Sortir les produits des commandes ayant le mot "urgent' en observation? (Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et le sous total = quantité commandée * Prix unitaire)
SELECT e.numcom, f.nomfou, p.codart, (l.qtecde * l.priuni) as sous_total
FROM entcom e
JOIN ligcom l ON l.numcom = e.numcom
JOIN produit p ON p.codart = l.codart
join fournis f on f.numfou = e.numfou;


--12. Coder de 2 manières différentes la requête suivante : Lister le nom des fournisseurs susceptibles de livrer au moins un article



--13. Coder de 2 manières différentes la requête suivante Lister les commandes (Numéro et date) dont le fournisseur est celui de la commande 70210 :
SELECT e.numcom, e.datcom, f.numfou
FROM fournis f
JOIN entcom e ON e.numfou = f.numfou
WHERE e.numcom = '70210';

SELECT e.numcom, e.datcom, f.numfou
FROM entcom e
JOIN fournis f ON f.numfou = e.numfou
WHERE e.numcom = '70210';

--14. Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés sur Prix1) que le moins cher des rubans (article dont le premier caractère commence par R). On affichera le libellé de l’article et prix1
SELECT v.codart, p.libart, min(v.prix1)
FROM vente v
JOIN produit p ON p.codart = v.codart
where p.codart like 'r%'
--union
--where v.prix1 < 120
;

--15. Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est triée par produit puis fournisseur



--16. Éditer la liste des fournisseurs susceptibles de livrer les produit dont le stock est inférieur ou égal à 150 % du stock d'alerte et un délai de livraison d'au plus 30 jours. La liste est triée par fournisseur puis produit



--17. Avec le même type de sélection que ci-dessus, sortir un total des stocks par fournisseur trié par total décroissant



--18. En fin d'année, sortir la liste des produits dont la quantité réellement commandée dépasse 90% de la quantité annuelle prévue.



--19. Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant que les prix indiqués sont hors taxes et que le taux de TVA est 20%.




--20. Existe-t-il des lignes de commande non cohérentes avec les produits vendus par les fournisseurs. ?