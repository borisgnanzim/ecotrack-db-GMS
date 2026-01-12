DROP TABLE IF EXISTS conteneur ;
CREATE TABLE conteneur (id_conteneur_conteneur VARCHAR AUTO_INCREMENT NOT NULL,
typeDechet_conteneur VARCHAR(255),
statut_conteneur VARCHAR(255),
id_zone(FK)_conteneur VARCHAR(255),
capacité_i_conteneur VARCHAR(255),
code_conteneur_conteneur VARCHAR(255),
capteur_id_capteur_capteur BIGINT(255),
PRIMARY KEY (id_conteneur_conteneur)) ENGINE=InnoDB;

DROP TABLE IF EXISTS capteur ;
CREATE TABLE capteur (id_capteur_capteur BIGINT(255) AUTO_INCREMENT NOT NULL,
type_capteur_capteur VARCHAR(255),
id_conteneur(FK)_capteur VARCHAR(255),
actif_capteur BOOLEAN,
conteneur_id_conteneur_conteneur VARCHAR,
PRIMARY KEY (id_capteur_capteur)) ENGINE=InnoDB;

DROP TABLE IF EXISTS zone ;
CREATE TABLE zone (id_zone(PK)_zone VARCHAR(255) AUTO_INCREMENT NOT NULL,
nom_zone_zone VARCHAR(255),
code_insee_zone VARCHAR(255),
population_zone VARCHAR(255),
surface_km2_zone VARCHAR(255),
id_conteneur_conteneur **NOT FOUND**(255),
PRIMARY KEY (id_zone(PK)_zone)) ENGINE=InnoDB;

DROP TABLE IF EXISTS signalement ;
CREATE TABLE signalement (id_signalement(PK)_signalement VARCHAR(255) AUTO_INCREMENT NOT NULL,
description_signalement VARCHAR,
photo_url_signalement VARCHAR,
id_citoyen(FK)_signalement VARCHAR(255),
id_conteneur(FK)_signalement VARCHAR,
id_conteneur_conteneur **NOT FOUND**(255),
id_citoyen(PK)_citoyen **NOT FOUND**(255),
PRIMARY KEY (id_signalement(PK)_signalement)) ENGINE=InnoDB;

DROP TABLE IF EXISTS mesure ;
CREATE TABLE mesure (id_mesure_mesure VARCHAR(255) AUTO_INCREMENT NOT NULL,
horodatage_mesure DATETIME,
taux_remplissage_mesure VARCHAR,
temperature_c_mesure VARCHAR,
latitude_mesure VARCHAR,
longitude_mesure VARCHAR,
id_capteur_capteur **NOT FOUND**(255),
PRIMARY KEY (id_mesure_mesure)) ENGINE=InnoDB;

DROP TABLE IF EXISTS agentcollecte ;
CREATE TABLE agentcollecte (id_agent(PK)_agentcollecte VARCHAR(255) AUTO_INCREMENT NOT NULL,
nom_agentcollecte VARCHAR(255),
matricule_agentcollecte VARCHAR(255),
email_agentcollecte VARCHAR(255),
telephone_agentcollecte VARCHAR(255),
actif_agentcollecte BOOL,
PRIMARY KEY (id_agent(PK)_agentcollecte)) ENGINE=InnoDB;

DROP TABLE IF EXISTS vehicule ;
CREATE TABLE vehicule (id_vehicule_vehicule VARCHAR(255) AUTO_INCREMENT NOT NULL,
matricule_vehicule VARCHAR(255),
PRIMARY KEY (id_vehicule_vehicule)) ENGINE=InnoDB;

DROP TABLE IF EXISTS tournée ;
CREATE TABLE tournée (id_tc(PK)_tournée VARCHAR(255) AUTO_INCREMENT NOT NULL,
date_tournee_tournée DATETIME,
id_agent(FK)_tournée VARCHAR,
statut_tournée VARCHAR,
id_agent(PK)_agentcollecte **NOT FOUND**(255),
id_vehicule_vehicule **NOT FOUND**(255),
PRIMARY KEY (id_tc(PK)_tournée)) ENGINE=InnoDB;

DROP TABLE IF EXISTS citoyen ;
CREATE TABLE citoyen (id_citoyen(PK)_citoyen VARCHAR(255) AUTO_INCREMENT NOT NULL,
nom_citoyen VARCHAR,
email_citoyen VARCHAR,
telephone_citoyen VARCHAR,
date_inscription_citoyen DATETIME,
PRIMARY KEY (id_citoyen(PK)_citoyen)) ENGINE=InnoDB;

DROP TABLE IF EXISTS dessert ;
CREATE TABLE dessert (id_tc(PK)_tournée **NOT FOUND**(255) AUTO_INCREMENT NOT NULL,
id_conteneur_conteneur **NOT FOUND**(255) NOT NULL,
PRIMARY KEY (id_tc(PK)_tournée,
 id_conteneur_conteneur)) ENGINE=InnoDB;

ALTER TABLE conteneur ADD CONSTRAINT FK_conteneur_capteur_id_capteur_capteur FOREIGN KEY (capteur_id_capteur_capteur) REFERENCES capteur (id_capteur_capteur);

ALTER TABLE capteur ADD CONSTRAINT FK_capteur_conteneur_id_conteneur_conteneur FOREIGN KEY (conteneur_id_conteneur_conteneur) REFERENCES conteneur (id_conteneur_conteneur);
ALTER TABLE zone ADD CONSTRAINT FK_zone_id_conteneur_conteneur FOREIGN KEY (id_conteneur_conteneur) REFERENCES conteneur (id_conteneur_conteneur);
ALTER TABLE signalement ADD CONSTRAINT FK_signalement_id_conteneur_conteneur FOREIGN KEY (id_conteneur_conteneur) REFERENCES conteneur (id_conteneur_conteneur);
ALTER TABLE signalement ADD CONSTRAINT FK_signalement_id_citoyen(PK)_citoyen FOREIGN KEY (id_citoyen(PK)_citoyen) REFERENCES citoyen (id_citoyen(PK)_citoyen);
ALTER TABLE mesure ADD CONSTRAINT FK_mesure_id_capteur_capteur FOREIGN KEY (id_capteur_capteur) REFERENCES capteur (id_capteur_capteur);
ALTER TABLE tournée ADD CONSTRAINT FK_tournée_id_agent(PK)_agentcollecte FOREIGN KEY (id_agent(PK)_agentcollecte) REFERENCES agentcollecte (id_agent(PK)_agentcollecte);
ALTER TABLE tournée ADD CONSTRAINT FK_tournée_id_vehicule_vehicule FOREIGN KEY (id_vehicule_vehicule) REFERENCES vehicule (id_vehicule_vehicule);
ALTER TABLE dessert ADD CONSTRAINT FK_dessert_id_tc(PK)_tournée FOREIGN KEY (id_tc(PK)_tournée) REFERENCES tournée (id_tc(PK)_tournée);
ALTER TABLE dessert ADD CONSTRAINT FK_dessert_id_conteneur_conteneur FOREIGN KEY (id_conteneur_conteneur) REFERENCES conteneur (id_conteneur_conteneur);
