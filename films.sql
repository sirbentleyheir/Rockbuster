-- In pgAdmin 4, I ran the following queries: Film, Genres, and Categories.

-- Check existing film genres in the category table.

SELECT name, category_id FROM category 

-- Add new Genres...
-- Added five new genres: Thriller, Crime, Mystery, Romance, and War.

INSERT INTO category
(category_id,name) 
VALUES (17,’Thriller’)

INSERT INTO category
(category_id,name) 
VALUES (18,’Crime’)

INSERT INTO category
(category_id,name) 
VALUES (19,’Mystery’)

INSERT INTO category
(category_id,name) 
VALUES (20,’Romance’)

INSERT INTO category
(category_id,name) 
VALUES (21,’War’)

-- Update a film.
-- African Egg is the name of a film. The Film ID for African Egg is 5. The Category ID for Thriller is 17.
-- I used film_id (5) to view the category_id (currently: 8) for African Egg. 
-- Then, I updated the category_id for African Egg to make it as Thriller. 

SELECT film_id, title FROM film 
UPDATE film_category
SET category_id = 17
WHERE film_id = 5 

-- Delete a Genre 
-- I deleted 'Mystery'

DELETE FROM category
WHERE category_id = 19 

-- Order the data 
-- I selected every film from the film table, with the films sorted by title from A to Z.
-- Then sorted by most recent release year.
-- Then sorted by highest to lowest rental rate. 

SELECT title, release_year, rental_rate
FROM film 
ORDER BY rental_rate DESC, title 

-- See Rockbuster.csv 

-- Group the data 
-- I grouped the number of films in rating and rental_rate groups. 

SELECT rating, rental_rate, COUNT (film_id) 
FROM film 
GROUP BY rating, rental_rate 
ORDER BY rating. rental_rate 

-- Find the average rental rate for each rating category. 

SELECT rating, AVG (rental_rate)
FROM film 
GROUP BY rating 
ORDER BY rating 

-- Find the minimum and maximum rental durations for each rating category.  

SELECT rating, MIN (rental_duration), MAX (rental_duration) 
FROM film 
GROUP BY rating
ORDER BY rating 
