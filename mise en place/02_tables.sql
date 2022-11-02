\c RestauLand
BEGIN;

DROP TABLE IF EXISTS liste_roles CASCADE;
CREATE TABLE liste_roles(
   id_role UUID,
   int_role VARCHAR(50) ,
   PRIMARY KEY(id_role),
   UNIQUE(int_role)
);

DROP TABLE IF EXISTS tiers CASCADE;
CREATE TABLE tiers(
   id_tier UUID,
   nom VARCHAR(50)  NOT NULL,
   tel VARCHAR(50) ,
   mail VARCHAR(50) ,
   adr_postl VARCHAR(50) ,
   code_postl VARCHAR(50) ,
   fid CHAR(1) ,
   PRIMARY KEY(id_tier)
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
   id_user UUID,
   login VARCHAR(50) ,
   mdp CHAR(64)  NOT NULL,
   id_tier UUID,
   PRIMARY KEY(id_user),
   UNIQUE(id_tier),
   FOREIGN KEY(id_tier) REFERENCES tiers(id_tier)
);

DROP TABLE IF EXISTS liste_types_articles CASCADE;
CREATE TABLE liste_types_articles(
   id_type_article UUID,
   int_type VARCHAR(50) ,
   PRIMARY KEY(id_type_article),
   UNIQUE(int_type)
);

DROP TABLE IF EXISTS liste_formes_tables CASCADE;
CREATE TABLE liste_formes_tables(
   id_forme_tbl UUID,
   int_forme VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_forme_tbl),
   UNIQUE(int_forme)
);

DROP TABLE IF EXISTS liste_etat_reservation CASCADE;
CREATE TABLE liste_etat_reservation(
   id_etat_res UUID,
   int_etat VARCHAR(50) ,
   PRIMARY KEY(id_etat_res),
   UNIQUE(int_etat)
);

DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees(
   id_employe UUID,
   matricule VARCHAR(50) ,
   mdp CHAR(64)  NOT NULL,
   id_tier UUID,
   id_role UUID NOT NULL,
   PRIMARY KEY(id_employe),
   UNIQUE(id_tier),
   UNIQUE(matricule),
   FOREIGN KEY(id_tier) REFERENCES tiers(id_tier),
   FOREIGN KEY(id_role) REFERENCES liste_roles(id_role)
);

DROP TABLE IF EXISTS articles CASCADE;
CREATE TABLE articles(
   id_article UUID,
   int_article VARCHAR(50)  NOT NULL,
   ingrd TEXT NOT NULL,
   prix NUMERIC(8,3)   NOT NULL,
   id_type_article UUID NOT NULL,
   PRIMARY KEY(id_article),
   UNIQUE(int_article),
   FOREIGN KEY(id_type_article) REFERENCES liste_types_articles(id_type_article)
);

DROP TABLE IF EXISTS tables CASCADE;
CREATE TABLE tables(
   id_table UUID,
   num_tbl INTEGER,
   nb_couvert INTEGER NOT NULL,
   larg_tbl INTEGER NOT NULL,
   long_tbl INTEGER,
   position_tbl VARCHAR(50) ,
   id_forme_tbl UUID NOT NULL,
   PRIMARY KEY(id_table),
   FOREIGN KEY(id_forme_tbl) REFERENCES liste_formes_tables(id_forme_tbl)
);

DROP TABLE IF EXISTS dressages CASCADE;
CREATE TABLE dressages(
   id_dres UUID,
   int_dressage VARCHAR(50)  NOT NULL,
   path_photo_dres TEXT NOT NULL,
   id_article UUID NOT NULL,
   PRIMARY KEY(id_dres),
   -- UNIQUE(int_dressage),
   FOREIGN KEY(id_article) REFERENCES articles(id_article)
);

DROP TABLE IF EXISTS reservations CASCADE;
CREATE TABLE reservations(
   id_res UUID,
   num_res INTEGER NOT NULL,
   avis TEXT,
   date_reg TIMESTAMP NOT NULL,
   date_res TIMESTAMP NOT NULL,
   id_table UUID NOT NULL,
   id_tier UUID NOT NULL,
   PRIMARY KEY(id_res),
   UNIQUE(num_res),
   FOREIGN KEY(id_table) REFERENCES tables(id_table),
   FOREIGN KEY(id_tier) REFERENCES tiers(id_tier)
);

DROP TABLE IF EXISTS commande CASCADE;
CREATE TABLE commande(
   id_res UUID,
   id_cmd UUID,
   num_cmd INTEGER,
   PRIMARY KEY(id_res, id_cmd),
   UNIQUE(id_res),
   FOREIGN KEY(id_res) REFERENCES reservations(id_res)
);

DROP  TABLE IF EXISTS demande_client CASCADE;
CREATE TABLE demande_client(
   id_res UUID,
   id_cmd UUID,
   id_article UUID,
   PRIMARY KEY(id_res, id_cmd, id_article),
   FOREIGN KEY(id_res, id_cmd) REFERENCES commande(id_res, id_cmd),
   FOREIGN KEY(id_article) REFERENCES articles(id_article)
);

DROP TABLE IF EXISTS etat_res CASCADE;
CREATE TABLE etat_res(
   id_res UUID,
   date_debut TIMESTAMP NOT NULL,
   id_employe UUID NOT NULL,
   id_etat_res UUID NOT NULL,
   PRIMARY KEY(id_res),
   FOREIGN KEY(id_res) REFERENCES reservations(id_res),
   FOREIGN KEY(id_employe) REFERENCES employees(id_employe),
   FOREIGN KEY(id_etat_res) REFERENCES liste_etat_reservation(id_etat_res)
);
COMMIT;