-- Open up psql and create a sql_lab database if you haven't already done so. 
-- If you already have a sql_lab database, no need to create it again.

-- Write SQL commands under the prompts below, and run the file to get results.

-- In case there is already a computers table, drop it

-- Create a computers table
createdb computer
psql -l
psql computer
--------------+--------------+----------+-----------------+---------+-------+--------+-----------+-------------------------------
 angelminimac | angelminimac | UTF8     | libc            | C       | C     |        |           | 
 carmen       | angelminimac | UTF8     | libc            | C       | C     |        |           | 
 computer     | angelminimac | UTF8     | libc            | C       | C     |        |           | 
 pc_tv        | angelminimac | UTF8     | libc            | C       | C     |        |           | 
 postgres     | angelminimac | UTF8     | libc            | C       | C     |        |           | 
 template0    | angelminimac | UTF8     | libc            | C       | C     |        |           | =c/angelminimac              +
              |              |          |                 |         |       |        |           | angelminimac=CTc/angelminimac
 template1    | angelminimac | UTF8     | libc            | C       | C     |        |           | =c/angelminimac              +
              |              |          |                 |         |       |        |           | angelminimac=CTc/angelminimac
 test_db      | angelminimac | UTF8     | libc            | C       | C     |        |           | 
(8 rows)

-- The table should have id, make, model, cpu_speed, memory_size,
--  price, release_date, photo_url, storage_amount, number_usb_ports,
--  number_firewire_ports, number_thunderbolt_ports

CREATE TABLE computers (
    id SERIAL PRIMARY KEY,
    make VARCHAR(255),
    model VARCHAR(255),
    cpu_speed DECIMAL,
    memory_size INT,
    price DECIMAL,
    release_date DATE,
    photo_url VARCHAR(255),
    storage_amount INT,
    number_usb_ports INT,
    number_firewire_ports INT,
    number_thunderbolt_ports INT
);



-- Insert 4 computers into the computers table
INSERT INTO computers (make, model, cpu_speed, memory_size, price, release_date, photo_url, storage_amount, number_usb_ports, number_firewire_ports, number_thunderbolt_ports)
VALUES ('Dell', 'Latitude 5530', 2.6, 16, 1199.00, '2023-08-15', 'http://example.com/dell_latitude.jpg', 512, 3, 0, 1);

INSERT INTO computers (make, model, cpu_speed, memory_size, price, release_date, photo_url, storage_amount, number_usb_ports, number_firewire_ports, number_thunderbolt_ports)
VALUES ('Apple', 'Mac mini', 3.2, 8, 699.00, '2023-10-01', 'http://example.com/apple_macmini.png', 256, 2, 0, 2);

INSERT INTO computers (make, model, cpu_speed, memory_size, price, release_date, photo_url, storage_amount, number_usb_ports, number_firewire_ports, number_thunderbolt_ports)
VALUES ('HP', 'Envy Desktop', 3.0, 32, 1550.75, '2024-02-20', 'http://example.com/hp_envy.jpg', 1000, 4, 0, 1);

INSERT INTO computers (make, model, cpu_speed, memory_size, price, release_date, photo_url, storage_amount, number_usb_ports, number_firewire_ports, number_thunderbolt_ports)
VALUES ('Lenovo', 'IdeaCentre AIO', 2.8, 16, 950.00, '2024-01-05', 'http://example.com/lenovo_aio.png', 512, 2, 0, 0);


-- Select all entries from the computers table
SELECT * FROM computers;
 id |  make  |     model      | cpu_speed | memory_size |  price  | release_date |              photo_url               | storage_amount | number_usb_ports | number_firewire_ports | number_thunderbolt_ports 
----+--------+----------------+-----------+-------------+---------+--------------+--------------------------------------+----------------+------------------+-----------------------+--------------------------
  1 | Dell   | Latitude 5530  |       2.6 |          16 | 1199.00 | 2023-08-15   | http://example.com/dell_latitude.jpg |            512 |                3 |                     0 |                        1
  2 | Apple  | Mac mini       |       3.2 |           8 |  699.00 | 2023-10-01   | http://example.com/apple_macmini.png |            256 |                2 |                     0 |                        2
  3 | HP     | Envy Desktop   |       3.0 |          32 | 1550.75 | 2024-02-20   | http://example.com/hp_envy.jpg       |           1000 |                4 |                     0 |                        1
  4 | Lenovo | IdeaCentre AIO |       2.8 |          16 |  950.00 | 2024-01-05   | http://example.com/lenovo_aio.png    |            512 |                2 |                     0 |                        0
(4 rows)


-- HUNGRY FOR MORE? 
-- Look at this afternoon's instructor notes and read on altering tables before attempting below

-- Alter the computers_models, removing the storage_amount column
ALTER TABLE --don't want too
-- and add storage_type and storage_size columns
ALTER TABLE computers
ADD COLUMN storage_type VARCHAR(255);
ALTER TABLE computers
ADD COLUMN storage_size VARCHAR(255);

UPDATE computers
SET storage_type = 'SSD',
    storage_size = '512 GB'
WHERE id = 1;

UPDATE computers
SET storage_type = 'SSD',
    storage_size = '256 GB'
WHERE id = 2;

SELECT * FROM computers WHERE storage_size IS NOT NULL AND storage_type IS NOT NULL;
id | make  |     model     | cpu_speed | memory_size |  price  | release_date |              photo_url               | storage_amount | number_usb_ports | number_firewire_ports | number_thunderbolt_ports | storage_type | storage_size 
----+-------+---------------+-----------+-------------+---------+--------------+--------------------------------------+----------------+------------------+-----------------------+--------------------------+--------------+--------------
  1 | Dell  | Latitude 5530 |       2.6 |          16 | 1199.00 | 2023-08-15   | http://example.com/dell_latitude.jpg |            512 |                3 |                     0 |                        1 | SSD          | 512 GB
  2 | Apple | Mac mini      |       3.2 |           8 |  699.00 | 2023-10-01   | http://example.com/apple_macmini.png |            256 |                2 |                     0 |                        2 | SSD          | 256 GB