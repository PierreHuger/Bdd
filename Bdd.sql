DROP SCHEMA IF EXISTS transmusicales CASCADE; 

CREATE SCHEMA transmusicales; 

SET SCHEMA 'transmusicales'; 



CREATE TABLE _pays
(
nom_p VARCHAR(255) PRIMARY KEY NOT NULL
);



CREATE TABLE _annee
(
an INTEGER PRIMARY KEY NOT NULL
);



CREATE TABLE _ville
(
code_postal VARCHAR(255) PRIMARY KEY NOT NULL,
nom_v VARCHAR(255),
se_situe VARCHAR(255),
FOREIGN KEY (se_situe) REFERENCES _pays(nom_p)
);



CREATE TABLE _type_musique
(
type_m VARCHAR(255) PRIMARY KEY NOT NULL
);



CREATE TABLE _lieu
(
id_lieu VARCHAR(255) PRIMARY KEY NOT NULL,
nom_lieu VARCHAR(255),
accesPMR BOOL,
capacite_max INTEGER,
type_lieu VARCHAR(255),
dans VARCHAR(255),
FOREIGN KEY (dans) REFERENCES _ville(code_postal)
);



CREATE TABLE _edition
( nom_edition VARCHAR(255) NOT NULL PRIMARY KEY,
 annee_edition INTEGER,
 FOREIGN KEY (annee_edition) REFERENCES _annee(an)
 );



CREATE TABLE _groupe_artiste
(
id_groupe_artiste VARCHAR(255) NOT NULL PRIMARY KEY,
nom_groupe VARCHAR(255),
site_web VARCHAR(255),
debut INTEGER,
sortie_discographie INTEGER,
a_pour_origine VARCHAR(255),
type_ponctuel VARCHAR(255),
type_principal VARCHAR(255),
FOREIGN KEY (debut) REFERENCES _annee(an),
FOREIGN KEY (sortie_discographie) REFERENCES _annee(an),
FOREIGN KEY (a_pour_origine) REFERENCES _pays(nom_p),
FOREIGN KEY (type_ponctuel) REFERENCES _type_musique(type_m),
FOREIGN KEY (type_principal) REFERENCES _type_musique(type_m)
);



CREATE TABLE _formation
(
  libelle_formation VARCHAR(255) PRIMARY KEY NOT NULL
);



CREATE TABLE _Concert
(
no_concert CHARACTER PRIMARY KEY NOT NULL,
titre VARCHAR(255),
resume VARCHAR(255),
durée INTEGER, 
tarif FLOAT,
est_de VARCHAR(255),
se_deroule VARCHAR(255),
FOREIGN KEY (se_deroule) REFERENCES _edition(nom_edition),
FOREIGN KEY (est_de) REFERENCES _type_musique(type_m)
);



CREATE TABLE Representation
(
numero_representation VARCHAR(255) PRIMARY KEY NOT NULL,
heure CHARACTER(5),
date_representation CHARACTER(8),
correspond_a VARCHAR(255),
jouee_par VARCHAR(255),
a_lieu_dans VARCHAR(255),
FOREIGN KEY (a_lieu_dans) REFERENCES _lieu(id_lieu),
FOREIGN KEY (jouee_par) REFERENCES _groupe_artiste(id_groupe_artiste),
FOREIGN KEY (correspond_a) REFERENCES _concert(no_concert)
);