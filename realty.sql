-- 1. The average square footage of all offices.
--I have created a new view called all_properties I will be quering that table for the excersise
realty_db=# SELECT AVG(sq_ft) AS average_office_sqft
FROM all_properties
WHERE property_type = 'Office';
  average_office_sqft  
-----------------------
 1533.3333333333333333
(1 row)

realty_db=# 


-- 2. The total number of apartments.

realty_db=# SELECT COUNT(*) AS total_apartments
FROM all_properties
WHERE property_type = 'Apartment';
 total_apartments 
------------------
                3
(1 row)


-- 3. The apartments where there is no tenant
realty_db=# SELECT *
FROM all_properties
WHERE property_type = 'Apartment' AND tenant IS NULL;
 property_type | id | property_number |       address        | occupied | price | sq_ft | bedrooms | bathrooms | tenant | floors | office_number | cubicles | company | kitchen | owner | outdoor_seating 
---------------+----+-----------------+----------------------+----------+-------+-------+----------+-----------+--------+--------+---------------+----------+---------+---------+-------+-----------------
 Apartment     |  2 | 205             | 456 Oak Ave, Anytown | f        |   950 |   600 |        1 |         1 |        |        |               |          |         |         

-- 4. The names of all of the companies
realty_db=# SELECT company
FROM all_properties
WHERE company IS NOT NULL;
     company     
-----------------
 Acme Corp
 Beta Industries
(2 rows)

-- 5. The number of cubicles and bathrooms in the 3rd office
realty_db=# SELECT cubicles, bathrooms
FROM all_properties
WHERE property_type = 'Office' AND id = 3;
 cubicles | bathrooms 
----------+-----------
        3 |         1
(1 row)

realty_db=# 


-- 6. The storefronts that have kitchens

realty_db=# SELECT *
FROM all_properties
WHERE property_type = 'Storefront' AND kitchen = TRUE;
 property_type | id | property_number |          address          | occupied | price | sq_ft | bedrooms | bathrooms | tenant | floors | office_number | cubicles | company | kitchen |     owner     | outdoor_seating 
---------------+----+-----------------+---------------------------+----------+-------+-------+----------+-----------+--------+--------+---------------+----------+---------+---------+---------------+-----------------
 Storefront    |    |                 | 1 High St, Shopstown      | t        |  3000 |  1200 |          |           |        |        |               |          |         | t       | Bob Williams  | f
 Storefront    |    |                 | 10 Commerce Ct, Shopstown | t        |  4500 |  1800 |          |           |        |        |               |          |         | t       | Sarah Johnson | t
(2 rows)

-- 7. The storefront with the highest square footage and outdoor seating
realty_db=# SELECT *
FROM all_properties
WHERE property_type = 'Storefront' AND outdoor_seating = TRUE
ORDER BY sq_ft DESC
LIMIT 1;
 property_type | id | property_number |          address          | occupied | price | sq_ft | bedrooms | bathrooms | tenant | floors | office_number | cubicles | company | kitchen |     owner     | outdoor_seating 
---------------+----+-----------------+---------------------------+----------+-------+-------+----------+-----------+--------+--------+---------------+----------+---------+---------+---------------+-----------------
 Storefront    |    |                 | 10 Commerce Ct, Shopstown | t        |  4500 |  1800 |          |           |        |        |               |          |         | t       | Sarah Johnson | t
(1 row)


-- 8. The office with the lowest number of cubicles

realty_db=# SELECT *
FROM all_properties
WHERE property_type = 'Office'
ORDER BY cubicles ASC
LIMIT 1;
 property_type | id | property_number |           address           | occupied | price | sq_ft | bedrooms | bathrooms | tenant | floors | office_number | cubicles |     company     | kitchen | owner | outdoor_seating 
---------------+----+-----------------+-----------------------------+----------+-------+-------+----------+-----------+--------+--------+---------------+----------+-----------------+---------+-------+-----------------
 Office        |  3 | 5               | 30 Tech Blvd, Businessville | t        |  1800 |   900 |          |         1 |        |      1 | 5             |        3 | Beta Industries |         |       | 
(1 row)


-- 9. The office with the most cubicles and bathrooms
realty_db=# SELECT *
FROM all_properties
WHERE property_type = 'Office'
ORDER BY cubicles DESC, bathrooms DESC
LIMIT 1;
 property_type | id | property_number |            address             | occupied | price | sq_ft | bedrooms | bathrooms | tenant | floors | office_number | cubicles | company | kitchen | owner | outdoor_seating 
---------------+----+-----------------+--------------------------------+----------+-------+-------+----------+-----------+--------+--------+---------------+----------+---------+---------+-------+-----------------
 Office        |  2 | 22              | 20 Financial Rd, Businessville | f        |  3500 |  2200 |          |         2 |        |      2 | 22            |       10 |         |         |       | 
(1 row)