-- ZONES
INSERT INTO zone (nom_zone, code_insee, population, surface_km2) VALUES
('Centre-Ville', '75001', 12000, 3.2),
('Nord', '75002', 18000, 5.1),
('Sud', '75003', 15000, 4.3),
('Est', '75004', 17000, 4.8),
('Ouest', '75005', 14000, 3.9);

-- CITOYENS
INSERT INTO citoyen (nom, email, telephone, date_inscription) VALUES
('Dupont Jean', 'jean.dupont@gmail.com', '0612345678', '2024-01-10 09:30:00'),
('Martin Claire', 'claire.martin@gmail.com', '0623456789', '2024-02-15 14:20:00'),
('Bernard Paul', 'paul.bernard@gmail.com', '0634567890', '2024-03-12 11:10:00'),
('Petit Lucie', 'lucie.petit@gmail.com', '0645678901', '2024-04-05 16:45:00'),
('Robert Hugo', 'hugo.robert@gmail.com', '0656789012', '2024-05-18 10:00:00'),
('Durand Emma', 'emma.durand@gmail.com', '0667890123', '2024-06-01 08:50:00'),
('Moreau Lucas', 'lucas.moreau@gmail.com', '0678901234', '2024-06-20 13:15:00'),
('Simon Alice', 'alice.simon@gmail.com', '0689012345', '2024-07-10 17:40:00'),
('Laurent Tom', 'tom.laurent@gmail.com', '0690123456', '2024-08-03 12:30:00'),
('Rousseau Nina', 'nina.rousseau@gmail.com', '0601234567', '2024-09-14 09:00:00');

-- AGENTS DE COLLECTE
INSERT INTO agentcollecte (nom, matricule, email, telephone, actif) VALUES
('Lefevre Marc', 'AGT001', 'marc.lefevre@mairie.fr', '0611001100', TRUE),
('Girard Sophie', 'AGT002', 'sophie.girard@mairie.fr', '0611002200', TRUE),
('Bonnet Alain', 'AGT003', 'alain.bonnet@mairie.fr', '0611003300', TRUE),
('Fontaine Julie', 'AGT004', 'julie.fontaine@mairie.fr', '0611004400', TRUE),
('Chevalier Pierre', 'AGT005', 'pierre.chevalier@mairie.fr', '0611005500', TRUE);

-- VÉHICULES
INSERT INTO vehicule (matricule) VALUES
('AB-123-CD'),
('EF-456-GH'),
('IJ-789-KL'),
('MN-321-OP'),
('QR-654-ST'),
('UV-987-WX');
-- ZONES
INSERT INTO zone (nom_zone, code_insee, population, surface_km2) VALUES
('Centre-Ville','75001',12000,3.2),
('Nord','75002',18000,5.1),
('Sud','75003',15000,4.3),
('Est','75004',17000,4.8),
('Ouest','75005',14000,3.9);

-- CITOYENS
INSERT INTO citoyen (nom,email,telephone,date_inscription) VALUES
('Jean Dupont','jean.dupont@gmail.com','0612345678','2024-01-10 09:30:00'),
('Claire Martin','claire.martin@gmail.com','0623456789','2024-02-15 14:20:00'),
('Paul Bernard','paul.bernard@gmail.com','0634567890','2024-03-12 11:10:00'),
('Lucie Petit','lucie.petit@gmail.com','0645678901','2024-04-05 16:45:00'),
('Hugo Robert','hugo.robert@gmail.com','0656789012','2024-05-18 10:00:00');

-- AGENTS
INSERT INTO agentcollecte (nom,matricule,email,telephone,actif) VALUES
('Marc Lefevre','AGT001','marc.lefevre@mairie.fr','0611001100',TRUE),
('Sophie Girard','AGT002','sophie.girard@mairie.fr','0611002200',TRUE),
('Alain Bonnet','AGT003','alain.bonnet@mairie.fr','0611003300',TRUE);

-- VEHICULES
INSERT INTO vehicule (matricule) VALUES
('AB-123-CD'),
('EF-456-GH'),
('IJ-789-KL');

-- CONTENEURS
INSERT INTO conteneur (type_dechet,statut,capacite_litres,code_conteneur,id_zone) VALUES
('Verre','Actif',3000,'CNT001',1),
('Papier','Actif',2400,'CNT002',1),
('Plastique','Actif',2400,'CNT003',2),
('Ordures','Actif',5000,'CNT004',3),
('Bio','Maintenance',2000,'CNT005',4);

-- CAPTEURS
INSERT INTO capteur (type_capteur,actif,id_conteneur) VALUES
('Niveau',TRUE,1),
('Niveau',TRUE,2),
('Niveau',TRUE,3),
('Niveau',TRUE,4),
('Niveau',FALSE,5);

-- TOURNEES
INSERT INTO tournee (date_tournee,statut,id_agent,id_vehicule) VALUES
('2025-01-10 06:00:00','Planifiée',1,1),
('2025-01-11 06:00:00','En cours',2,2),
('2025-01-12 06:00:00','Terminée',3,3);

-- DESSERTES (liaison tournée ↔ conteneur)
INSERT INTO desserte (id_tournee,id_conteneur) VALUES
(1,1),(1,2),
(2,3),(2,4),
(3,5);

-- MESURES
INSERT INTO mesure (horodatage,taux_remplissage,temperature_c,latitude,longitude,id_capteur) VALUES
('2025-01-10 08:00:00',65.5,18.2,48.8566,2.3522,1),
('2025-01-10 08:05:00',72.1,18.0,48.8566,2.3522,2),
('2025-01-10 08:10:00',80.0,17.8,48.8566,2.3522,3),
('2025-01-10 08:15:00',90.3,17.5,48.8566,2.3522,4),
('2025-01-10 08:20:00',40.0,16.9,48.8566,2.3522,5);

-- SIGNALEMENTS
INSERT INTO signalement (description,photo_url,id_citoyen,id_conteneur) VALUES
('Conteneur presque plein','http://img.city/cont1.jpg',1,1),
('Odeur désagréable','http://img.city/cont4.jpg',2,4),
('Débordement de sacs','http://img.city/cont3.jpg',3,3),
('Couvercle cassé','http://img.city/cont5.jpg',4,5);
INSERT INTO signalement (description, photo_url, id_citoyen, id_conteneur) VALUES
('Conteneur presque plein, risque de débordement', 'http://img.city/signalement1.jpg', 1, 1),
('Présence de déchets au sol autour du conteneur', 'http://img.city/signalement2.jpg', 2, 2),
('Mauvaise odeur persistante', 'http://img.city/signalement3.jpg', 3, 4),
('Couvercle cassé', 'http://img.city/signalement4.jpg', 4, 5),
('Conteneur inaccessible à cause de travaux', 'http://img.city/signalement5.jpg', 5, 3),
('Dépôt sauvage à proximité', 'http://img.city/signalement6.jpg', 1, 4),
('Bruit anormal du capteur', 'http://img.city/signalement7.jpg', 2, 1),
('Conteneur renversé', 'http://img.city/signalement8.jpg', 3, 2),
('Tri non respecté', 'http://img.city/signalement9.jpg', 4, 3),
('Fuite de liquide', 'http://img.city/signalement10.jpg', 5, 5);
