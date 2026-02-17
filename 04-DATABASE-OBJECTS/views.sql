CREATE VIEW `african_countries` AS
SELECT Code, Name, Population
FROM country
WHERE Continent = 'Africa';

-- this code will list all the view in your database
SHOW FULL TABLES IN world WHERE Table_type LIKE 'VIEW';

-- this will run and excute your views
SELECT * FROM african_countries;

-- this will delete a specified view
DROP VIEW african_countries;

-- this will check if a view is updatable
SELECT table_name, is_updatable 
FROM information_schema.views
WHERE table_schema = 'world'
AND table_name = 'african_countries';

-- this will allow you to update a view
UPDATE african_countries
SET Population = 5000000;
WHERE Code = 'NGA';



-- this code will create a view
CREATE VIEW `customerLogDates` AS
SELECT first_name, last_name, email, create_date FROM customer;

CREATE VIEW `customershortlog` AS
SELECT first_name, last_name, email, create_date FROM customer LIMIT 10;



-- this will select all information from customerlogdates view
SELECT * FROM customerlogdates;



-- this will update an existing view
CREATE OR REPLACE VIEW customerlogdates AS
SELECT first_name, last_name FROM customer;



-- this will delete more than one view
DROP VIEW customerdata, actor_info;

