/* JOB 6 */

-- 1. Population totale du monde.
SELECT SUM(CAST(TRIM(Population) AS INTEGER)) AS Total_world_population
FROM world;

-- 2. Population totale de chacun des continents.
SELECT Region, SUM(CAST(TRIM(Population) AS INTEGER)) AS Total_population
FROM world
GROUP BY TRIM(Region);

-- 3. PIB total du continent de chacun des continents.
SELECT Region, SUM(CAST(TRIM("GDP ($ per capita)") AS INTEGER)) AS Total_GDP
FROM world
GROUP BY TRIM(Region);

-- 4. PIB total du continent africain.
SELECT 'Africa' AS Region, SUM(CAST(TRIM("GDP ($ per capita)") AS INTEGER)) AS Total_GDP
FROM world
WHERE TRIM(Region) 
LIKE '%AFRICA%';

-- 5. Nombre de pays ayant une superficie supérieure ou égale à 1 000 000m².
SELECT COUNT(Country) AS Number_of_countries
FROM world 
WHERE CAST(TRIM("Area (sq. mi.)") AS INTEGER) >= 1000000;

-- 6. Population totale des pays suivants : Estonia, Latvia, Lithuania.
SELECT SUM(CAST(TRIM(Population) AS INTEGER)) AS Population_Baltics
FROM world 
WHERE TRIM(Country) IN ('Estonia', 'Latvia', 'Lithuania');

-- 7. Nombre de pays de chaque continent.
SELECT Region, COUNT(Country) AS 'Number of countries'
FROM world
GROUP BY TRIM(Region);

-- 8. Continents ayant une population totale d’au moins 100 millions d’individus.
SELECT Region, SUM(CAST(TRIM(Population) AS INTEGER)) AS Population
FROM world
GROUP BY TRIM(Region)
HAVING SUM(CAST(TRIM(Population) AS INTEGER)) < 100000000;