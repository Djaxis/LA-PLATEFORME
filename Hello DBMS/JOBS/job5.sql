/* JOB 5 */

-- 1. Pays dont la population est supérieure à celle de "Russia".
SELECT * FROM world WHERE 
  CAST(TRIM(Population) AS INTEGER) > (SELECT CAST(TRIM(Population) AS INTEGER) 
  FROM world WHERE TRIM(Country) = 'Russia')
  ORDER BY CAST(TRIM(Population) AS INTEGER);

-- 2. Pays d'Europe dont le PIB par habitant est supérieur à celui d’ "Italy".
SELECT * FROM world WHERE 
CAST(TRIM("GDP ($ per capita)") AS INTEGER) >
SELECT CAST(TRIM("GDP ($ per capita)") AS INTEGER) FROM world WHERE TRIM(Country) = 'Italy')
ORDER BY CAST(TRIM("GDP ($ per capita)") AS INTEGER);
 
-- 3. Pays dont la population est supérieure à celle du Royaume-Uni mais inférieure à celle de l'Allemagne.
SELECT * FROM world WHERE 
CAST(TRIM(Population) AS INTEGER) >
(SELECT CAST(TRIM(Population) AS INTEGER) FROM world WHERE TRIM(Country) = 'United Kingdom') AND
CAST(TRIM(Population) AS INTEGER) <
(SELECT CAST(TRIM(Population) AS INTEGER) FROM world WHERE TRIM(Country) = 'Germany')
ORDER BY CAST(TRIM(Population) AS INTEGER);
  
-- 4. Nom et la population de chaque pays d'Europe, en pourcentage  PAR RAPPORT A   la population de l'Allemagne.
SELECT Country, CAST(CAST((CAST(TRIM(Population) AS FLOAT) / (SELECT CAST(TRIM(Population) AS FLOAT) 
FROM world WHERE TRIM(Country) = 'Germany')) * 100 AS INTEGER) AS VARCHAR) || '%' AS Percentage
FROM world 
WHERE TRIM(Region) LIKE '%EUROPE%' OR TRIM(Region) LIKE '%BALTICS%';

-- 5. Plus grand pays de chaque continent, en indiquant son continent, son nom et sa superficie.
SELECT Region, Country, MAX(CAST(TRIM("Area (sq. mi.)") AS INTEGER)) AS "Area (sq. mi.)"
FROM world
GROUP BY TRIM(Region);
        
-- 6. Continents où tous les pays ont une population inférieure ou égale à 25 000 000.
SELECT Country
FROM world
WHERE CAST(TRIM(Population) AS INTEGER) <= 25000000;
