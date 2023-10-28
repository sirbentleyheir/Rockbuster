-- Based on the queries I ran in joins.sql, I created the following subqueries. 

-- Find the average amount paid by the top 5 customers: 

-- MAIN QUERY 
-- In order to do this, I use the main query I ran in joins.sql. 

SELECT  A.payment_id, 
        B.customer_id,
        A.amount,
        B.first_name, 
        B.last_name. 
        D.city,
        E.country
FROM payment A 
INNER JOIN customer B ON A.customer_id = B.customer_id 
INNER JOIN address C ON B.address_id = C.address_id 
INNER JOIN city D ON C.city_id = D.city_id 
INNER JOIN country E ON D.country_id = E.country_id 
WHERE city IN   ('Aurora',
                'Poos de Caldas', 
                'Belm',
                'Luzinia', 
                'Goinia', 
                'Blumeneau', 
                'guas Lindas de Gois', 
                'Aparacedia de Goinia',
                'Maring',
                'Vila Velha') 
GROUP BY amount, country, city, first_name. last_name, payement_id
ORDER BY amount DESC 
LIMIT 5; 

-- OUTER STATEMENT 
-- Then, I write an outer statment to calculate the average amount paid.

SELECT AVG(amount)
FROM payment; 

-- Results: The outer statement returns 4.20 as the average amount paid. 

-- SUBQUERY 
-- Add the subquery to the outer statement. It will go in either the SELECT, WHERE, or FROM clause. 
-- When referring to the subquery in the outer statement, make sure to use the subquery's alias, "total_amount_paid". 

SELECT AVG(total_amount_paid) AS avg_amount_paid, first name 

(SELECT  A.payment_id, 
        B.customer_id,
        A.amount,
        B.first_name, 
        B.last_name. 
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
                'Luzinia', 
                'Goinia', 
                'Blumeneau', 
                'guas Lindas de Gois', 
                'Aparacedia de Goinia',
                'Maring',
                'Vila Velha') 
GROUP BY amount, country, city, first_name. last_name, payement_id
ORDER BY amount DESC 
LIMIT 10) AS average 

GROUP BY first_name 
LIMIT 5; 

-- Results: Clinton (8.99), Debra (9.49), Marian (7.99), Nicholas (10.49), and Tina (8.99). 
