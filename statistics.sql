-- To summarize the data, I use SQL to calculate descriptive statistics for both the film table and the customer table. 
-- For numerical columns, this means finding the min/max/avg values. For non-numerical columns, I calculate the mode value. 
-- I referred to the ERD DBMS for the film and customer tables. 

-- FILM TABLE
-- Show all fields in the film database and have it arranged based on film ID. 

SELECT  MIN(rental_duration), MAX(rental_duration), AVG(rental_duration),
        COUNT(rental_duration) AS count_rent_duration_values, 
        MIN(rental_rate_, MAX(rental_rate), AVG(rental_rate), 
        COUNT(rental_rate) AS count_rent_values.
        MIN(replacement_cost), MAX(replacement_cost), AVG(replacement_cost), 
        COUNT(replacement_cost) AS cost_replacement_cost_values,
        COUNT(*) AS count_rows 
FROM film;

-- AND

SELECT  mode()WITHIN GROUP (ORDER BY rating) 
        AS modal_value 
FROM film; 

-- This shows that most films in the system are rated PG_13. 

-- CUSTOMER TABLE 
-- Show all fields in the customer database and have it arranged based on store ID, last name, and first name of customers.  
-- There are no numeric values to measure. However, Rockbuster has 2 store locations: 1) Seattle, WA and 2) St. Petersburg, FL. 
-- There are 326 customers registered in Seattle and 273 customers registed in St. Petersburg. In total, there are 599 customers
-- in the customer database. 15 customers are currently inactive. The most common first name in active members are Kelly and Willie. 

SELECT  store_id, 
        mode()WITHIN GROUP (ORDER BY first_name), 
        CASE 
        WHEN store_id = 1 THEN 'Seattle, Washington' 
        WHEN store_id = 2 THEN 'St.Petersburg, Florida'
        END AS city_state, 
        active, COUNT(active) AS nbr_of_customers, 
        CASE 
        WHEN active = 1 THEN 'active' 
        WHEN active = 0 THEN 'inactive' 
        END AS membership
FROM customer 
GROUP BY store_id, active
ORDER BY store_id; 

