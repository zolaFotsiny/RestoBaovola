CREATE TABLE ingredient (
	idIngredient serial,
	nom varchar(255),
	CONSTRAINT ingredient_pk PRIMARY KEY (idIngredient)
) ;



CREATE TABLE stock (
	idStock serial,
	dateStock DATE,
	idIngredient int,
	quantiteInitial DECIMAL,
	quantiteUtilisee DECIMAL,
	prixAchat DECIMAL,
	CONSTRAINT stock_pk PRIMARY KEY (idStock)
) WITH (
  OIDS=FALSE
);


CREATE TABLE produit (
	idProduit serial,
	nom varchar(255),
	idCategorie int,
	photo varchar(255),
	lastprix DECIMAL,
	CONSTRAINT produit_pk PRIMARY KEY (idProduit)
) ;



CREATE TABLE categorie (
	idCategorie serial,
	nom varchar(255),
	CONSTRAINT categorie_pk PRIMARY KEY (idCategorie)
);



CREATE TABLE detailsProduit (
	idDetailsProduit serial,
	idProduit int,
	idIngredient int,
	quantite DECIMAL,
	CONSTRAINT detailsProduit_pk PRIMARY KEY (idDetailsProduit)
) ;



CREATE TABLE detailsStock (
	idDetailsStock serial,
	dateDetailsStock DATE,
	quantite DECIMAL,
	idStock int,
	CONSTRAINT detailsStock_pk PRIMARY KEY (idDetailsStock)
) ;



CREATE TABLE commande (
	idCommande serial,
	dateCommande DATE,
	CONSTRAINT commande_pk PRIMARY KEY (idCommande)
);



CREATE TABLE detailsCommande (
	idDetailsCommande serial,
	idProduit int,
	idCommande int,
	quantite int,
	CONSTRAINT detailsCommande_pk PRIMARY KEY (idDetailsCommande)
) ;



CREATE TABLE promotion (
	idPromotion serial,
	dateDebut DATE,
	dateFin DATE,
	remise DECIMAL,
	CONSTRAINT promotion_pk PRIMARY KEY (idPromotion)
) ;




ALTER TABLE stock ADD CONSTRAINT stock_fk0 FOREIGN KEY (idIngredient) REFERENCES ingredient(idIngredient);

ALTER TABLE produit ADD CONSTRAINT produit_fk0 FOREIGN KEY (idCategorie) REFERENCES categorie(idCategorie);

ALTER TABLE detailsProduit ADD CONSTRAINT detailsProduit_fk0 FOREIGN KEY (idProduit) REFERENCES produit(idProduit);
ALTER TABLE detailsProduit ADD CONSTRAINT detailsProduit_fk1 FOREIGN KEY (idIngredient) REFERENCES ingredient(idIngredient);

ALTER TABLE detailsStock ADD CONSTRAINT detailsStock_fk0 FOREIGN KEY (idStock) REFERENCES stock(idStock);

ALTER TABLE detailsCommande ADD CONSTRAINT detailsCommande_fk0 FOREIGN KEY (idProduit) REFERENCES produit(idProduit);
ALTER TABLE detailsCommande ADD CONSTRAINT detailsCommande_fk1 FOREIGN KEY (idCommande) REFERENCES commande(idCommande);

INSERT INTO ingredient (nom) VALUES ('Farine');
INSERT INTO ingredient (nom) VALUES ('Tomate');
INSERT INTO ingredient (nom) VALUES ('Fromage');
INSERT INTO ingredient (nom) VALUES ('Crevette');
INSERT INTO ingredient (nom) VALUES ('Riz');
INSERT INTO ingredient (nom) VALUES ('Carotte');
INSERT INTO ingredient (nom) VALUES ('Haricot Vert');

insert into produit(nom,lastprix,idCategorie) values ('Pizza Crevette',20000,1),('Riz cantonais',13000,1));

INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (1,1,100);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (1,2,50);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (1,3,150);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (1,4,200);

INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (2,5,150);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (2,6,20);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (2,7,20);

CREATE VIEW view_produit_ingredient AS SELECT p.idProduit,idCategorie,lastprix,idDetailsProduit,idIngredient,quantite FROM produit  p JOIN detailsProduit dp ON p.idProduit=dp.idProduit;

INSERT INTO stock(idIngredient,) VALUES ();

insert into categorie(nom) values ('Plat'),('Dessert');