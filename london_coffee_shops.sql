use london_coffee_shops;

CREATE TABLE branches (ID INT NOT NULL,
branch_address VARCHAR(50) NOT NULL,
PRIMARY KEY (ID)
);
INSERT INTO branches (ID, branch_address)
VALUES
(1, 'St Paul\'s'),
(2, 'Trafalgar Sqr'),
(3, 'Hyde Park'),
(4, 'Marble Ark'),
(5, 'Notting Hill'),
(6, 'Regent\'s Park'),
(7, 'King\'s College'),
(8, 'Kensington'),
(9, 'Natural History Museum'),
(10, 'Earls Court'),
(11, 'Waterloo'),
(12, 'London Eye'),
(13, 'British Museum'),
(14, 'Soho'),
(15, 'London Zoo');

CREATE TABLE coffee_menu (coffee_ID INT NOT NULL,
coffee_name VARCHAR(50) NOT NULL UNIQUE,
coffee_small_price FLOAT NOT NULL,
coffee_medium_price FLOAT,
coffee_large_price FLOAT,
PRIMARY KEY (coffee_ID)
);
INSERT INTO coffee_menu (coffee_ID, coffee_name, coffee_small_price, coffee_medium_price, coffee_large_price)
VALUES
(000, 'Americano', 2.00, 2.20, 2.50),
(001, 'Latte', 2.50, 2.70, 3.00),
(002, 'Cappuccino', 2.40, 2.60, 2.90),
(003, 'Flat White', 3.00, 3.20, 3.50),
(004, 'Espresso', 2.20, 2.40, 2.70),
(005, 'Hot Chocolate', 2.10, 2.30, 2.60),
(006, 'Cocoa', 1.80, 2.00, 2.30),
(007, 'Iced Latte', 3.00, 3.20, 3.50);

CREATE TABLE tea_menu (tea_ID INT NOT NULL,
tea_name VARCHAR(50) NOT NULL UNIQUE,
tea_small_price FLOAT NOT NULL,
tea_medium_price FLOAT,
tea_large_price FLOAT,
PRIMARY KEY (tea_ID)
);
INSERT INTO tea_menu (tea_ID, tea_name, tea_small_price, tea_medium_price, tea_large_price)
VALUES
(010, 'Black Tea', 1.50, 1.55, 1.75),
(011, 'Green Tea', 1.60, 1.65, 1.85),
(012, 'Citrus Tea', 2.00, 2.05, 2.25),
(013, 'Matcha Latte', 2.50, 2.75, 3.00),
(015, 'Masala Latte', 2.40, 2.65, 2.90),
(016, 'Berry Tea', 2.10, 2.20, 2.40);

CREATE TABLE winter_menu (winter_ID INT NOT NULL,
winter_drink_name VARCHAR(50) NOT NULL UNIQUE,
winter_small_price FLOAT NOT NULL,
winter_medium_price FLOAT,
winter_large_price FLOAT,
PRIMARY KEY (winter_ID)
);
INSERT INTO winter_menu (winter_ID, winter_drink_name, winter_small_price, winter_medium_price, winter_large_price)
VALUES
(100, 'Gingerbread Latte', 2.70, 2.80, 3.00),
(101, 'Toffee Nut Latte', 2.75, 2.85, 3.05),
(102, 'Chocolate Praline Latte', 2.80, 2.90, 3.10),
(103, 'Punch', 1.90, 1.95, 2.05),
(104, 'Mulled Wine', 2.10, 2.25, 2.30);

CREATE TABLE winter_calories (winter_ID INT NOT NULL UNIQUE,
winter_calories_S INT NOT NULL UNIQUE,
winter_calories_M INT NOT NULL UNIQUE,
winter_calories_L INT NOT NULL UNIQUE,
PRIMARY KEY (winter_ID)
);
INSERT INTO winter_calories (winter_ID, winter_calories_S, winter_calories_M, winter_calories_L)
VALUES
(100, 180, 260, 330),
(101, 86, 135, 190),
(102, 190, 270, 340),
(103, 107, 160, 210),
(104, 91, 153, 250);

CREATE TABLE tea_calories (tea_ID INT NOT NULL UNIQUE,
tea_calories_S INT NOT NULL UNIQUE,
tea_calories_M INT NOT NULL UNIQUE,
tea_calories_L INT NOT NULL UNIQUE,
PRIMARY KEY (tea_ID)
);
INSERT INTO tea_calories (tea_ID, tea_calories_S, tea_calories_M, tea_calories_L)
VALUES
(010, 2, 4, 7),
(011, 1, 3, 5),
(012, 25, 43, 66),
(013, 110, 160, 200),
(015, 120, 190, 240),
(016, 35, 61, 89);

