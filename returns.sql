-- I ran SQL queries to return a list of films that meet the following conditions. 
-- Results tables include the columns "film_id", "title", and "description". 

-- Film title contains the word Uptowm in any position 

SELECT film_id, title, description 
FROM film
WHERE title = '%Uptown%'

-- Film length is more than 120 minutes and rental rate is more than 2.99 

SELECT film_id, title, description 
FROM film 
WHERE length > 120 AND rental_rate > 2.99 
ORDER BY film_id 

-- Rental duration is between 3 and 7 days 

SELECT film_id, title, description 
FROM film 
WHERE rental_duration BETWEEN 3 and 7 
ORDER BY rental_duration, title 

-- Film replacment cost is less than 14.99 

SELECT film_id, title, description, replacement_cost 
FROM film 
WHERE replacement_cost DESC, title 

-- Film rating is either PG or G 

SELECT film_id, title, description, rating 
FROM film 
WHERE rating IN ('PG', 'G')
ORDER BY rating, film_id 
