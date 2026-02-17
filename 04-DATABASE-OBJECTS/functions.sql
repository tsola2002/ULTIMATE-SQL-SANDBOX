-- creating a function to add two numbers together
CREATE FUNCTION add_numbers(num1 INT, num2 INT)
RETURNS INT
RETURN num1 + num2;

DELIMITER //
CREATE FUNCTION subtract_numbers(num1 INT, num2 INT)
RETURNS INT
DETERMINISTIC
BEGIN
RETURN num1 - num2;
END //
DELIMITER;


-- this will create a function to round a number
DROP FUNCTION IF EXISTS rndb;
CREATE FUNCTION rndb (original FLOAT, basis FLOAT)
RETURNS FLOAT
RETURN TRUNCATE(original / basis + 0.5, 0) * basis;

-- this will display all functions in a specified database
SHOW FUNCTION STATUS WHERE Db = 'world';

-- this will call a user defined function
SELECT add_numbers(10, 5);
SELECT subtract_numbers(10, 5);

-- this will delete a function
DROP FUNCTION subtract_numbers;

-- function to get number of cities in a country
DELIMITER //
CREATE FUNCTION get_city_count(country_code CHAR(3))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE city_total INT;

    SELECT COUNT(*)
    INTO city_total
    FROM city
    WHERE CountryCode = country_code;

    RETURN city_total;
END //

DELIMITER;


SELECT get_city_count('USA');

DELIMITER //

CREATE FUNCTION get_grades(score INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(20);

    IF score >= 70 THEN
        SET grade = 'A';
    ELSEIF score >= 60 THEN
        SET grade = 'B';
    ELSE
        SET grade = 'C';
    END IF;

    RETURN grade;
END //

DELIMITER;















SELECT TRUNCATE(27.88/0.25+ 0.5, 0) * 0.25;

SELECT rndb(27.88, 0.25);

--  retrieve population for cities in switzerland and round them to the nearest 500
SELECT Name, Population FROM city WHERE CountryCode = 'CHE';

SELECT Name, rndb(Population, 500) FROM city WHERE CountryCode = 'CHE';