CREATE TABLE coffee_calories (coffee_ID INT NOT NULL UNIQUE,
coffee_calories_S INT NOT NULL UNIQUE,
coffee_calories_M INT UNIQUE,
coffee_calories_L INT UNIQUE,
PRIMARY KEY (coffee_ID)
);
INSERT INTO coffee_calories (coffee_ID, coffee_calories_S, coffee_calories_M, coffee_calories_L)
VALUES
(000, 5, 9, 15),
(001, 86, 135, 190),
(002, 45, 95, 170),
(003, 189, 215, 250),
(004, 6, NULL, NULL),
(005, 259, 378, 476),
(006, 150, 200, 239),
(007, 151, 204, 261);

ALTER TABLE winter_menu
ADD COLUMN available_from DATE;

ALTER TABLE winter_menu
ADD COLUMN available_to DATE;

UPDATE winter_menu 
SET available_to = '2022-11-01' + INTERVAL 4 MONTH;

UPDATE winter_menu 
SET available_from = '2022-11-01';

CREATE TABLE food_menu (food_ID INT NOT NULL,
food_name VARCHAR(50) NOT NULL UNIQUE,
food_price FLOAT NOT NULL,
PRIMARY KEY (food_ID)
);
INSERT INTO food_menu (food_ID, food_name, food_price)
VALUES
(200, 'Vanilla Muffin', 1.50),
(201, 'Chocolate Muffin', 1.60),
(202, 'Blueberry Muffin', 1.70),
(203, 'Butter Croissant', 1.75),
(204, 'Chocolate Croissant', 1.95),
(205, 'Almond Croissant', 2.05),
(206, 'Danish Platter', 2.10),
(207, 'Pain Au Chocolat', 2.00);

CREATE TABLE food_calories (food_ID INT NOT NULL,
food_calories INT NOT NULL UNIQUE,
PRIMARY KEY (food_ID)
);
INSERT INTO food_calories (food_ID, food_calories)
VALUES
(200, 369),
(201, 374),
(202, 385),
(203, 272),
(204, 470),
(205, 490),
(206, 262),
(207, 280);

CREATE TABLE availability (branch_ID INT NOT NULL UNIQUE,
food_available VARCHAR(50),
coffee_available VARCHAR(50),
tea_available VARCHAR(50),
winter_available VARCHAR(50));
INSERT INTO availability (branch_ID, food_available, coffee_available, tea_available, winter_available)
VALUES
(1, 'YES', 'YES', 'YES', 'YES'),
(2, 'YES', 'YES', 'YES', 'YES'),
(3, 'YES', 'YES', 'YES', 'YES'),
(4, 'YES', 'YES', 'YES', 'YES'),
(5, 'YES', 'YES', 'YES', 'YES'),
(6, 'YES', 'YES', 'YES', 'YES'),
(7, 'YES', 'YES', 'YES', 'NO'),
(8, 'YES', 'YES', 'YES', 'YES'),
(9, 'YES', 'YES', 'YES', 'YES'),
(10, 'YES', 'YES', 'YES', 'YES'),
(11, 'NO', 'YES', 'YES', 'YES'),
(12, 'YES', 'YES', 'YES', 'YES'),
(13, 'YES', 'YES', 'YES', 'YES'),
(14, 'YES', 'YES', 'YES', 'YES'),
(15, 'YES', 'YES', 'YES', 'YES');

