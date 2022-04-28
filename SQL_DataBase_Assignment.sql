USE [db_zooTest2]

/* ZOO DATABASE ASSIGNMENT #1 */
SELECT * FROM tbl_habitat;

/* ZOO DATABASE ASSIGNMENT #2 */
SELECT species_name 
FROM tbl_species 
WHERE species_order = 3;

/* ZOO DATABASE ASSIGNMENT #3 */
SELECT nutrition_type 
FROM tbl_nutrition 
WHERE nutrition_cost <= 600.00;

/* ZOO DATABASE ASSIGNMENT #4 */
SELECT species_name, species_nutrition
FROM tbl_species
WHERE species_nutrition >= 2202 AND species_nutrition <= 2206;


/* ZOO DATABASE ASSIGNMENT #5 */
SELECT s.species_name AS [Species Names:] , n.nutrition_type AS [Nutrition Type:]
FROM tbl_species AS s , tbl_nutrition AS n
WHERE S.species_nutrition = N.nutrition_id;

/* ZOO DATABASE ASSIGNMENT #6 */
/*Solution 1*/
SELECT s.specialist_fname, s.specialist_lname, s.specialist_contact
FROM tbl_specialist AS s, tbl_species , tbl_care
WHERE tbl_species.species_name = 'penguin' AND tbl_species.species_care = tbl_care.care_id AND tbl_care.care_specialist = s.specialist_id ;
/* Solution 2*/
SELECT
B.specialist_fname, B.specialist_lname, B.specialist_contact
FROM tbl_species s
INNER JOIN tbl_care A ON A.care_id = s.species_care
INNER JOIN tbl_specialist B ON B.specialist_id = A.care_specialist
WHERE species_name = 'penguin'
;

/* ZOO DATABASE ASSIGNMENT #7 */
CREATE DATABASE db_Movies
USE [db_Movies]

CREATE TABLE actor_table (
actor_id INT	PRIMARY KEY NOT NULL IDENTITY(100,1),
actor_name VARCHAR(50) NOT NULL,
actor_age INT NOT NULL,
);


CREATE TABLE director_table (
director_id INT	PRIMARY KEY NOT NULL IDENTITY(1,1),
director_name VARCHAR(50) NOT NULL,
movie_name VARCHAR(50) NOT NULL,
fk_actor_id INT NOT NULL CONSTRAINT fk_actor_id FOREIGN KEY REFERENCES actor_table(actor_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT INTO actor_table
(actor_name, actor_age)
VALUES
('Jared Leto', 50),
('Sandra Bullock', 57),
('Eddie Redmayne', 40),
('Robert Pattinson', 35),
('Jim Carrey', 60)
;

INSERT INTO director_table
(director_name, movie_name, fk_actor_id)
VALUES
('Daniel Espinosa', 'Morbius (2022)', 100),
('Aaron Nee and Adam Nee', 'The Lost City (2022)', 101),
('David Yates', 'Fantastic Beasts: The Secrets of Dumbledore (2022)', 102),
('Aaron Sorkin', 'The Trial of the Chicago 7 (2020)', 102),
('Matt Reeves', 'The Batman (2022)', 103),
('Christopher Nolan', 'Tenet (2020)', 103),
('Jeff Fowler', 'Sonic the Hedgehog 2 (2022)', 104),
('Mark Waters', 'Mr. Popper''s Penguins(2011)', 104)
;

SELECT  actor_table.actor_name, director_table.movie_name
FROM	actor_table, director_table
WHERE	director_table.fk_actor_id = actor_table.actor_id;

