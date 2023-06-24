Use Starwars;

-- session 3 key point: which films costed less than 20M and won at least 1 oscar?
SELECT i.film_id, i.budget_in_M, i.oscars_won
FROM Info i
WHERE i.budget_in_M < 20 AND i.oscars_won >= 1;

-- session 3 key point: what are the names of the films 4 to 6?
SELECT t.film_title, film_id
FROM Titles t
WHERE t.film_id BETWEEN 4 AND 6;

-- session 3 key point: which titles have the word 'Jedi' in?
SELECT t.film_id, t.film_title
FROM Titles t
WHERE t.film_title LIKE '%Jedi%';

-- session 3 key point: which directors have the name George, Bob or Ron?
SELECT d.dir_name, d.dir_surname
FROM Directors d
WHERE d.dir_name IN ('George', 'Ron', 'Bob');

-- session 3 key point: which films won an oscar and how many?
SELECT i.film_id, i.oscars_won
FROM Info i
WHERE i.oscars_won IS NOT NULL;

-- session 3 key point: order the producers alphabetically by surname, limit to 3
SELECT p.pro_name, p.pro_surname
FROM Producers p
ORDER BY p.pro_surname
LIMIT 3;

-- session 3 key point: how many films were made in the 2000s?
SELECT COUNT(i.film_id)
FROM Info i
WHERE i.decade = 2000;

-- session 3 key point: what was the smallest budget for a starwars film?
SELECT 
MIN(i.budget_in_M) AS lowest_budget
FROM Info i;

-- session 3 key point: what was the largest revenue for a starwars film?
SELECT MAX(i.revenue_in_M) AS largest_revenue
FROM Info i;

-- session 3 key point: how many different genders are in the directors list?
SELECT COUNT(DISTINCT d.dir_gender)
FROM Directors d;

-- session 3 key point: how much money did team 205 made?
SELECT SUM(i.revenue_in_M)
FROM Info i 
WHERE team_id = 205;

-- session 3: find the total (sum) revenue made by each team by decade
Use Starwars;
SELECT * FROM info;
SELECT SUM(info.revenue_in_M), info.team_id, info.decade
FROM info
GROUP BY info.team_id, info.decade;

-- session 3 key point: what was the average budget of team 204?
SELECT AVG(i.budget_in_M)
FROM Info i 
WHERE team_id = 204;

-- session 3 key point: how many different genders are in the producers list? what are they?
SELECT COUNT(p.pro_gender), p.pro_gender
FROM Producers p
GROUP BY p.pro_gender;

-- session 3 key point: on average, how much money did each team made?
SELECT AVG(i.revenue_in_M), i.team_id
FROM Info i 
GROUP BY i.team_id;

-- session 3 key point: find the number of films made in each decade, but 
-- session 3 key point: only include the decades where films scored on average 70 or higher on imdb
SELECT COUNT(i.film_id), i.decade
FROM info i
GROUP BY i.decade
HAVING AVG(i.imdb_score) >= 70;

-- session 3: find all film records that took place in the 2010s with an imdb score higher than 68,
-- made by team 205 or team 207
 SELECT * FROM info
 WHERE 
	decade = 2010
    AND 
    (team_id= 205 OR team_id = 207)
    AND
    imdb_score > 68;
    
-- session 3: find out how many films where made in each decade
SELECT i.decade, COUNT(*) AS number_of_films
FROM info i 
GROUP BY decade
ORDER BY decade DESC;
SELECT COUNT(i.film_id) AS number_of_films, i.decade
FROM info i
GROUP BY i.decade
ORDER BY decade;

