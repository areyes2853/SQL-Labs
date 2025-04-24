--enter your seed data below
INSERT INTO Apartments (apartment_number, bedrooms, bathrooms, address, tenant, occupied, sq_ft, price) VALUES
(101, 2, 1, '123 Main St, Anytown', 'John Smith', true, 850, 1200);

INSERT INTO Apartments (apartment_number, bedrooms, bathrooms, address, tenant, occupied, sq_ft, price) VALUES
(205, 1, 1, '456 Oak Ave, Anytown', NULL, false, 600, 950);

INSERT INTO Apartments (apartment_number, bedrooms, bathrooms, address, tenant, occupied, sq_ft, price) VALUES
(310, 3, 2, '789 Pine Ln, Anytown', 'Jane Doe', true, 1100, 1600);

-- Inserting data into the Offices table

INSERT INTO Offices (office_number, floors, sq_ft, cubicles, bathrooms, address, company, occupied, price) VALUES
(10, 1, 1500, 6, 1, '10 Downing St, Businessville', 'Acme Corp', true, 2500);

INSERT INTO Offices (office_number, floors, sq_ft, cubicles, bathrooms, address, company, occupied, price) VALUES
(22, 2, 2200, 10, 2, '20 Financial Rd, Businessville', NULL, false, 3500);

INSERT INTO Offices (office_number, floors, sq_ft, cubicles, bathrooms, address, company, occupied, price) VALUES
(5, 1, 900, 3, 1, '30 Tech Blvd, Businessville', 'Beta Industries', true, 1800);

-- Inserting data into the Storefronts table

INSERT INTO Storefronts (address, occupied, price, kitchen, sq_ft, owner, outdoor_seating) VALUES
('1 High St, Shopstown', true, 3000, true, 1200, 'Bob Williams', false);

INSERT INTO Storefronts (address, occupied, price, kitchen, sq_ft, owner, outdoor_seating) VALUES
('5 Market Pl, Shopstown', false, 2200, false, 800, NULL, true);

INSERT INTO Storefronts (address, occupied, price, kitchen, sq_ft, owner, outdoor_seating) VALUES
('10 Commerce Ct, Shopstown', true, 4500, true, 1800, 'Sarah Johnson', true);