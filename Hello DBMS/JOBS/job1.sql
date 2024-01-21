/* JOB 1*/

-- 1. Population de “Germany”:
SELECT Country, Population
FROM world
WHERE TRIM(Country) = 'Germany';

-- 2. Afficher le nom et la population des pays “Sweden”, “Norway” et “Denmark”:
SELECT Country, Population
FROM world 
WHERE TRIM(Country) IN ('Sweden', 'Norway', 'Denmark');

-- 3. Afficher les pays dont la superficie est supérieure à 200 000 mais inférieure à 300 000 
SELECT *
FROM world
WHERE CAST(TRIM("Area (sq. mi.)") AS INTEGER) > 200000 AND CAST(TRIM("Area (sq. mi.)") AS INTEGER) < 300000;