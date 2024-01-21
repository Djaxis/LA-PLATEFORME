/* JOB 7 */

CREATE TABLE game (
    id INT PRIMARY KEY,
    mdate DATE,
    stadium VARCHAR(100),
    team1 CHAR(3),
    team2 CHAR(3),
    FOREIGN KEY (team1) REFERENCES eteam(id),
    FOREIGN KEY (team2) REFERENCES eteam(id)
);

-- FOREIGN KEY (team1) REFERENCES eteam(id), FOREIGN KEY (team2) REFERENCES eteam(id): 
-- Ces parties définissent des clés étrangères (FOREIGN KEY) sur les colonnes "team1" et "team2". 
-- Elles spécifient que les valeurs de ces colonnes doivent correspondre aux valeurs de la colonne "id" de la table "eteam".
-- En d'autres termes, les équipes spécifiées dans "team1" et "team2" doivent être des enregistrements valides dans la table "eteam".

CREATE TABLE goal (
    matchid INT,
    teamid CHAR(3),
    player VARCHAR(50),
    gtime INT,
    PRIMARY KEY (matchid, gtime),
    FOREIGN KEY (matchid) REFERENCES game(id),
    FOREIGN KEY (teamid) REFERENCES eteam(id)
);

CREATE TABLE eteam (
    id CHAR(3) PRIMARY KEY,
    teamname VARCHAR(50),
    coach VARCHAR(50)
);

INSERT INTO game (id, mdate, stadium, team1, team2) VALUES
(1001, '8 June 2012', 'National Stadium, Warsaw', 'POL', 'GRE'),
(1002, '8 June 2012', 'Stadion Miejski (Wroclaw)', 'RUS', 'CZE'),
(1003, '12 June 2012', 'Stadion Miejski (Wroclaw)', 'GRE', 'CZE'),
(1004, '12 June 2012', 'National Stadium, Warsaw', 'POL', 'RUS');

INSERT INTO goal (matchid, teamid, player, gtime) VALUES
(1001, 'POL', 'Robert Lewandowski', 17),
(1001, 'GRE', 'Dimitris Salpingidis', 51),
(1002, 'RUS', 'Alan Dzagoev', 15),
(1002, 'RUS', 'Roman Pavlyuchenko', 82);

INSERT INTO eteam (id, teamname, coach) VALUES
('POL', 'Poland', 'Franciszek Smuda'),
('RUS', 'Russia', 'Dick Advocaat'),
('CZE', 'Czech Republic', 'Michal Bilek'),
('GRE', 'Greece', 'Fernando Santos');

-- 1. Les cardinalités:
/* eteam 1..1 plays in game 0..* means that a team can have zero or more game records related to it
 * goal 0..* scored in game 1..1 means that zero or more goals can be scored in one game
 * goal 0..* scored for eteam 1..1 means that zero or more goals can be related to one team*/

-- 2. Numéro de match et le nom du joueur pour tous les buts marqués par l'Allemagne.
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';

-- 3. Les colonnes id, stadium, team1, team2 pour le match dont l’id est 1012.
SELECT id, stadium, team1, team2 
FROM game 
WHERE id = 1012;

-- 4. Player, teamid, stadium et mdate de chaque but allemand.
SELECT player, teamid, stadium, mdate
FROM goal
JOIN game ON (matchid=id)
WHERE teamid = 'GER';

-- 5. team1, team2 et player pour chaque but marqué par un joueur appelé Mario.
SELECT team1, team2, player
FROM GOAL
JOIN game ON (matchid=id)
WHERE player 
LIKE 'Mario%';

-- 6. Joindre la table goal et la table eteam sur les clés id - teamid.
SELECT * FROM eteam e JOIN goal g ON e.id = g.teamid;

-- 7. player, teamid, coach, gtime pour tous les buts marqués dans les 10 premières minutes des matchs.
SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON teamid=id
WHERE gtime < 10;

-- 8.  Les dates des matches ainsi que le nom de l'équipe dont "Fernando Santos" était le coach de l’équipe team1.
SELECT mdate, teamname
FROM game AS g
JOIN eteam e ON g.team1 = e.id
WHERE coach = 'Fernando Santos';

-- 9. La liste des joueurs pour chaque but marqué lors d'un match dont le stade était le “National Stadium, Warsaw”.
SELECT player 
FROM goal
JOIN game ON matchid=id
WHERE stadium = 'National Stadium, Warsaw';

-- 10. Nombre total de buts marqués pour chaque équipe de la table goal.
SELECT teamid AS Team, count(teamid) as 'Total number of goals'
FROM goal
GROUP BY teamid;

-- 11. Les stades et le nombre de buts marqués dans chacun des stades de la jointure de game-goal.
SELECT stadium, COUNT(matchid) AS number_of_goals
FROM game
JOIN goal ON id=matchid
GROUP BY stadium;

-- 12. id du match, la date du match et le nombre de buts marqués par "FRA" pour chaque match où l’équipe de France a marqué
SELECT id, mdate, COUNT(matchid) AS number_of_goals
FROM game
JOIN goal ON id=matchid
WHERE 'FRA' IN (team1, team2);