CREATE TABLE st_pauls_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO st_pauls_food_sales (food_ID, food_profit)
VALUES
(200, 367.5),
(201, 369.6),
(202, 452.2),
(203, 600.25),
(204, 559.65),
(205, 444.85),
(206, 411.6),
(207, 630.00);
UPDATE st_pauls_food_sales
SET sold_from = '2022-12-05';
UPDATE st_pauls_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE trafalgar_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO trafalgar_food_sales (food_ID, food_profit)
VALUES
(200, 315),
(201, 369.6),
(202, 547.4),
(203, 673.75),
(204, 573.3),
(205, 545.3),
(206, 396.9),
(207, 546.00);
UPDATE trafalgar_food_sales
SET sold_from = '2022-12-05';
UPDATE trafalgar_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE hyde_park_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO hyde_park_food_sales (food_ID, food_profit)
VALUES
(200, 157.5),
(201, 89.6),
(202, 130.9),
(203, 171.5),
(204, 245.7),
(205, 229.6),
(206, 147.00),
(207, 210.00);
UPDATE hyde_park_food_sales
SET sold_from = '2022-12-05';
UPDATE hyde_park_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE marble_ark_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO marble_ark_food_sales (food_ID, food_profit)
VALUES
(200, 136.5),
(201, 134.4),
(202, 178.5),
(203, 196.00),
(204, 245.7),
(205, 186.55),
(206, 191.1),
(207, 266.00);
UPDATE marble_ark_food_sales
SET sold_from = '2022-12-05';
UPDATE marble_ark_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE notting_hill_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO notting_hill_food_sales (food_ID, food_profit)
VALUES
(200, 147.0),
(201, 168.0),
(202, 190.4),
(203, 134.75),
(204, 177.45),
(205, 172.2),
(206, 249.9),
(207, 252.00);
UPDATE notting_hill_food_sales
SET sold_from = '2022-12-05';
UPDATE notting_hill_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE regents_park_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO regents_park_food_sales (food_ID, food_profit)
VALUES
(200, 210.0),
(201, 224.0),
(202, 178.5),
(203, 159.25),
(204, 177.45),
(205, 243.95),
(206, 161.7),
(207, 266.00);
UPDATE regents_park_food_sales
SET sold_from = '2022-12-05';
UPDATE regents_park_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE kings_college_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO kings_college_food_sales (food_ID, food_profit)
VALUES
(200, 157.5),
(201, 134.4),
(202, 226.1),
(203, 110.25),
(204, 191.1),
(205, 143.5),
(206, 176.4),
(207, 182.00);
UPDATE kings_college_food_sales
SET sold_from = '2022-12-05';
UPDATE kings_college_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE kensington_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO kensington_food_sales (food_ID, food_profit)
VALUES
(200, 157.5),
(201, 145.6),
(202, 202.3),
(203, 134.75),
(204, 218.4),
(205, 172.2),
(206, 147.0),
(207, 308.00);
UPDATE kensington_food_sales
SET sold_from = '2022-12-05';
UPDATE kensington_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE natural_history_museum_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO natural_history_museum_food_sales (food_ID, food_profit)
VALUES
(200, 210.00),
(201, 218.4),
(202, 202.3),
(203, 202.13),
(204, 291.2),
(205, 258.3),
(206, 220.5),
(207, 385.00);
UPDATE natural_history_museum_food_sales
SET sold_from = '2022-12-05';
UPDATE natural_history_museum_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE earls_court_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO earls_court_food_sales (food_ID, food_profit)
VALUES
(200, 180.00),
(201, 163.8),
(202, 151.73),
(203, 151.6),
(204, 218.4),
(205, 193.73),
(206, 165.38),
(207, 306.00);
UPDATE earls_court_food_sales
SET sold_from = '2022-12-05';
UPDATE earls_court_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE london_eye_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO london_eye_food_sales (food_ID, food_profit)
VALUES
(200, 280.00),
(201, 291.2),
(202, 269.7),
(203, 242.56),
(204, 364.00),
(205, 322.87),
(206, 275.62),
(207, 450.00);
UPDATE london_eye_food_sales
SET sold_from = '2022-12-05';
UPDATE london_eye_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE british_museum_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO british_museum_food_sales (food_ID, food_profit)
VALUES
(200, 294.00),
(201, 278.2),
(202, 406.98),
(203, 520.2),
(204, 503.64),
(205, 389.25),
(206, 352.8),
(207, 530.00);
UPDATE british_museum_food_sales
SET sold_from = '2022-12-05';
UPDATE british_museum_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE soho_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO soho_food_sales (food_ID, food_profit)
VALUES
(200, 196.00),
(201, 222.56),
(202, 325.58),
(203, 416.16),
(204, 419.7),
(205, 324.38),
(206, 282.24),
(207, 400.00);
UPDATE soho_food_sales
SET sold_from = '2022-12-05';
UPDATE soho_food_sales
SET sold_to = '2022-12-12';

CREATE TABLE ldn_zoo_food_sales (food_ID INT NOT NULL UNIQUE,
food_profit FLOAT,
sold_from DATE,
sold_to DATE,
PRIMARY KEY (food_ID)
);
INSERT INTO ldn_zoo_food_sales (food_ID, food_profit)
VALUES
(200, 217.7),
(201, 247.3),
(202, 289.4),
(203, 356.7),
(204, 314.7),
(205, 288.3),
(206, 310.5),
(207, 366.00);
UPDATE ldn_zoo_food_sales
SET sold_from = '2022-12-05';
UPDATE ldn_zoo_food_sales
SET sold_to = '2022-12-12';

-- adding constraints

ALTER TABLE branches
ADD FOREIGN KEY (ID) REFERENCES availability(branch_ID);

alter table branches
add constraint fk_branch_ID
foreign key (ID)
references availability(branch_ID);

ALTER TABLE availability
ADD FOREIGN KEY (food_available) REFERENCES food_menu(food_name);

ALTER TABLE availability
ADD CONSTRAINT fk_food_name
FOREIGN KEY (food_available)
REFERENCES food_menu(food_name);

ALTER TABLE availability
ADD FOREIGN KEY (tea_available) REFERENCES tea_menu(tea_name);

