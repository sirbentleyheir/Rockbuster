-- Here is a SQL query with a common table expression. 

WITH category_name_cte (film_id, rating, category_name) AS
  (SELECT A.film_id,
          A.rating,
          C.name
  FROM film A 
  LEFT JOIN film_category B ON A.film_id = B.film_id 
  LEFT JOIN catergory C ON B.category_id = C.category_id) 

-- In order to create a common table expression, a review of a subquery is needed.

-- SUBQUERY 

SELECT AVG(total_amount_paid) AS avg_amount_paid, first_name 
FROM 
    (SELECT   A.payment_id, 
              A.customer_id,
              A.amount,
              B.first_name, 
              B.last_name, 
              D.city, 
              E.country, 
              SUM(amount) AS total_amount_paid 
  FROM payment A 
  INNER JOIN customer B ON A.customer_id = B.customer_id 
  INNER JOIN address C ON B.address_id = C.address_id 
  INNER JOIN city D ON C.city_id = D.city_id 
  INNER JOIN country E ON D.country_id = E.country_id 
  WHERE city IN   ('Aurora', 
                'Poos de Caldas', 
                'Belm', 
                'Luziinia',
                'Goinia', 
                'Blumenau', 
                'guas Lindas de Gois', 
                'Aparacedia de Goinia', 
                'Maring', 
                'Vila Velha') 
  GROUP BY amount, country, city, first_name, last_name, payment_id 
  ORDER BY amount DESC 
  LIMIT 10) AS average 
GROUP BY first_name 
LIMIT 5; 

-- CTE 
-- Based on the subquery above, a common table expression is created as followed. 

WITH average_cte (payment_id, customer_id, amount, first_name, city, country, total_amount_paid_ AS 

(SELECT   A.payment_id, 
            A.customer_id, 
            A.amount, 
            B.first_name, 
            B.last_name, 
            D.city,
            E.country, 
            SUM(amount) AS total_amount_paid 
   FROM payment A 
   INNER JOIN customer B ON A.customer_id = B.customer_id 
   INNER JOIN address C ON B.address_id = C.address_id 
   INNER JOIN city D ON C.city_id = D.city_id 
   INNER JOIN country E ON D.country_id = E.country_id 
   WHERE city IN  ('Aurora', 
                'Poos de Caldas', 
                'Belm', 
                'Luziinia',
                'Goinia', 
                'Blumenau', 
                'guas Lindas de Gois', 
                'Aparacedia de Goinia', 
                'Maring', 
                'Vila Velha') 
  GROUP BY amount, country, city, first_name, last_name, payment_id 
  ORDER BY amount DESC 
  LIMIT 10) AS average 
GROUP BY first_name 
LIMIT 5; 

-- SUBQUERY 2 

SELECT  country, 
        COUNT(customer_id) AS all_customer_count, 
        COUNT(average) AS top_customer_count 
FROM 
    (SELECT   A.payment_id, 
            A.customer_id, 
            A.amount, 
            B.first_name, 
            B.last_name, 
            D.city,
            E.country, 
            SUM(amount) AS total_amount_paid 
   FROM payment A 
   INNER JOIN customer B ON A.customer_id = B.customer_id 
   INNER JOIN address C ON B.address_id = C.address_id 
   INNER JOIN city D ON C.city_id = D.city_id 
   INNER JOIN country E ON D.country_id = E.country_id 
   WHERE city IN  ('Aurora', 
                'Poos de Caldas', 
                'Belm', 
                'Luziinia',
                'Goinia', 
                'Blumenau', 
                'guas Lindas de Gois', 
                'Aparacedia de Goinia', 
                'Maring', 
                'Vila Velha') 
  GROUP BY amount, country, city, first_name, last_name, payment_id 
  ORDER BY amount DESC 
  LIMIT 10) AS average 
GROUP BY country, first_name 
LIMIT 5; 

-- CTE 2 based on SUBQUERY 2 

WITH country_cte (payment_id, customer_id, amount, first_name, last_name, city, country, total_amount_paid) AS 
   (SELECT   A.payment_id, 
            A.customer_id, 
            A.amount, 
            B.first_name, 
            B.last_name, 
            D.city,
            E.country, 
            SUM(amount) AS total_amount_paid 
   FROM payment A 
   INNER JOIN customer B ON A.customer_id = B.customer_id 
   INNER JOIN address C ON B.address_id = C.address_id 
   INNER JOIN city D ON C.city_id = D.city_id 
   INNER JOIN country E ON D.country_id = E.country_id 
   WHERE city IN  ('Aurora', 
                'Poos de Caldas', 
                'Belm', 
                'Luziinia',
                'Goinia', 
                'Blumenau', 
                'guas Lindas de Gois', 
                'Aparacedia de Goinia', 
                'Maring', 
                'Vila Velha') 
  GROUP BY amount, country, city, first_name, last_name, payment_id 
  ORDER BY amount DESC 
  LIMIT 10) 
SELECT country, 
        COUNT(customer_id) AS all_customer_count 
        COUNT(total_amount_paid) AS top_custmoer_count 
FROM country_cte 
GROUP BY country, first_name 
LIMIT 5; 
