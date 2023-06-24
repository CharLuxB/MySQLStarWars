USE starwars;

SELECT * FROM Info;
SELECT * FROM Titles;
SELECT * FROM Directors;
SELECT * FROM Producers;
SELECT * FROM Works_with;

-- session 4 INNER JOIN: I want to see each film's title and when it was made(decade)
SELECT i.film_id, i.decade, t.film_title
FROM Info i
INNER JOIN Titles t 
ON i.film_id = t.film_id;

-- session 4 UNION: I want to see a list of all directors and producers
SELECT d.dir_surname AS surname, d.dir_name AS name
FROM directors d
UNION
SELECT p.pro_surname, p.pro_name
FROM producers p;

-- session 4 SUBQUERIES: find the producer id of teams who made 1.3B or more in revenue
SELECT w.pro_id
FROM works_with w
WHERE w.team_id IN(
SELECT i.team_id
FROM info i
WHERE i.revenue_in_M >= 1300);

-- session 4 SUBQUERIES: find the director id of the team who made film 10
SELECT w.dir_id
FROM works_with w
WHERE w.team_id IN(
SELECT i.team_id
FROM info i
WHERE film_id = 10);

-- Session 4 NESTED QUERIES: In which film (film id) did George Lucas (id 301) worked?
SELECT i.film_id
FROM info i
WHERE team_id IN(
SELECT w.team_id
FROM works_with w
WHERE w.dir_id = 301);

-- session 4: RIGHT JOIN
SELECT i.film_id, i.imdb_score, t.film_title
FROM Info i
RIGHT JOIN Titles t 
ON i.film_id = t.film_id;

SELECT t.film_id, t.film_title, i.decade, i.imdb_score
FROM Titles t 
LEFT JOIN Info i
ON t.film_id = i.film_id;
