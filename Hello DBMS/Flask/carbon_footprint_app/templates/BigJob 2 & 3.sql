/* BIG JOB 2 & 3*/
-- 2. Créez la base de données CarbonFootprint, puis les tables Country et World.
CREATE TABLE country (
    Country VARCHAR(255),
    Coal FLOAT,
    Gas	FLOAT,
    Oil	FLOAT,
    Hydro FLOAT,
    Renewable FLOAT,
    Nuclear FLOAT
);

CREATE TABLE world (
    Country VARCHAR(255),
    Coal FLOAT,
    Gas	FLOAT,
    Oil	FLOAT,
    Hydro FLOAT,
    Renewable FLOAT,
    Nuclear FLOAT
);


--3. Utilisez des requêtes SQL afin d’analyser les données recueillies et tirez un
-- maximum d’informations sur les émissions en carbone. Qu’est ce que vous
-- observez ? Notez ces observations pour la suite.

-- Pays utilisant toutes les autres sources d'énergie sauf le pétrole
SELECT * FROM country WHERE Coal > 0 AND Gas > 0 AND Oil = 0 AND Hydro > 0 AND Renewable > 0 AND Nuclear > 0 ORDER BY Gas DESC;

-- Nombre de pays n'utilisant pas d'énergie renouvelable ni hydroélectrique
SELECT Count(Country) AS 'Pays n'utilisant pas d'énergie renouvelable ni hydroélectrique'
FROM country 
WHERE 
	Hydro = 0 AND 
	Renewable = 0;
-- 100 % des pays qui n'utilisent pas d'énergie renouvelable ni hydroélectrique n'utilisent pas non plus d'énergie nucléaire.

-- Nombre de pays n'utilisant ni hydroélectrique ni renouvelable ni charbon
SELECT COUNT(Country)
FROM country 
WHERE 
	Hydro = 0 AND 
	Renewable = 0 AND 
	Coal = 0;

-- Nombre de pays n'utilisant ni hydroélectrique ni renouvelable mais utilisant du charbon
SELECT COUNT(Country)
FROM country 
WHERE 
	Hydro = 0 AND 
	Renewable = 0 AND 
	Coal > 0;

-- Pays avec une utilisation de charbon supérieure à 80 %
SELECT *
FROM country 
WHERE Coal > 80
ORDER BY Coal DESC;

-- Pays alimentés uniquement au gaz
SELECT * FROM country WHERE Gas = 100;

-- Pays principalement alimentés au pétrole
SELECT * FROM country WHERE Oil > 99 ORDER BY Oil DESC;

-- Pays alimentés à 100 % par l'hydroénergie
SELECT * FROM country WHERE Hydro = 100;

-- Pays consommant plus de la moitié de leurs besoins énergétiques à partir de sources renouvelables
SELECT *
FROM country 
WHERE Renewable > 50;

-- Pays consommant plus de la moitié de leurs besoins énergétiques à partir de sources nucléaires
SELECT *
FROM country 
WHERE Nuclear > 50
ORDER BY Nuclear DESC;

-- Pays consommant plus de 30 % d'énergie à partir de sources renouvelables et hydroélectriques
SELECT *
FROM country 
WHERE
	Renewable > 30 AND
	Hydro > 30;

-- Pays consommant principalement de l'énergie produite à partir de sources hydroélectriques ou renouvelables
SELECT *
FROM country 
WHERE
	(Renewable + Hydro) > 99
ORDER BY Hydro;

-- Union des noms de pays entre la table "country" et la table "world", avec une indication de la source
SELECT 'Country' as Source, Country FROM country UNION ALL SELECT 'World' as Source, Country FROM world ORDER BY Source DESC, Country;



 --- Autres analyses possibles :
--1. Pays ayant une utilisation significative d'énergie renouvelable et de sources hydroélectriques.**
   SELECT *
   FROM country 
   WHERE Renewable > 20 AND Hydro > 20;

--2. **Pays dont la consommation d'énergie nucléaire est en augmentation.**
   SELECT *
   FROM country 
   WHERE Nuclear > 20 AND Nuclear - Nuclear_1990 > 0;

--3. **Pays avec une diversification énergétique élevée (utilisant plusieurs sources d'énergie).**
   SELECT *
   FROM country 
   WHERE Coal > 0 AND Gas > 0 AND Hydro > 0 AND Renewable > 0 AND Nuclear > 0;

  -- 4. Pays avec une utilisation de charbon supérieure à 80 %
SELECT *
FROM country 
WHERE Coal > 80
ORDER BY Coal DESC;

-- 5. Pays alimentés uniquement au gaz
SELECT * FROM country WHERE Gas = 100;

-- 6. Pays principalement alimentés au pétrole
SELECT * FROM country WHERE Oil > 99 ORDER BY Oil DESC;

-- 7. Pays 100 % alimentés avec Hydroénergie
SELECT * FROM country WHERE Hydro = 100;

-- 8. Pays consommant plus de la moitié de leurs besoins énergétiques à partir de sources renouvelables
SELECT *
FROM country 
WHERE Renewable > 50;

-- 9. Pays consommant plus de la moitié de leurs besoins énergétiques à partir de sources nucléaires
SELECT *
FROM country 
WHERE Nuclear > 50
ORDER BY Nuclear DESC;

-- 10. Pays consommant plus de 30 % d'énergie à partir de sources renouvelables et hydroélectriques
SELECT *
FROM country 
WHERE
	Renewable > 30 AND
	Hydro > 30;

-- 11. Pays principalement consommateurs d'énergie produite à partir de sources hydroélectriques ou renouvelables
SELECT *
FROM country 
WHERE
	(Renewable + Hydro) > 99
ORDER BY Hydro;

-- 12. Union des noms de pays entre la table "country" et la table "world", avec une indication de la source
SELECT 'Country' as Source, Country FROM country UNION ALL SELECT 'World' as Source, Country FROM world ORDER BY Source DESC, Country;


  
  
  
  
  