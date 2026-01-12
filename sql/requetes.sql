SELECT c.id_conteneur, c.type_dechet, c.statut, z.nom_zone
FROM conteneur c
JOIN zone z ON c.id_zone = z.id_zone;
SELECT z.nom_zone, AVG(m.taux_remplissage) AS taux_moyen
FROM mesure m
JOIN capteur cp ON m.id_capteur = cp.id_capteur
JOIN conteneur c ON cp.id_conteneur = c.id_conteneur
JOIN zone z ON c.id_zone = z.id_zone
GROUP BY z.nom_zone;
SELECT DISTINCT c.id_conteneur, c.type_dechet, m.taux_remplissage
FROM mesure m
JOIN capteur cp ON m.id_capteur = cp.id_capteur
JOIN conteneur c ON cp.id_conteneur = c.id_conteneur
WHERE m.taux_remplissage > 80;
SELECT ci.nom, COUNT(s.id_signalement) AS nb_signalements
FROM citoyen ci
LEFT JOIN signalement s ON ci.id_citoyen = s.id_citoyen
GROUP BY ci.nom;
SELECT t.id_tournee, t.date_tournee, t.statut,
       a.nom AS agent, v.matricule AS vehicule
FROM tournee t
JOIN agentcollecte a ON t.id_agent = a.id_agent
JOIN vehicule v ON t.id_vehicule = v.id_vehicule;
SELECT t.id_tournee, c.code_conteneur, c.type_dechet
FROM desserte d
JOIN tournee t ON d.id_tournee = t.id_tournee
JOIN conteneur c ON d.id_conteneur = c.id_conteneur
ORDER BY t.id_tournee;
SELECT c.id_conteneur, MAX(m.horodatage) AS derniere_mesure
FROM mesure m
JOIN capteur cp ON m.id_capteur = cp.id_capteur
JOIN conteneur c ON cp.id_conteneur = c.id_conteneur
GROUP BY c.id_conteneur;
SELECT c.type_dechet, AVG(m.temperature_c) AS temp_moyenne
FROM mesure m
JOIN capteur cp ON m.id_capteur = cp.id_capteur
JOIN conteneur c ON cp.id_conteneur = c.id_conteneur
GROUP BY c.type_dechet;
SELECT DISTINCT ci.nom, s.description
FROM signalement s
JOIN citoyen ci ON s.id_citoyen = ci.id_citoyen
WHERE s.description LIKE '%cassé%' OR s.description LIKE '%débord%';
SELECT z.nom_zone, COUNT(s.id_signalement) AS total_signalements
FROM signalement s
JOIN conteneur c ON s.id_conteneur = c.id_conteneur
JOIN zone z ON c.id_zone = z.id_zone
GROUP BY z.nom_zone
ORDER BY total_signalements DESC;
