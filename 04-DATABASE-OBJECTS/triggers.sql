--- creating a trigger to prevent inserting cities with negative population
DELIMITER $$

CREATE TRIGGER prevent_negative_population
BEFORE INSERT ON city
FOR EACH ROW
BEGIN
	IF NEW.Population < 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Population cannot be negative';
	END IF;
END $$

DELIMITER;

--- this will list all triggers in a database
SHOW TRIGGERS;

-- maintaining country population
DELIMITER $$

CREATE TRIGGER update_country_population
AFTER INSERT ON city
FOR EACH ROW
BEGIN
	UPDATE country
	SET Population = Population + NEW.Population
	WHERE Code = NEW.CountryCode;
END $$

DELIMITER;






CREATE TABLE `lookups` (
  `Key` varchar(50) NOT NULL,
  `Value` varchar(255) NOT NULL,
  `Descriptions` varchar(255) NOT NULL,
  PRIMARY KEY (`Key`)
);


INSERT INTO `lookups` (`Key`, `Value`, `Descriptions`) VALUES ('MinMemberAge','18','Minimum age in years for members');

SELECT Firstname, Surname, DOB FROM members WHERE ID=2

INSERT INTO `members` (`Surname`,`FirstName`,`DOB`,`JoinDate`) VALUES ("Bloggs","Frederick","1990/06/15","2020/01/15");

INSERT INTO `autoclub`.`members` (`Surname`, `FirstName`, `MiddleNames`, `DOB`, `Signature`, `Photo`, `Active`, `JoinDate`) VALUES ('Bloggs', 'Frederick', 'James', '1990/06/15', b'1', b'2020/06/15');

INSERT INTO `members` (`Surname`, `FirstName`, `MiddleNames`, `DOB`, `Signature`, `Photo`, `Active`, `JoinDate`, `InactiveDate`) VALUES ('Sobotie', 'Omatsola', 'Isaac', '1990/06/15', '2015/01/09', '2015/01/09', 1, '2015/01/09', '2017/07/01');

SELECT Firstname, Surname, DOB FROM members WHERE ID=1;

-- this code will create a trigger for us
DELIMITER $$

DROP TRIGGER IF EXISTS autoclub.CheckMemberAge$$
USE `autoclub`$$
CREATE TRIGGER `CheckMemberAge` BEFORE UPDATE ON `members` FOR EACH ROW BEGIN
	declare msg varchar(128);
	SET @MinAge = (SELECT `Value` FROM LOOKUPS WHERE `KEY`='MinMemberAge');
	if NEW.dob > (SELECT DATE_SUB(curdate(), interval @MinAge year)) 
    THEN
	set msg = concat('MyTriggerError: Minimum member age is: ', @MinAge);
	signal sqlstate '45000' set message_text = msg;
	end if;

END$$

DELIMITER ;

-- testing the trigger 
UPDATE `members` SET `DOB` = '2010-10-15' WHERE ID = 1;

UPDATE `members` SET `DOB` = '1950-10-15' WHERE ID = 1;

SELECT Firstname, Surname, DOB FROM members WHERE ID=1;
