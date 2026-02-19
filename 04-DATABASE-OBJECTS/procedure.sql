--- creating our first stored procedure
CREATE PROCEDURE CityCount(ccode CHAR(3))
    SELECT co.Name, COUNT(*) Cities
    FROM City ci JOIN Country co ON co.Code = ci.CountryCode
    WHERE Code = ccode;

--- procedure to retrieve total number of people in the country
DELIMITER $$

CREATE PROCEDURE get_country_population(IN country_code CHAR(3), OUT total_population BIGINT)
BEGIN
    SELECT SUM(Population)
    INTO total_population
    FROM city 
    WHERE CountryCode = country_code;
END $$
DELIMITER;

CALL get_country_population('NGA', @population);

--- precedure to get rental count and total payment for a customer
DELIMITER $$

CREATE PROCEDURE customer_rental_summary(
    IN customerId INT, OUT rental_count INT, OUT total_spent DECIMAL(10,2)
)
BEGIN
    SELECT COUNT(r.rental_id)
    INTO rental_count
    FROM rental r
    WHERE r.customer_id = customerId;

    SELECT SUM(p.amount)
    INTO total_spent
    FROM payment p
    WHERE p.customer_id = customerId;
END $$

DELIMITER;

CALL customer_rental_summary(5, @rentals, @spent);

SELECT @rentals, @spent;

-- this will create a stored procedure
DROP PROCEDURE IF EXISTS `sp_ListMembers`;


-- this will list all stored procedures in a database
SHOW PROCEDURE STATUS WHERE Db = 'world';

--- this will run a stored procedure
CALL CityCount('NGA');

-- this will create a stored procedure
DROP PROCEDURE IF EXISTS `sp_ListMembers`;

DROP PROCEDURE customer_rental_summary;

DELIMITER $$
CREATE PROCEDURE `sp_ListMembers` ()
BEGIN
SELECT * FROM make;
END$$
DELIMITER;

-- this will run a stored procedure
CALL sp_ListMembers;




DROP procedure IF EXISTS `sp_ListTableData`;
DELIMITER $$
CREATE PROCEDURE `sp_ListTableData` (IN TableName VARCHAR(100))
BEGIN
SET @sql =CONCAT('SELECT * FROM ', TableName);
PREPARE statement FROM @sql;
EXECUTE statement;
DEALLOCATE PREPARE statement;
END$$
DELIMITER;

-- this will run a stored procedure
CALL sp_ListTableData("make");