ALTER TABLE availability
ADD CONSTRAINT fk_tea_name
FOREIGN KEY (tea_available)
REFERENCES tea_menu(tea_name);

ALTER TABLE availability
ADD CONSTRAINT fk_coffee_name
FOREIGN KEY (coffee_available)
REFERENCES coffee_menu(coffee_name);

ALTER TABLE availability
ADD CONSTRAINT fk_winter_drink_name
FOREIGN KEY (winter_available)
REFERENCES winter_menu(winter_drink_name);

ALTER TABLE coffee_calories
ADD CONSTRAINT fk_coffee_ID
FOREIGN KEY (coffee_ID)
REFERENCES coffee_menu(coffee_ID);

ALTER TABLE tea_calories
ADD CONSTRAINT fk_tea_ID
FOREIGN KEY (tea_ID)
REFERENCES tea_menu(tea_ID);

ALTER TABLE winter_calories
ADD CONSTRAINT fk_winter_ID
FOREIGN KEY (winter_ID)
REFERENCES winter_menu(winter_ID);

ALTER TABLE food_calories
ADD CONSTRAINT fk_food_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE british_museum_food_sales
ADD CONSTRAINT fk_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE earls_court_food_sales
ADD CONSTRAINT fk_e_c_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE hyde_park_food_sales
ADD CONSTRAINT fk_h_p_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE london_eye_food_sales
ADD CONSTRAINT fk_l_e_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE ldn_zoo_food_sales
ADD CONSTRAINT fk_ldn_zoo_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE natural_history_museum_food_sales
ADD CONSTRAINT fk_nhm_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE regents_park_food_sales
ADD CONSTRAINT fk_rp_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE notting_hill_food_sales
ADD CONSTRAINT fk_nh_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE marble_ark_food_sales
ADD CONSTRAINT fk_ma_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE kensington_food_sales
ADD CONSTRAINT fk_kensington_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE kings_college_food_sales
ADD CONSTRAINT fk_kc_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE soho_food_sales
ADD CONSTRAINT fk_soho_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE st_pauls_food_sales
ADD CONSTRAINT fk_stpauls_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

ALTER TABLE trafalgar_food_sales
ADD CONSTRAINT fk_trafalgar_food_sales_ID
FOREIGN KEY (food_ID)
REFERENCES food_menu(food_ID);

-- finding the most expensive entries through stored procedure

DELIMITER //
CREATE PROCEDURE highest_priced_items()
BEGIN
SELECT coffee_name, coffee_large_price
FROM coffee_menu
ORDER BY coffee_large_price DESC
LIMIT 1;

SELECT coffee_name, coffee_medium_price
FROM coffee_menu
ORDER BY coffee_medium_price DESC
LIMIT 1;

SELECT coffee_name, coffee_small_price
FROM coffee_menu
ORDER BY coffee_small_price DESC
LIMIT 1;

SELECT tea_name, tea_large_price
FROM tea_menu
ORDER BY tea_large_price DESC
LIMIT 1;

SELECT tea_name, tea_medium_price
FROM tea_menu
ORDER BY tea_medium_price DESC
LIMIT 1;

SELECT tea_name, tea_small_price
FROM tea_menu
ORDER BY tea_small_price DESC
LIMIT 1;

SELECT winter_drink_name, winter_large_price
FROM winter_menu
ORDER BY winter_large_price DESC
LIMIT 1;

SELECT winter_drink_name, winter_medium_price
FROM winter_menu
ORDER BY winter_medium_price DESC
LIMIT 1;

SELECT winter_drink_name, winter_small_price
FROM winter_menu
ORDER BY winter_small_price DESC
LIMIT 1;

SELECT food_name, food_price
FROM food_menu
ORDER BY food_price DESC
LIMIT 1;
END //
DELIMITER ;

CALL highest_priced_items;

-- creating a lactose warning procedure with subquery

DELIMITER //
CREATE PROCEDURE lactose_warning()
BEGIN
SELECT *,
CASE
	WHEN winter_drink_name LIKE '%Latte%' THEN 'YES'
END AS lactose
FROM winter_menu;

SELECT *,
CASE
	WHEN tea_name LIKE 'Ma%' THEN 'YES'
END AS lactose
FROM tea_menu;

SELECT *,
CASE
	WHEN coffee_name LIKE '%te%' THEN 'YES'
    WHEN coffee_name LIKE '%Cappuccino%' THEN 'YES'
END AS lactose
FROM coffee_menu;

END //
DELIMITER ;

CALL lactose_warning;

-- creating a join

SELECT a.branch_ID, a.food_available, a.coffee_available, a.tea_available, a.winter_available, b.branch_address
FROM availability a
RIGHT JOIN branches b
ON a.branch_ID = b.ID;

--