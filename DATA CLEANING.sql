CREATE DATABASE `HUMAN RESOURCE`;

USE `HUMAN RESOURCE`;

SELECT * FROM `human resource`;

DESCRIBE `HUMAN RESOURCE`;

-- CHANGE THE NAME OF THE FIRST COLUMN TO BE DESCRIPTIVE 
ALTER TABLE `HUMAN RESOURCE`
RENAME COLUMN `ï»¿id` TO EMP_ID;

-- CHANGE THE BIRTHDATE TO DATE
ALTER TABLE `HUMAN RESOURCE`
MODIFY BIRTHDATE DATE;

-- STR_TO_DATE(): IS USED TO CONVERT STRING/TEXT TO DATE

SELECT str_to_date(BIRTHDATE, "%m/%d/%Y")
FROM `HUMAN RESOURCE`;

UPDATE `HUMAN RESOURCE`
SET BIRTHDATE = CASE WHEN BIRTHDATE LIKE "%/%/%" 
THEN date_format(str_to_date(BIRTHDATE, "%m/%d/%Y"), "%Y-%m-%d")
ELSE date_format(str_to_date(BIRTHDATE, "%m-%d-%Y"), "%Y-%m-%d") end;

ALTER TABLE `HUMAN RESOURCE` 
MODIFY BIRTHDATE date;



UPDATE `HUMAN RESOURCE`
SET HIRE_DATE = CASE WHEN HIRE_DATE LIKE "%/%/%" 
THEN date_format(str_to_date(HIRE_DATE, "%m/%d/%Y"), "%Y-%m-%d")
ELSE date_format(str_to_date(HIRE_DATE, "%m-%d-%Y"), "%Y-%m-%d") end;

ALTER TABLE `HUMAN RESOURCE` 
MODIFY HIRE_DATE date;

UPDATE `HUMAN RESOURCE`
SET HIRE_DATE = date_format( str_to_date(HIRE_DATE, "%Y-%M-%d"), "%Y-%m-%d"); 

-- HOW MANY EMPLOYEES WORK IN HEAD QUARTER VERSUS REMOTE

Select location, count(emp_id) `TOTAL EMPLOYEES`
from `HUMAN RESOURCE`
GROUP BY LOCATION;

CREATE VIEW LOCATION AS
Select location, count(emp_id) `TOTAL EMPLOYEES`
from `HUMAN RESOURCE`
GROUP BY LOCATION;

-- SHOW THE AGE DISTRIBUTION OF THE EMPLOYEES

Alter table `human resource`
ADD COLUMN AGE INT;
update human resource
set Age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());
SELECT CONCAT(FLOOR(TIMESTAMPDIFF(YEAR,birthdate, CURDATE()) / 10) * 10, '-', 
FLOOR(TIMESTAMPDIFF(YEAR,birthdate, CURDATE()) / 10) * 10 + 9) AS age_range,
COUNT(employee_id) AS number_of_employees
FROM `human resource`
GROUP BY age_range
ORDER BY age_range;

alter table `human resource`
drop distinct column age;

SELECT BIRTHDATE, FLOOR(DATEDIFF(CURDATE(), BIRTHDATE)/365.25) AS AGE
FROM `HUMAN RESOURCE`;

select * from `human resource`;

alter table `human resource`
drop column age_id;

alter table `human resource`
drop column age;

Alter table `human resource`
ADD COLUMN AGE INT;

update `human resource`
set Age =TIMESTAMPDIFF(YEAR,birthdate,CURDATE());

SELECT 
CONCAT(FLOOR(TIMESTAMPDIFF(YEAR,birthdate,CURDATE())/10) * 10,'-',FLOOR(TIMESTAMPDIFF(YEAR,birthdate,CURDATE()) / 10) * 10 + 9) AS age_range,COUNT(employee_id) AS number_of_employees
FROM `human resource`
GROUP BY age_range
order by;