/* JOB 2 */

-- 1. Noms de pays commençant par la lettre B.
SELECT Country FROM world
WHERE TRIM(Country) 
LIKE 'b%';

-- 2. Noms de pays commençant par “Al”.
SELECT Country FROM world
WHERE TRIM(Country) 
LIKE 'Al%';

-- 3. Noms de pays finissant par la lettre y.
SELECT Country FROM world
WHERE TRIM(Country) 
LIKE '%y';

-- 4. Noms de pays finissant par “land”.
SELECT Country FROM world
WHERE TRIM(Country) 
LIKE '%land';

-- 5. Noms de pays contenant la lettre w.
SELECT Country FROM world
WHERE TRIM(Country) 
LIKE '%w%';

-- 6. Noms de pays contenant “oo” ou “ee”.
SELECT Country FROM world
WHERE TRIM(Country) 
LIKE '%oo%' OR TRIM(Country) LIKE '%ee%';

-- 7. Noms de pays contenant au moins trois fois la lettre a.
SELECT Country FROM world
WHERE (LENGTH(TRIM(Country)) - LENGTH(REPLACE(TRIM(Country), 'a', ''))) >= 3;
  
-- 8. Noms de pays ayant la lettre r comme seconde lettre.
SELECT Country FROM world
WHERE TRIM(Country) 
LIKE '_r%';
