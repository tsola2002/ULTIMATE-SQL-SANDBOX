--- this will round a number down
SELECT FLOOR(3.2);
SELECT Name, FLOOR(Population / 1000000) AS population_in_millions
FROM country;

-- this will round a number up
SELECT CEIL(33.7);
SELECT Name, CEIL(Population / 1000000) AS population_in_millions
FROM country;

-- this will raise the power of a number to a specific number
SELECT POW(2, 3);
SELECT name, POWER(SurfaceArea, 2) AS area_squared
FROM country
LIMIT 5;


--- this will round a number to a specific number of decimals
SELECT ROUND(123.45678, 2);
-- listing big Cities in Mexico and showing the population number in millions, formatted to only show one digit after the decimal point
SELECT Name, ROUND(Population/1000000, 1) AS 'Population (Millions)'
FROM city
WHERE CountryCode='MEX' AND Population>1000000;

-- aggregation function to pick out sum of replacement_cost column based on the rating
SELECT SUM(replacement_cost) from film;
SELECT rating, SUM(replacement_cost) from film GROUP BY rating;
-- aggregation function to pick out maximum of replacement_cost based on the rating
SELECT MAX(replacement_cost) from film;
SELECT SUM(replacement_cost) from film;
SELECT rating, MAX(replacement_cost) from film GROUP BY rating;

-- aggregation function to pick out the lowest number
SELECT MIN(replacement_cost) from film;

-- aggregation function to pick out number of occurrences in replacement_cost column based on the rating
SELECT COUNT(replacement_cost) from film;
SELECT rating, COUNT(replacement_cost) from film GROUP BY rating;
-- aggregation function to calculate the average of the replacement_cost column based on the rating
SELECT rating, AVG(replacement_cost) from film GROUP BY rating;
SELECT AVG(replacement_cost) from film;
-- aggregation function to join all values from the replacement_cost column based on the rating



--STRING FUNCTIONS 
SELECT LEFT(Nigeria, 3);
SELECT RIGHT(Nigeria, 3);
-- This returns all the cities that have New as the first three letters of their name:
SELECT Name FROM city WHERE LEFT(Name, 4) = 'New ';
SELECT Name FROM city WHERE RIGHT(Name, 4) = 'city';

-- This splits the email address on @ and returns the user and domain parts in different columns
SELECT SUBSTRING_INDEX("United States", " ", 1);

SELECT email, SUBSTRING_INDEX(email, "@", 1) AS email_id,
SUBSTRING_INDEX(email, "@", -1) AS domain_name,
store_id,
active
FROM customer
WHERE store_id = 1 AND active = 0;

-- using length function to view the number of characters in a string
SELECT LENGTH('first_name'), LENGTH('BBBBBB');
SELECT CHAR_LENGTH('username'), CHAR_LENGTH('last_name');

SELECT name, LENGTH(name) AS char_length
FROM country
LIMIT 20;

-- this will convert the characters to upper case
SELECT UPPER('first_name'), UPPER('last_name');

-- this will convert the characters to lower case
SELECT LOWER('FIRST_NAME'), LOWER('LAST_NAME');

-- this will concatenate(join) two strings together
SELECT CONCAT('first_name', 'last_name');


--- DATE AND TIME FUNCTIONS
--- this will display current time in different formats
SELECT CURRENT_TIME(), CURRENT_DATE(), CURRENT_TIMESTAMP(), NOW();

-- this adds an interval to a date
SELECT DATE_ADD('2010-01-01', INTERVAL 1 YEAR);
SELECT DATE_ADD('2010-01-01', INTERVAL 1 DAY);
SELECT DATE_ADD('2010-01-01', INTERVAL 1 WEEK);
SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 4 MONTH);

-- this converts timestamp to unix timestamp and vice versa
SELECT UNIX_TIMESTAMP('2014-05-14 10:50:00'), FROM_UNIXTIME(1573846979);
SELECT UNIX_TIMESTAMP(CURRENT_TIMESTAMP()), FROM_UNIXTIME(1715680363);

SELECT title, rating, replacement_cost from film;


SELECT rating, GROUP_CONCAT(replacement_cost) from film GROUP BY rating;

--aggregation function to filter all values based on a certain condition replacement_cost column based on the rating
SELECT rating, SUM(replacement_cost) from film GROUP BY rating HAVING SUM(replacement_cost) > 4000;


;

-- filtering using the OR keyword
SELECT * FROM city WHERE (District='New York' OR District='New Jersey')
AND Population>100000;

