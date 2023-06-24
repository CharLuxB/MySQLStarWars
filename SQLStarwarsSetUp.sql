-- create new schema and using it
CREATE DATABASE Starwars;
USE Starwars;

-- create five tables, each with PK and a few with FK using cascade action

CREATE TABLE Titles(
film_id INTEGER AUTO_INCREMENT,
film_title VARCHAR(255) NOT NULL,
CONSTRAINT
pk_film_id
PRIMARY KEY
(film_id)
);

CREATE TABLE Directors(
dir_id INTEGER,
dir_name VARCHAR(255),
dir_surname VARCHAR(255) NOT NULL,
dir_gender VARCHAR(20),
CONSTRAINT
pk_dir_id
PRIMARY KEY
(dir_id)
);

CREATE TABLE Producers(
pro_id INTEGER,
pro_name VARCHAR(255),
pro_surname VARCHAR(255) NOT NULL,
pro_gender VARCHAR(20),
CONSTRAINT
pk_pro_id
PRIMARY KEY
(pro_id)
);

CREATE TABLE Works_with(
team_id INTEGER,
dir_id INTEGER,
pro_id INTEGER,
CONSTRAINT
pk_team_id
PRIMARY KEY
(team_id),
CONSTRAINT
fk_dir_id
FOREIGN KEY
(dir_id)
REFERENCES Directors(dir_id)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
CONSTRAINT
fk_pro_id
FOREIGN KEY
(pro_id)
REFERENCES Producers(pro_id)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Info (
film_id INTEGER AUTO_INCREMENT PRIMARY KEY,
decade INTEGER,
team_id INTEGER,
budget_in_M INTEGER,
revenue_in_M INTEGER,
imdb_score INTEGER,
oscars_won INTEGER DEFAULT NULL,
CONSTRAINT
fk_film_id_info
FOREIGN KEY
(film_id)
REFERENCES Titles(film_id)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
CONSTRAINT
fk_team_id
FOREIGN KEY
(team_id)
REFERENCES Works_with(team_id)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- insert all necessary info 
-- apart from film_id as it is set to auto_increment

INSERT INTO Titles
(film_title)
VALUES
('A New Hope'),
('The Empire Strikes Back'),
('Return of the Jedi'),
('The Phantom Menace'),
('Attack of the Clones'),
('Revenge of the Sith'),
('The Force Awakens'),
('Rogue One: A Star Wars Story'),
('The last Jedi'),
('Solo: A Star Wars Story'),
('The Rise of Skywalker'),
('TBC Dawn of the Jedi'),
('Untitled Dave Filoni project'),
('Untitled Sharmeen Obaid-Chinoy project');
-- Check insert worked: SELECT * FROM Titles;

INSERT INTO Directors
(dir_id, dir_name, dir_surname, dir_gender)
VALUES
(301, 'George', 'Lucas', 'M'),
(302, 'Irvin', 'Kershner', 'M'),
(303, 'Richard', 'Marquand', 'M'),
(304, 'JJ', 'Abrams', 'M'),
(305, 'Rian', 'Johnson', 'M'),
(306, 'Gareth', 'Edwards', 'M'),
(307, 'Ron', 'Howard', 'M');
-- Check insert worked: SELECT * FROM Directors;

INSERT INTO Producers
(pro_id, pro_name, pro_surname, pro_gender)
VALUES
(401, 'Gary', 'Kurtz', 'M'),
(402, 'Hilary', 'Kazajian', 'F'),
(403, 'Rick', 'McCallum', 'M'),
(404, 'Kathleen', 'Kennedy', 'F');
-- Check insert worked: SELECT * FROM Producers;

INSERT INTO Works_with
(team_id, dir_id, pro_id)
VALUES
(201, 301, 401),
(202, 302, 401),
(203, 303, 402),
(204, 301, 403),
(205, 304, 404),
(206, 305, 404),
(207, 306, 404),
(208, 307, 404);
-- Check insert worked: SELECT * FROM Works_with;

INSERT INTO Info
(film_id, decade, team_id, budget_in_M, revenue_in_M, imdb_score)
VALUES
(1, 1970, 201,  11,  775, 86),
(2, 1980, 202,  18,  538, 87),
(3, 1980, 203,  33,  475, 83),
(4, 1990, 204, 115, 1027, 65),
(5, 2000, 204, 115,  653, 66),
(6, 2000, 204, 113,  868, 76),
(7, 2010, 205, 446, 2071, 78),
(8, 2010, 207, 265, 1058, 78),
(9, 2010, 206, 317, 1334, 69),
(10, 2010, 208, 300,  392, 69),
(11, 2010, 205, 416, 1077, 65);
-- Check insert worked: SELECT * FROM Info;