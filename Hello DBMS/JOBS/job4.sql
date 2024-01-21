/* JOB 4 */

SELECT * FROM nobel

-- 1. Les prix nobels de 1986.
SELECT * FROM nobel 
WHERE yr >= 1986;

-- 2. Les prix nobels de littérature de 1967.
SELECT * FROM nobel 
WHERE subject = 'Literature';

-- 3. L’année et le sujet du prix nobel d’Albert Einstein.
SELECT yr, subject FROM nobel 
WHERE winner = 'Albert Einstein';

-- 4. Les détails (année, sujet, lauréat) des lauréats du prix de Littérature de 1980 à 1989 inclus.
SELECT yr, subject, winner FROM nobel 
WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989;

-- 5. Les détails des lauréats du prix de Mathématiques.
SELECT * FROM nobel 
WHERE subject = 'Mathematics';

-- Combien y en a-t-il ?
SELECT COUNT(*) FROM nobel 
WHERE subject = 'Mathematics';
