-- Queries for joining tables (refer to the ERD Rockbuster.png)

-- Find the top 10 countries for Rockbuster in terms of customer numbers. Tables to join: 
-- Table A >    Table B >     Table C >     Table D 
-- customer     address       city          country

SELECT  D. country, 
        COUNT(customer_id)
FROM customer A 
INNER JOIN address B ON A.address_id = B.address_id 
INNER JOIN city C ON B.city_id = C.city_id 
INNER JOIN country D ON C.country_id = D.country_id 
GROUP BY country 
ORDER BY COUNT DESC 
LIMIT 10; 

-- Results: There are 109 countries listed. 
-- The top 10 with the most customers are India, China, United States, Japan, Mexico, Brazil, Russian Federation, Philippines, Turkey, and Indonesia.

-- Find the top 10 cities within the top 10 countries identified. 
-- Since we know the top 10 countries with the most customers, I need to find the top 10 cities within this group of countries. A mutiple join is needed. 
-- Table A >    Table B >     Table C >     Table D 
-- customer     address       city          country

SELECT  C.city,
        D.country, 
        COUNT(customer_id_ AS nbr_of_customers
FROM customer A 
INNER JOIN address B ON A.address_id = B.address_id 
INNER JOIN city C ON B.city_id = C.city_id 
INNER JOIN country D ON C.country_id = D.country_id 
WHERE country IN  ('India',
                  'China',
                  'United States',
                  'Japan',
                  'Mexico',
                  'Brazil',
                  'Russian Federation',
                  'Philippines',
                  'Turkey',
                  'Indonesia') 
GROUP BY country, city
ORDER BY nbr_of_customers DESC, country; 

-- Results: There are 314 cities matched in select countries. However, Aurora, United States is the only city with a count of more than 1. 
-- This means Aurora, United States, is the top #1 city in the top 10 countries. It's important to note that the rest of the cities are 
-- ranked equally with a count of 1. 

-- Find the top 5 customers in the top 10 cities who have paid the highest total amounts to Rockbuster. A mutiple join is needed. 
-- Table A >    Table B >     Table C >     Table D >     Table E 
-- payment      customer     address       city          country

SELECT  A.payment_id, 
        A.customer_id,
        A.amount, 
        B.first_name, 
        B.last_name, 
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
GROUP BY amount, first_name, last_name, country, city, payment_id 
ORDER BY amount DESC
LIMIT 5; 

-- Results: Nicholas Barfield is the highest paying customer (2 full dollars ahead of the second highest paying customer). 
-- He lives in Belm, Brazil and is mentioned twice in the list which means he also paid the most in number of payments (2) and total amount paid (20.98). 

-- Notes: Do note again that the results for the top 10 cities aren’t accurate because all cities are ranked equally with a count of 1 except for Aurora, United States. 
-- Query results is organized by COUNT then by COUNTRY. The remaining 9 cities in the list are in Brazil. 
