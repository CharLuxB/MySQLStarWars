Use Starwars;

-- session 1 key point: what are the name and surname of all directors?
SELECT 
d.dir_name, d.dir_surname
FROM directors d;


-- session 2 key point: what are the names of the female producers?
SELECT 
p.pro_name, p.pro_surname
FROM producers p
WHERE pro_gender = 'F';



-- session 2 key point: set oscars_won value of 6 for film1, 2 for film2 and 1 for film3
UPDATE Info
SET
oscars_won = 6
WHERE
film_id = 1;
UPDATE Info
SET
oscars_won = 2
WHERE
film_id = 2;
UPDATE Info
SET
oscars_won = 1
WHERE
film_id = 3;

-- check it has worked
-- SELECT * FROM info;

-- session 2 key point: in which distinct decades were the starwars films made?
SELECT DISTINCT
i.decade
FROM info i;

-- session 2 key point: delete the column called 'oscars_won'
-- ALTER TABLE info DROP column oscars_won;

