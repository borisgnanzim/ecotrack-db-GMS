
# ECOTRACK – Base de données OLTP (MERISE/MySQL)

> **Master 1 Développement – Travail de Groupe**  

---

## Objectif du projet

Concevoir et implémenter **la base de données transactionnelle** d’**ECOTRACK**, une plateforme IoT de gestion des déchets urbains pour une métropole de **500 000 habitants**.  
Le projet couvre le **cycle MERISE** (MCD → MLD → 3NF), l’**implémentation MySQL**, la **réplication Master/Slave** via Docker, la **génération d’un jeu de données réaliste**, et un **catalogue de 40 requêtes SQL** prêtes à l’emploi.

---

## Contexte ECOTRACK

ECOTRACK agrège et exploite des données issues de capteurs pour optimiser la collecte des déchets :

- **2000 conteneurs intelligents** équipés de capteurs (taux de remplissage, température, GPS)
- **~500 000 mesures/jour**
- **50 agents** de collecte et des **tournées quotidiennes**
- **15 000 citoyens** via une **application mobile** (signalements, photos, géolocalisation)

La base de données doit **supporter des écritures intensives**, des **requêtes efficaces**, et une **disponibilité élevée** (réplication).

---

## Ce que le projet va traiter

1. **Modélisation MERISE complète**
   - MCD avec **10–14 entités**, attributs détaillés, **cardinalités justifiées**
   - Transformation en MLD **normalisé 3NF** (1NF, 2NF, 3NF + justifications)
2. **Implémentation MySQL**
   - Schéma avec **PK/FK**, **UNIQUE**, **CHECK**, **NOT NULL**, **INDEX**
   - **Commentaires** sur tables/colonnes (documentation in-schema)
3. **Jeu de données réaliste**
   - **10+ zones urbaines**, **100+ conteneurs**, **10 agents**
   - **200+ citoyens**, **20 tournées**, **1000+ mesures** (7 derniers jours)
   - **50+ signalements** avec statuts variés
4. **Réplication Master/Slave (1 master + 2 slaves)**
   - Docker Compose, fichiers `master.cnf`, `slave*.cnf`
   - **Vérification** que l’écriture master est **répliquée** et **lisible** sur les slaves
5. **40 requêtes SQL organisées**
   - CRUD, filtres, jointures, agrégations/statistiques, CTE, sous-requêtes

---

## Rôles de l’équipe & workflow Git

**Règles Git :**
- Dépôt : `ecotrack-db-GMS`
- **Branche principale** : `main`, features sur branches `feature/*` et tout le code à tester dans `develop`
- **Commits** : **≥ 1 commit/heure/personne**, messages explicites (ex : `feat(sql): add containers table with constraints`)
- **PR/merge** : revue pair-à-pair avant intégration sur `main`

---

## Modèle de données (vue d’ensemble)

> Le détail est dans `docs/MCD.png` et `docs/MLD.md`.

- **ZONE_URBAINE** (#id, nom, code_insee, population, surface_km2, …)
- **CONTENEUR** (#id, code, type, capacité_l, installation_at, ##id_zone, statut, …)
- **CAPTEUR** (#id, type, modèle, ##id_conteneur, actif, …)
- **MESURE** (#id, ##id_capteur, horodatage, taux_remplissage, température_c, lat, lon, source, …)
- **AGENT** (#id, nom, matricule, email, tel, actif, …)
- **TOURNEE** (#id, date, ##id_agent, statut, durée_min, …)
- **TOURNEE_CONTENEUR** (#id, ##id_tournee, ##id_conteneur, ordre, action, …)
- **CITOYEN** (#id, nom, email, tel, date_inscription, …)
- **SIGNALEMENT** (#id, ##id_citoyen, ##id_conteneur, status, type, description, photo_url, horodatage, …)
- **UTILISATEUR_APPLI** (#id, rôle, #ref_citoyen/agent, auth_provider, last_login, …)
- **TYPE_CONTENEUR** (#id, libellé, description, …)
- **TYPE_SIGNALEMENT** (#id, libellé, criticité, SLA_h, …)

**Normalisation** :  
- **1NF** : attributs atomiques, types bien définis  
- **2NF** : pas de dépendance partielle sur PK composite  
- **3NF** : pas de dépendance transitive (types et référentiels isolés)

---

## Implémentation MySQL

- **Base** : `ecotrack_prod`
- **Contraintes** : `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, `NOT NULL`
- **Index** : sur colonnes fréquemment requêtées (ex : `(MESURE.horodatage)`, `(CONTENEUR.id_zone)`, `(SIGNALEMENT.status)`…)
- **Commentaires** : `COMMENT ON` via `COMMENT` inline dans `CREATE TABLE` (MySQL)

Fichiers :
- `sql/schema.sql` – création complète du schéma
- `sql/data.sql` – inserts multi-lignes (cohérents, réalistes, volumétrie imposée)
- `sql/requetes.sql` – **40 requêtes** réparties en :
  - **A. CRUD (10)** : `SELECT/INSERT/UPDATE/DELETE` sur entités principales
  - **B. Filtres (10)** : `WHERE` (AND/OR/IN/BETWEEN), `LIKE`, `ORDER BY`, `LIMIT`
  - **C. Jointures (10)** : `INNER/LEFT/RIGHT`, multi-joins (3–4 tables)
  - **D. Agrégations (10)** : `COUNT/SUM/AVG/MIN/MAX`, `GROUP BY`, `HAVING`, **CTE (`WITH`)**, **subqueries**

---

