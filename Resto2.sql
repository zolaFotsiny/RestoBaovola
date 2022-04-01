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
	PRIMARY KEY (idCommande)
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

CREATE TABLE serveur(
	idServeur serial,
	nom varchar(255),
	pourBoire DECIMAL,
	PRIMARY KEY (idServeur)
);


CREATE TABLE marge(
	id SERIAL,
	idProduit INT,
	M1 DECIMAL,
	M2 DECIMAL,
	PRIMARY KEY(id),
	FOREIGN KEY (idProduit) REFERENCES produit(idProduit)
);

CREATE TABLE detailsMarge(
	id SERIAL,
	idMarge INT,
	caracteristique VARCHAR(20),
	pourcentage DECIMAL,
	FOREIGN KEY (idMarge) REFERENCES marge(id)
);

CREATE TABLE tabla(
	id SERIAL ,
	nom VARCHAR(50),
	statut INT,
	PRIMARY KEY(id)

);

INSERT INTO tabla(nom,statut) values ('Table1',0);
INSERT INTO tabla(nom,statut) values ('Table2',1);

create view listeCommande as(
	select commande.idCommande,commande.dateCommande,commande.idTable,SUM(detailsCommande.quantite*produit.lastprix) as  addition
	from commande 
	join detailsCommande on commande.idCommande = detailsCommande.idCommande
	join produit on detailsCommande.idProduit = produit.idProduit
	group by commande.idCommande, commande.idProduit
);

CREATE VIEW listeDetailsCommande AS 
select commande.idCommande,commande.dateCommande,commande.idTable,produit.nom,produit.lastprix,SUM(detailsCommande.quantite) as  quantite
	from commande 
	join detailsCommande on commande.idCommande = detailsCommande.idCommande
	join produit on detailsCommande.idProduit = produit.idProduit
	group by commande.idCommande, produit.idProduit;

create  view detailsCommandeView as (
	select serveur.pourBoire,produit.idProduit,commande.idCommande,detailsCommande.quantite,commande.idServeur,produit.lastprix,commande.dateCommande
	from commande 
	join detailsCommande on commande.idCommande = detailsCommande.idCommande
	join produit on detailsCommande.idProduit = produit.idProduit
	join serveur on commande.idServeur = serveur.idServeur
);
create  view detailsCommandeServeur as (
	select serveur.pourBoire,produit.idProduit,commande.idCommande,detailsCommande.quantite,detailsCommande.idServeur,produit.lastprix,commande.dateCommande
	from commande 
	join detailsCommande on commande.idCommande = detailsCommande.idCommande
	join produit on detailsCommande.idProduit = produit.idProduit
	join serveur on detailsCommande.idServeur = serveur.idServeur
);
ALTER TABLE commande ADD idTable INT;
ALTER TABLE detailsCommande ADD idServeur INT;

ALTER TABLE stock ADD CONSTRAINT stock_fk0 FOREIGN KEY (idIngredient) REFERENCES ingredient(idIngredient);


ALTER TABLE produit ADD CONSTRAINT produit_fk0 FOREIGN KEY (idCategorie) REFERENCES categorie(idCategorie);

ALTER TABLE detailsProduit ADD CONSTRAINT detailsProduit_fk0 FOREIGN KEY (idProduit) REFERENCES produit(idProduit);
ALTER TABLE detailsProduit ADD CONSTRAINT detailsProduit_fk1 FOREIGN KEY (idIngredient) REFERENCES ingredient(idIngredient);

ALTER TABLE detailsStock ADD CONSTRAINT detailsStock_fk0 FOREIGN KEY (idStock) REFERENCES stock(idStock);

ALTER TABLE commande ADD CONSTRAINT commande_fk0 FOREIGN KEY (idServeur) REFERENCES serveur(idServeur);

ALTER TABLE detailsCommande ADD CONSTRAINT detailsCommande_fk0 FOREIGN KEY (idProduit) REFERENCES produit(idProduit);
ALTER TABLE detailsCommande ADD CONSTRAINT detailsCommande_fk1 FOREIGN KEY (idCommande) REFERENCES commande(idCommande);

