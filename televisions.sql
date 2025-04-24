-- Open up psql and create a sql_lab database if you haven't already done so. 
-- If you already have a sql_lab database, no need to create it again.

-- Write SQL commands under the prompts below, and run the file to get results.

-- In case there is already a televisions table, drop it


-- Create a televisions table


--  The table should have id, model_name, screen_size, resolution,
--  price, release_date, photo_url
CREATE TABLE televisions(id SERIAL PRIMARY KEY,model_name VARCHAR(255),screen_size INT,resolution INT,price DECIMAL,release_date DATE,photo_url VARCHAR(255))



-- Insert 4 televisions into the tv_models table
INSERT INTO televisions (
    model_name,
    screen_size,
    resolution,
    price,
    release_date,
    photo_url
) VALUES (
    'Samsung QN65S95C',
    65,
    2160,
    2599.99,
    '2023-03-01',
    'http://example.com/photos/samsung_s95c.jpg'
);


INSERT INTO televisions (
    model_name,
    screen_size,
    resolution,
    price,
    release_date,
    photo_url
) VALUES (
    'LG C3 OLED',
    55,
    2160, 
    1499.99,
    '2023-04-15',
    'http://example.com/photos/lg_c3.png'
);


INSERT INTO televisions (
    model_name,
    screen_size,
    resolution,
    price,
    release_date,
    photo_url
) VALUES (
    'Sony A95L OLED',
    77,
    2160, 
    3498.00,
    '2023-09-10',
    'http://example.com/photos/sony_a95l.webp'
);

INSERT INTO televisions (
    model_name,
    screen_size,
    resolution,
    price,
    release_date,
    photo_url
) VALUES (
    'TCL QM8 Mini-LED',
    75,
    2160, 
    1399.00,
    '2023-05-25',
    'http://example.com/photos/tcl_qm8.jpg'
);


-- Select all entries from the tv_models table
SELECT model_name FROM televisions;

    model_name    
------------------
 Samsung QN65S95C
 LG C3 OLED
 Sony A95L OLED
 TCL QM8 Mini-LED
(4 rows)


-- HUNGRY FOR MORE? 
-- Look at this afternoon's instructor notes and read on altering tables before attempting below

-- Alter the tv_models, removing the resolution column
--  and add vertical_resolution and horizontal_resolution columns
ALTER TABLE televisions DROP COLUMN resolution;
original 
computer=# SELECT * FROM televisions;
 id |    model_name    | screen_size | resolution |  price  | release_date |                 photo_url                  
----+------------------+-------------+------------+---------+--------------+--------------------------------------------
  1 | Samsung QN65S95C |          65 |       2160 | 2599.99 | 2023-03-01   | http://example.com/photos/samsung_s95c.jpg
  2 | LG C3 OLED       |          55 |       2160 | 1499.99 | 2023-04-15   | http://example.com/photos/lg_c3.png
  3 | Sony A95L OLED   |          77 |       2160 | 3498.00 | 2023-09-10   | http://example.com/photos/sony_a95l.webp
  4 | TCL QM8 Mini-LED |          75 |       2160 | 1399.00 | 2023-05-25   | http://example.com/photos/tcl_qm8.jpg
(4 rows)

afterwards
 id |    model_name    | screen_size |  price  | release_date |                 photo_url                  
----+------------------+-------------+---------+--------------+--------------------------------------------
  1 | Samsung QN65S95C |          65 | 2599.99 | 2023-03-01   | http://example.com/photos/samsung_s95c.jpg
  2 | LG C3 OLED       |          55 | 1499.99 | 2023-04-15   | http://example.com/photos/lg_c3.png
  3 | Sony A95L OLED   |          77 | 3498.00 | 2023-09-10   | http://example.com/photos/sony_a95l.webp
  4 | TCL QM8 Mini-LED |          75 | 1399.00 | 2023-05-25   | http://example.com/photos/tcl_qm8.jpg
(4 rows)