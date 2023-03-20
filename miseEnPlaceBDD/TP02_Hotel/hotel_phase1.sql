DROP DATABASE IF EXISTS hotel_phase1;

CREATE DATABASE hotel_phase1; 

USE hotel_phase1;

CREATE TABLE station (
	sta_num INT NOT NULL PRIMARY KEY,
	sta_nom VARCHAR(50) NOT NULL
);

INSERT INTO station (sta_num, sta_nom) VALUES (1, 'La Montagne');

INSERT INTO station (sta_num, sta_nom) VALUES (2, 'Le Sud');

INSERT INTO station (sta_num, sta_nom) VALUES (3, 'La Plage');

CREATE TABLE hotel (
	hot_num			INT NOT NULL,
	hot_sta_num		INT NOT NULL,
	hot_nom 		VARCHAR(50) NOT NULL,
	hot_categorie 	INT NOT NULL,
	hot_adresse		VARCHAR(50) NOT NULL,
	hot_ville 		VARCHAR(50) NOT NULL, 
	PRIMARY KEY (hot_num),
	FOREIGN KEY (hot_sta_num) REFERENCES station(sta_num)
);
INSERT INTO hotel (hot_num, hot_sta_num, hot_nom, hot_categorie, hot_adresse, hot_ville) 
VALUES (1, 1, 'Le Magnifique', 3, 'rue du bas', 'Pralo');

INSERT INTO hotel (hot_num, hot_sta_num, hot_nom, hot_categorie, hot_adresse, hot_ville) 
VALUES (2, 1, 'Hotel du haut', 1, 'rue du haut', 'Pralo');

INSERT INTO hotel (hot_num, hot_sta_num, hot_nom, hot_categorie, hot_adresse, hot_ville) 
VALUES (3, 2, 'Le Narval', 3, 'place de la liberation', 'Vonten');

CREATE TABLE chambre (
	cha_num INT NOT NULL ,
	cha_hot_num INT NOT NULL,
	cha_capacite INT NOT NULL,
	cha_type INT NOT NULL,
	cha_degre_confort int not null,
	cha_exposition varchar(10),
	FOREIGN KEY (cha_hot_num) REFERENCES hotel(hot_num),
	PRIMARY KEY (cha_num)
);

INSERT INTO chambre (cha_num, cha_hot_num, cha_capacite, cha_type, cha_degre_confort, cha_exposition) VALUES (001, 1, 2, 1,4,'N');

INSERT INTO chambre (cha_num, cha_hot_num, cha_capacite, cha_type, cha_degre_confort, cha_exposition) VALUES (002, 2, 2, 1,5,'N-E');

INSERT INTO chambre (cha_num, cha_hot_num, cha_capacite, cha_type, cha_degre_confort, cha_exposition) VALUES (003, 3, 3, 1,3,'S');


CREATE TABLE client (
	cli_num INT NOT NULL ,
	cli_nom VARCHAR(50),
	cli_prenom VARCHAR(50),
	cli_adresse VARCHAR(50),
	PRIMARY KEY (cli_num)
);

CREATE TABLE reservation (
	res_num INT NOT NULL,
	res_cli_num INT NOT NULL ,
	res_cha_num INT NOT NULL ,
	res_date_resevation DATE NOT NULL,
	res_date_debut DATE NOT NULL,
	res_date_fin DATE NOT NULL,
	res_arrhes DECIMAL(6,2),
	res_prix_total DECIMAL(6,2) NOT NULL,
	PRIMARY KEY (res_num),
	FOREIGN KEY (res_cha_num) REFERENCES chambre(cha_num),
	FOREIGN KEY (res_cli_num) REFERENCES client(cli_num)
	
);