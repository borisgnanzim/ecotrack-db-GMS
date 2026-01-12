DROP TABLE IF EXISTS desserte, tournee, mesure, signalement, capteur, conteneur, zone, citoyen, agentcollecte, vehicule;

CREATE TABLE zone (
    id_zone INT AUTO_INCREMENT PRIMARY KEY,
    nom_zone VARCHAR(100),
    code_insee VARCHAR(10),
    population INT,
    surface_km2 FLOAT
) ENGINE=InnoDB;

CREATE TABLE conteneur (
    id_conteneur INT AUTO_INCREMENT PRIMARY KEY,
    type_dechet VARCHAR(50),
    statut VARCHAR(50),
    capacite_litres INT,
    code_conteneur VARCHAR(50),
    id_zone INT,
    FOREIGN KEY (id_zone) REFERENCES zone(id_zone)
) ENGINE=InnoDB;

CREATE TABLE capteur (
    id_capteur INT AUTO_INCREMENT PRIMARY KEY,
    type_capteur VARCHAR(50),
    actif BOOLEAN,
    id_conteneur INT,
    FOREIGN KEY (id_conteneur) REFERENCES conteneur(id_conteneur)
) ENGINE=InnoDB;

CREATE TABLE mesure (
    id_mesure INT AUTO_INCREMENT PRIMARY KEY,
    horodatage DATETIME,
    taux_remplissage FLOAT,
    temperature_c FLOAT,
    latitude DOUBLE,
    longitude DOUBLE,
    id_capteur INT,
    FOREIGN KEY (id_capteur) REFERENCES capteur(id_capteur)
) ENGINE=InnoDB;

CREATE TABLE citoyen (
    id_citoyen INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(150),
    telephone VARCHAR(20),
    date_inscription DATETIME
) ENGINE=InnoDB;

CREATE TABLE signalement (
    id_signalement INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    photo_url VARCHAR(255),
    id_citoyen INT,
    id_conteneur INT,
    FOREIGN KEY (id_citoyen) REFERENCES citoyen(id_citoyen),
    FOREIGN KEY (id_conteneur) REFERENCES conteneur(id_conteneur)
) ENGINE=InnoDB;

CREATE TABLE agentcollecte (
    id_agent INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    matricule VARCHAR(50),
    email VARCHAR(150),
    telephone VARCHAR(20),
    actif BOOLEAN
) ENGINE=InnoDB;

CREATE TABLE vehicule (
    id_vehicule INT AUTO_INCREMENT PRIMARY KEY,
    matricule VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE tournee (
    id_tournee INT AUTO_INCREMENT PRIMARY KEY,
    date_tournee DATETIME,
    statut VARCHAR(50),
    id_agent INT,
    id_vehicule INT,
    FOREIGN KEY (id_agent) REFERENCES agentcollecte(id_agent),
    FOREIGN KEY (id_vehicule) REFERENCES vehicule(id_vehicule)
) ENGINE=InnoDB;

CREATE TABLE desserte (
    id_tournee INT,
    id_conteneur INT,
    PRIMARY KEY (id_tournee, id_conteneur),
    FOREIGN KEY (id_tournee) REFERENCES tournee(id_tournee),
    FOREIGN KEY (id_conteneur) REFERENCES conteneur(id_conteneur)
) ENGINE=InnoDB;
