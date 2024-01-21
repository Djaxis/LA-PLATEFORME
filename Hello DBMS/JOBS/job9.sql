/* JOB 9 */

SELECT Country, Region, Population, "Area (sq. mi.)", "Pop. Density (per sq. mi.)", "Coastline (coast/area ratio)", "Net migration", "Infant mortality (per 1000 births)", "GDP ($ per capita)", "Literacy (%)", "Phones (per 1000)", "Arable (%)", "Crops (%)", "Other (%)", Climate, Birthrate, Deathrate, Agriculture, Industry, Service
FROM world;

SELECT
    TRIM(Country) AS Country,
    TRIM(Region) AS Region,
    CAST(NULLIF(TRIM(Population), '') AS INTEGER) AS Population,
    CAST(NULLIF(TRIM("Area (sq. mi.)"), '') AS INTEGER) AS Area,
    CAST(REPLACE(NULLIF(TRIM("Pop. Density (per sq. mi.)"), ''), ',', '.') AS FLOAT) AS Population_Density,
    CAST(REPLACE(NULLIF(TRIM("Coastline (coast/area ratio)"), ''), ',', '.') AS FLOAT) AS Coastline_Ratio,
    CAST(REPLACE(NULLIF(TRIM("Net migration"), ''), ',', '.') AS FLOAT) AS Net_migration,
    CAST(REPLACE(NULLIF(TRIM("Infant mortality (per 1000 births)"), ''), ',', '.') AS FLOAT) AS Infant_Mortality,
    CAST(NULLIF(TRIM("GDP ($ per capita)"), '') AS INTEGER) AS GDP_Per_Capita,
    CAST(REPLACE(NULLIF(TRIM("Literacy (%)"), ''), ',', '.') AS FLOAT) AS Literacy,
    CAST(REPLACE(NULLIF(TRIM("Phones (per 1000)"), ''), ',', '.') AS FLOAT) AS Phones_Per_1000,
    CAST(REPLACE(NULLIF(TRIM("Arable (%)"), ''), ',', '.') AS FLOAT) AS Arable,
    CAST(REPLACE(NULLIF(TRIM("Crops (%)"), ''), ',', '.') AS FLOAT) AS Crops,
    CAST(REPLACE(NULLIF(TRIM("Other (%)"), ''), ',', '.') AS FLOAT) AS Other,
    CAST(NULLIF(TRIM(Climate), '') AS INTEGER) AS Climate,
    CAST(REPLACE(NULLIF(TRIM(Birthrate), ''), ',', '.') AS FLOAT) AS Birthrate,
    CAST(REPLACE(NULLIF(TRIM(Deathrate), ''), ',', '.') AS FLOAT) AS Deathrate,
    CAST(REPLACE(NULLIF(TRIM(Agriculture), ''), ',', '.') AS FLOAT) AS Agriculture,
    CAST(REPLACE(NULLIF(TRIM(Industry), ''), ',', '.') AS FLOAT) AS Industry,
    CAST(REPLACE(NULLIF(TRIM(Service), ''), ',', '.') AS FLOAT) AS Service
FROM world;

--1. Analyse de la Literacy (%)
SELECT 
    AVG(TRIM("Literacy (%)")) AS average_literacy,
    MAX(TRIM("Literacy (%)")) AS max_literacy,
    MIN(TRIM("Literacy (%)")) AS min_literacy
FROM world;

-- 2. Analyse du Net migration
SELECT 
    TRIM("Country") AS Country,
    TRIM("Net migration") AS Net_migration
FROM world
ORDER BY TRIM("Net migration") DESC
LIMIT 10;

--3. Analyse du Birthrate
SELECT 
    TRIM("Region") AS Region,
    AVG(TRIM("Birthrate")) AS average_birthrate
FROM world
GROUP BY TRIM("Region");

--4. Analyse du Deathrate
SELECT 
    TRIM("Country") AS Country,
    TRIM("Deathrate") AS Deathrate
FROM world
ORDER BY TRIM("Deathrate") DESC
LIMIT 10;

-- 5. Analyse de l'Infant mortality
SELECT 
    TRIM("Region") AS Region,
    AVG(TRIM("Infant mortality (per 1000 births)")) AS average_infant_mortality
FROM world
GROUP BY TRIM("Region");

--6. Analyse de l'Arable (%)
SELECT 
    AVG(TRIM("Arable (%)")) AS average_arable,
    MAX(TRIM("Arable (%)")) AS max_arable,
    MIN(TRIM("Arable (%)")) AS min_arable
FROM world;

-- 7. Analyse de la Crops (%)
SELECT 
    AVG(TRIM("Crops (%)")) AS average_crops,
    MAX(TRIM("Crops (%)")) AS max_crops,
    MIN(TRIM("Crops (%)")) AS min_crops
FROM world;

--8. Analyse de la GDP ($ per capita)
SELECT 
    TRIM("Region") AS Region,
    AVG(TRIM("GDP ($ per capita)")) AS average_gdp
FROM world
GROUP BY TRIM("Region");

--9. Analyse de la Coastline (coast/area ratio)
SELECT 
    TRIM("Region") AS Region,
    AVG(TRIM("Coastline (coast/area ratio)")) AS average_coastline
FROM world
GROUP BY TRIM("Region");

--10. Analyse de la Phones (per 1000)
SELECT 
    TRIM("Region") AS Region,
    AVG(TRIM("Phones (per 1000)")) AS average_phones
FROM world
GROUP BY TRIM("Region"); 

--11. Analyse de la Pop. Density (per sq. mi.)
SELECT 
    TRIM("Region") AS Region,
    AVG(TRIM("Pop. Density (per sq. mi.)")) AS average_population_density
FROM world
GROUP BY TRIM("Region"); 

--12. Analyse de la Service
SELECT 
    AVG(TRIM("Service")) AS average_service,
    MAX(TRIM("Service")) AS max_service,
    MIN(TRIM("Service")) AS min_service
FROM world;

