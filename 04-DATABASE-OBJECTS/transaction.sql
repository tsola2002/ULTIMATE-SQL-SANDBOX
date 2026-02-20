CREATE DATABASE pets;
USE test;
CREATE TABLE animals (id int primary key, name varchar(255));
DESCRIBE animals;
TRUNCATE TABLE animals;
-- this will start a transaction
START TRANSACTION;

INSERT INTO animals VALUES(1, 'dolphin');
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
COMMIT;



--- this query will start a transaction
START TRANSACTION;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('City A', 'USA', 'Texas', 200000);

--- this will create a savepoint
SAVEPOINT cityA_inserted;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('City B', 'USA', 'Texas', 100000);

SAVEPOINT cityB_inserted;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('City C', 'USA', 'Texas', 300000);

SELECT * FROM city
WHERE name LIKE 'City %';

--- this will rollback to a specific savepoint
ROLLBACK TO cityB_inserted;

--- this will delete a savepoint 
RELEASE SAVEPOINT cityB_inserted;