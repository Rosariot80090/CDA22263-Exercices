DROP DATABASE IF EXISTS hotel;

CREATE DATABASE hotel; 
USE hotel;

CREATE TABLE station (
	sta_num INT NOT NULL PRIMARY KEY,
	sta_nom VARCHAR(50) NOT NULL
	
);

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