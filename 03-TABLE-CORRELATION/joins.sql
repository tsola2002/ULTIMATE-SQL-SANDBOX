-- this will select from both city and country table
SELECT * FROM COUNTRY, CITY;

-- this code will join city table to country table
SELECT * FROM city JOIN country;

-- 
SELECT * FROM city JOIN country ON city.CountryCode=country.Code;
SELECT * FROM city ci JOIN country co ON ci.CountryCode=co.Code;

-- this code will join city and country table based on a similar reference
SELECT ct.id, ct.name, cy.Code AS CountryCode, cy.name AS CountryName
FROM city ct 
JOIN country cy 
ON ct.CountryCode = cy.Code;

INSERT INTO city VALUES(2460, 'Skopje', 'MKD');

INSERT INTO country VALUES('HUN', 'Hungary');

-- all the records from the first table are shown even if there is no matching record in the second table. In that case, the columns from that table will have NULL as a value.
SELECT ci.Name, co.Code AS CountryCode, co.Name
AS CountryName
FROM city ci LEFT JOIN country co ON ci.CountryCode=co.Code;


SELECT ci.Name, co.Code AS CountryCode, co.Name
AS CountryName
FROM city ci RIGHT JOIN country co ON ci.CountryCode=co.Code;

--- this will join mora than 2 tables together
SELECT co.name AS Country, ci.name AS City, cl.Language
FROM country co
JOIN city ci
ON co.Code = ci.CountryCode
JOIN countryLanguage cl
ON co.Code = cl.CountryCode;

--- SELF JOIN
SELECT c1.name AS city1,
       c2.name AS city2,
       c3.name AS city3,
       c1.CountryCode
FROM city c1
JOIN city c2
    ON c1.CountryCode = c2.CountryCode
    AND c1.ID <> c2.ID
JOIN city c3
    ON c1.CountryCode = c3.CountryCode
    AND c1.ID <> c3.ID;


-- using a natural Join
SELECT name, Language
FROM country
NATURAL JOIN countryLanguage;

-- this subquery allows us to use the output of a query directly in another query.
SELECT Name FROM city WHERE CountryCode=(
    SELECT Code FROM country WHERE Name='Hungary'
);

-- this code uses a subquery which depends on the main query(dependent subquery)
SELECT
    Name,
    CountryCode,
    (SELECT Name FROM country WHERE Code=city.CountryCode) AS CountryName
FROM city;

-- ANALYZING OUR QUERIES
EXPLAIN SELECT * FROM city WHERE ID=2460;

EXPLAIN SELECT ci.Name, co.Code AS CountryCode, co.Name
AS CountryName
FROM city ci LEFT JOIN country co ON ci.CountryCode=co.Code;

-- this will explain the code and format the output vertically
EXPLAIN SELECT * FROM country co LEFT JOIN city ci
ON ci.CountryCode=co.Code WHERE ci.ID=540\G;

-- this will explain the code and format the output both vertically and in JSON format
EXPLAIN FORMAT=JSON SELECT * FROM country co
LEFT JOIN city ci ON ci.CountryCode=co.Code WHERE ci.ID=540\G

-- this will explain the code and format the output both vertically and in TREE format
EXPLAIN FORMAT=TREE SELECT Name, CountryCode,
(SELECT Name FROM country WHERE Code=city.CountryCode) AS CountryName
FROM city\G

EXPLAIN FORMAT=TREE SELECT * FROM country\G