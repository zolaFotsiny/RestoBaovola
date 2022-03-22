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
	quantiteReste DECIMAL,
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

insert into produit(nom,lastprix,idCategorie) values ('Pizza Crevette',20000,1),('Riz cantonais',13000,1),('Akondro',4000,2);
insert into categorie(nom) values ('Plat'),('Dessert');