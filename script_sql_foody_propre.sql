CREATE DATABASE foody;
USE foody;

CREATE TABLE clients (
codeCli CHAR(5) PRIMARY KEY,
societe VARCHAR(50),
contact VARCHAR(50),
fonction VARCHAR(50),
adresse VARCHAR(50),
ville VARCHAR(50),
region VARCHAR(50),
codePostal VARCHAR(50),
pays VARCHAR(50),
tel VARCHAR(50),
fax VARCHAR(50)
);
CREATE TABLE messager (
noMess INT PRIMARY KEY,
nomMess VARCHAR(50),
tel VARCHAR(50)
);
CREATE TABLE categorie (
codeCateg INT PRIMARY KEY,
nomCateg VARCHAR(50),
descriptionn VARCHAR(150)
);
CREATE TABLE fournisseur (
noFour INT PRIMARY KEY,
societe VARCHAR(50),
contact VARCHAR(50),
fonction VARCHAR(50),
adresse VARCHAR(50),
ville VARCHAR(50),
region VARCHAR(50),
codePostal VARCHAR(50),
pays VARCHAR(50),
tel VARCHAR(50),
fax VARCHAR(50),
pageAccueil VARCHAR(150)
);
CREATE TABLE employe (
noEmp INT PRIMARY KEY,
nom VARCHAR(50),
prenom VARCHAR(50),
fonction VARCHAR(50),
titreCourtoisie VARCHAR(50),
dateNaissance DATE,
dateEmbauche DATE,
adresse VARCHAR(50),
ville VARCHAR(50),
region VARCHAR(50),
codePostal VARCHAR(50),
pays VARCHAR(50),
telDom VARCHAR(50),
extension INT, 	
rendCompteA INT REFERENCES employe(noEmp)
);
CREATE TABLE produit (
refProd INT PRIMARY KEY,
nomProd VARCHAR(50),
noFour INT,

codeCateg INT,

qteParUnit VARCHAR(50),
prixUnit FLOAT4,
unitesStock INT,
unitesCom INT,
niveauReap INT,
indisponible INT
);

CREATE TABLE commande (
noCom INT PRIMARY KEY,
codeCli CHAR(5),

noEmp INT,

dateCom DATE,
aLivAvant DATE,
dateEnv DATE,
noMess INT,

portt FLOAT4,
destinataire VARCHAR(50),
adrLiv VARCHAR(50),
villeLiv VARCHAR(50),
regionLiv VARCHAR(50),
codePostalLiv VARCHAR(50),
paysLiv VARCHAR(50)
);
CREATE TABLE detailCommande (
noCom INT,

refProd INT,

prixUnit FLOAT4,
qte INT,
remise FLOAT,
PRIMARY KEY (noCom, refProd)
);

ALTER TABLE categorie MODIFY descriptionn VARCHAR(200);
SELECT * FROM produit;

INSERT INTO categorie VALUES (1,"drinks","Soft drinks, coffees, teas, beers, and ales"),
(2,"Condiments","Sweet and savory sauces, relishes, spreads, and seasonings"),
(3,"Desserts","Desserts, candies, and sweet breads"),
(4,"Dairy Products","Cheeses"),
(5,"Grains/Cereals","Breads, crackers, pasta, and cereal"),
(6,"Meat/Poultry","Prepared meats"),
(7,"Produce","Dried fruit and bean curd"),
(8,"Seafood","Seaweed and fish");

ALTER TABLE produit ADD FOREIGN KEY (codeCateg) REFERENCES categorie(codeCateg);
ALTER TABLE produit ADD FOREIGN KEY (noFour) REFERENCES fournisseur(noFour);
ALTER TABLE commande ADD FOREIGN KEY (codeCli) REFERENCES clients(codeCli);
ALTER TABLE commande ADD FOREIGN KEY (noEmp) REFERENCES employe(noEmp);
ALTER TABLE commande ADD FOREIGN KEY (noMess) REFERENCES messager(noMess);
ALTER TABLE detailCommande ADD FOREIGN KEY (noCom) REFERENCES commande(noCom);
ALTER TABLE detailCommande ADD FOREIGN KEY (refProd) REFERENCES produit(refProd);

