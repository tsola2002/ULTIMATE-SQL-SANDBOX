-- USING THE FROM
SELECT * FROM COUNTRY;

--THIS WILL FILTER INFORMATION BY COLUMNS
SELECT name, continent, population FROM COUNTRY;

--- THIS WILL FILTER INFORMATION BY THE ROWS
SELECT * 
FROM COUNTRY 
WHERE continent = "Africa";

SELECT name, continent, population 
FROM COUNTRY 
WHERE continent = "Africa";

SELECT name, continent, population 
FROM COUNTRY
WHERE population > 100000000;

-- ADDING MULTIPLE CONDITIONS TO OUR WHERE CLAUSE
SELECT name, continent, population 
FROM COUNTRY
WHERE population > 100000000 AND continent  = "Africa";

--- SORTING DATA IN ASCENDING ORDER
SELECT name, continent
FROM COUNTRY
WHERE continent = "Africa"
ORDER BY name ASC;

SELECT name, population, continent
FROM COUNTRY
ORDER BY population ASC;

SELECT name, gnp, population, continent
FROM COUNTRY
ORDER BY gnp ASC;

--- SORTING DATA IN DESCENDING ORDER
SELECT name, continent
FROM COUNTRY
ORDER BY name DESC;

--MULTIPLE SORT COLUMNS
SELECT name, population, continent
FROM COUNTRY
WHERE continent = "Africa"
ORDER BY name ASC, population ASC;

--RESTRICTING ROWS
SELECT name, continent, population
FROM COUNTRY
ORDER BY population DESC
LIMIT 10;

--- PAGINATION
SELECT name, continent, population
FROM COUNTRY
ORDER BY name ASC
LIMIT 10 OFFSET 10;

--- REMOVING DUPLICATES
SELECT DISTINCT continent
FROM COUNTRY;

SELECT Continent, COUNT(*) AS country_count
FROM COUNTRY
GROUP BY continent;

-- this will select countries that start with the word united
SELECT Name FROM country WHERE Name LIKE 'United %';

-- this will select countries that end with the word city
SELECT Name FROM country WHERE Name LIKE '%ria';