Select first_name ,last_name,age ,
CASE
WHEN age <= 30 THEN 'YOUNG'
END 
from employee_demographics ;


select first_name 
from employee_demographics;

Select first_name,last_name ,

case 
WHEN salary > 5000 THEN  salary *1.05  END AS SALARY_BONUS
-- END AS NEW_SALARY
FROM employee_salary ;

SELECT * 
FROM employee_demographics
WHERE employee_id IN  
      (select employee_id
      from employee_salary
      where dept_id = 1
      );  
select gender ,avg(age) ,MAX(age),MIN(age),COUNT(age)
from employee_demographics
group by gender;
-- select * 
-- from (gender ,avg(age) ,MAX(age),MIN(age),COUNT(age)
-- from employee_demographics
-- group by gender);

select gender ,AVG(salary) AS avg_salary 
from employee_demographics dem
JOIN employee_salary  sal 
	ON dem.employee_id=dem.employee_id
    group by gender;


select gender ,AVG(salary) over(partition by gender )
from employee_demographics dem
JOIN employee_salary  sal 
	ON dem.employee_id=dem.employee_id
    group by dem.first_name, dem,last_name,gender ;


SELECT dem.employee_id, 
       dem.first_name, 
       dem.last_name, 
       dem.gender,
       sal.salary, 
       ROW_NUMBER() OVER (PARTITION BY dem.gender
       ORDER BY sal.salary DESC) AS rank_within_gender
FROM employee_demographic dem 
JOIN employee_salary sal 
ON dem.employee_id = sal.employee_id ;
WITH CTE_example
( Gender ,AVG_Sal, Max_Sal_MIN_Sal_COUNT_Sal) AS
(
SELECT gender, avg(salary) avg_sal ,MAX(salary),MIN(salary),count(salary)
from employee_demographics dem 
join employee_salary sal 
	on dem.employee_id = sal.employee_id
    
group by gender 
)
select AVG(avg_sal)
from CTE_example
 ;

CREATE temporary table temp_table
(

 firstname varchar(50),
 last_name varchar(50),
 favourite_movie varchar(100)
);

select *
from temp_table;


INSERT INTO temp_table 

values('Aya','helmy','The Lrd of the ring ');

select *
from employee_salary;

create temporary table salary_over_50k
select *
from employee_salary
where salary >= 50000;


create procedure largesalary()

select *
from employee_salary
where salary >= 50000;


call largesalary();
DELIMITER //
CREATE PROCEDURE largesalary2()
BEGIN
    SELECT *
    FROM employee_salary
    WHERE salary >= 50000;
    SELECT *
    FROM employee_salary
    WHERE salary >= 10000;
END //
DELIMITER ;
call largesalary2();

-- DELIMITER //
-- CREATE PROCEDURE largesalary3( in employee_id int)
-- BEGIN
--     SELECT salary 
--     FROM employee_salary
--     WHERE employee_id = huggymuffin ;
-- END 
-- DELIMITER ;
-- call largesalary3(1);


DELIMITER //

CREATE PROCEDURE largesalary3(IN employee_id INT)
BEGIN
    SELECT salary 
    FROM employee_salary
    WHERE employee_id = employee_id;
END //

DELIMITER ;

CALL largesalary3(1);


DELIMITER //

CREATE TRIGGER employee_insert 
AFTER INSERT ON employee_salary 
FOR EACH ROW 
BEGIN 
    INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END //

DELIMITER ;

 INSERT INTO     employee_salary (employee_id ,first_name,last_name,occupation,salary,dept_id)
 values (13, 'Aya','oraby' , 'developer', 5000 ,12 );
 
 SELECT *
 FROM employee_salary;
    
   --  ---events
   
    DELIMITER //

CREATE EVENT delete_retirees 
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
    DELETE 
    FROM employee_demographics
    WHERE age >= 60;
END //

DELIMITER ;
 
SHOW VARIABLES LIKE 'event%';


select * 
from layoffs;

-- ---remove duplication 
-- --- 2 - standarlize data

-- null  value of or blank 
-- remove any columns


create table layoffs_staging
LIKE layoffs;

select * 
from layoffs_staging;

insert layoffs_staging
select * 
from layoffs;

select * ,                      --  detect redunduant
ROW_NUMBER() OVER(

 partition by company,industry,total_laid_off,percentage_laid_off,'date') as row_num
from layoffs_staging;

delete from world_layoffs
where company like "Hibob";

select * 
from layoffs_staging;

-- delete from layoffs_staging  where country = "Israel";
-- select * 
-- from layoffs_staging 
-- where country = "Israel";

SET SQL_SAFE_UPDATES = 0;

select *
from 
duplicate_cte
where row_num > 1;



delete from duplicate_cte
where row_num > 1 ;





with duplicate_cte as
(
select * ,                      --  detect redunduant
ROW_NUMBER() OVER(

 partition by company,industry,total_laid_off,percentage_laid_off,'date') as row_num
from layoffs_staging
)
select * 
from duplicate_cte 
where row_num > 1 ;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from layoffs_staging2;


insert into layoffs_staging2
select * ,                      --  detect redunduant
ROW_NUMBER() OVER(

 partition by company,industry,total_laid_off,percentage_laid_off,'date') as row_num
from layoffs_staging;

select *
from  layoffs_staging2
where 
row_num > 1 ;

delete from 
layoffs_staging2 
where row_num > 1;

--  Standardizing data 
 
 select company,  trim(company)
 from  layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select * from layoffs_staging2;
-- see what is distinct 
-- set update
select distinct industry 
from layoffs_staging2
group by 1;

select * 
from layoffs_staging2 
where industry like 'Crypto%';

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%' ;

-- standardlize Location
select 
distinct country from  layoffs_staging2
group by 1;

update layoffs_staging2
set country = 'USA'
where country like 'United States%' ;

SELECT `date`-- ,
      --  STR_TO_DATE(`date`, '%m/%d/%Y') AS formatted_date
FROM layoffs_staging2;


update layoffs_staging2
set date =  STR_TO_DATE(`date`, '%m/%d/%Y');

alter table layoffs_staging2
modify column `date` DATE;


SELECT DATE from layoffs_staging2
;

select * 
from layoffs_staging2 
where industry is null
or industry = '';
         





 select t1.industry , t2.industry
from layoffs_staging2  t1
join layoffs_staging2  t2 
  on 
    t1.company = t2.company
   --  and t1.location = t2.location
    where t1.industry is null or t1.industry = '' and
         t1.industry is not null;
         
         
         
select * 
from layoffs_staging2 
where company = 'Airbnb';
         
update layoffs_staging2  t1
join layoffs_staging2  t2 
  on 
    t1.company = t2.company
  set t1.industry = t2.industry
 where t1.industry is null and
         t2.industry is not null;
         
update layoffs_staging2 
set industry = null 
where industry = ''
 ;
 select * 
 from layoffs_staging2 
 where total_laid_off is null
 and percentage_laid_off is null;
  
 delete
 from layoffs_staging2 
 where total_laid_off is null
 and percentage_laid_off is null;



select* 
from layoffs_staging2;



alter table layoffs_staging2
drop column row_num;









 




