INSERT INTO ingredient (nom) VALUES ('Farine');
INSERT INTO ingredient (nom) VALUES ('Tomate');
INSERT INTO ingredient (nom) VALUES ('Fromage');
INSERT INTO ingredient (nom) VALUES ('Crevette');
INSERT INTO ingredient (nom) VALUES ('Riz');
INSERT INTO ingredient (nom) VALUES ('Carotte');
INSERT INTO ingredient (nom) VALUES ('Haricot Vert');
INSERT INTO ingredient (nom) VALUES ('Tsaramaso');
INSERT INTO ingredient (nom) VALUES ('Totokena');
INSERT INTO ingredient (nom) VALUES ('Pomme de Terre');

insert into produit(nom,lastprix,idCategorie) values ('Pizza Crevette',20000,1),('Riz cantonais',13000,1));

INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (1,1,100);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (1,2,50);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (1,3,150);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (1,4,200);

INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (2,5,150);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (2,6,20);
INSERT INTO detailsProduit(idProduit,idIngredient,quantite) VALUES (2,7,20);


CREATE OR REPLACE VIEW view_produit_ingredient AS SELECT p.idProduit,idCategorie,lastprix,idDetailsProduit,idIngredient,quantite FROM produit  p JOIN detailsProduit dp ON p.idProduit=dp.idProduit;

CREATE OR REPLACE VIEW view_ingredient_recent AS SELECT * FROM stock WHERE idStock IN (SELECT MAX(idStock) FROM stock GROUP BY idIngredient);

CREATE OR REPLACE VIEW view_prix_ingredient_produit AS SELECT idProduit,COALESCE(SUM(quantite*prixAchat),0) AS prixTotalIngredient FROM view_produit_ingredient vpi LEFT JOIN view_ingredient_recent vir ON vpi.idIngredient=vir.idIngredient GROUP BY idProduit;

CREATE OR REPLACE VIEW view_prix_ingredient_produit_2 AS SELECT idProduit,COALESCE(SUM((quantite*prixAchat)/1000),0) AS prixTotalIngredient FROM view_produit_ingredient vpi LEFT JOIN view_ingredient_recent vir ON vpi.idIngredient=vir.idIngredient GROUP BY idProduit;

CREATE OR REPLACE VIEW view_prix_revient_produit AS SELECT p.*,prixTotalIngredient AS prixRevient FROM produit p LEFT JOIN view_prix_ingredient_produit vpip ON p.idProduit=vpip.idProduit;

CREATE OR REPLACE VIEW view_prix_revient_produit_2 AS SELECT p.*,prixTotalIngredient AS prixRevient FROM produit p LEFT JOIN view_prix_ingredient_produit_2 vpip ON p.idProduit=vpip.idProduit;

INSERT INTO stock(idIngredient,quantiteInitial,quantiteUtilisee,dateStock,prixAchat) VALUES (1,10000,0,'2022-1-3',12000);
INSERT INTO stock(idIngredient,quantiteInitial,quantiteUtilisee,dateStock,prixAchat) VALUES (1,10000,0,'2022-1-1',12000);
INSERT INTO stock(idIngredient,quantiteInitial,quantiteUtilisee,dateStock,prixAchat) VALUES (2,1000,0,'2022-1-3',800);
INSERT INTO stock(idIngredient,quantiteInitial,quantiteUtilisee,dateStock,prixAchat) VALUES (3,1000,0,'2022-1-3',2300);
INSERT INTO stock(idIngredient,quantiteInitial,quantiteUtilisee,dateStock,prixAchat) VALUES (4,1000,0,'2022-1-3',8000);
INSERT INTO stock(idIngredient,quantiteInitial,quantiteUtilisee,dateStock,prixAchat) VALUES (5,1000,0,'2022-1-3',4000);
INSERT INTO stock(idIngredient,quantiteInitial,quantiteUtilisee,dateStock,prixAchat) VALUES (6,1000,0,'2022-1-3',500);
INSERT INTO stock(idIngredient,quantiteInitial,quantiteUtilisee,dateStock,prixAchat) VALUES (7,1000,0,'2022-1-3',400);


insert into categorie(nom) values ('Plat'),('Dessert');





insert into commande(dateCommande) values ('2022-05-14');
insert into commande(dateCommande) values ('2022-04-08');
insert into detailsCommande(idCommande,idProduit,quantite,idServeur) values (8,5,5,5);
insert into detailsCommande(idCommande,idProduit,quantite,idServeur) values (8,5,5,6);
insert into detailsCommande(idCommande,idProduit,quantite,idServeur) values (9,4,3,6);
