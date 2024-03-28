#SQLproject-2
/*
Once a student is passed out from a Institute or College, he/she is known as Alumni of the Institute. Alumni’s career growth plays important role in Institute’s ranking and other networking activities. In this project, career choices of alumni of two Universities will be analyzed with respect to their passing year as well as the course they completed. 

Dataset: Six .csv file (Alumni record of College A and College B) Higher Studies, Self Employed and Service/Job record 

College_A_HS ~ Higher Studies Record of College A
College_A_SE ~ Self Employed Record of College A
College_A_SJ ~ Service/Job Record of College A
College_B_HS ~ Higher Studies Record of College B
College_B_SE ~ Self-Employed Record of College B
College_B_SJ ~ Service/Job respectively Record of College B
Tasks to be performed
*/
-- 1.Create new schema as alumni
create database alumni;
use alumni;
-- 2.Import all .csv files into MySQLS
#ans:all tables are imported  from imported wizard mode
-- 3.Run SQL command to see the structure of six tables
show tables;
desc college_a_hs;
desc college_a_se;
desc college_a_sj;
desc college_b_hs;
desc college_b_se;
desc college_b_sj;
select * from college_a_hs;
select * from  college_a_se;
select * from  college_a_sj;
select * from  college_b_hs;
select * from  college_b_se;
select * from  college_b_sj;
-- 4.Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python.
# (Submit the solution in jupyter notebook)
#Ans:i done in jupyter notebook
-- 5.Import all the records of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) into MS Excel. (submit Excel file for this question) 
#in excel i import all tables in the excel file
-- 6.Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values. 
create or replace  view college_a_hs_v as
(SELECT 
    *
FROM
    college_a_hs
WHERE
    RollNo IS NOT NULL
        AND lastUpdate is not null
        AND Name IS NOT NULL
        AND FatherName IS NOT NULL
        AND MotherName IS NOT NULL
        AND Batch IS NOT NULL
        AND Degree IS NOT NULL
        AND PresentStatus IS NOT NULL
        AND HSDegree IS NOT NULL
        AND EntranceExam IS NOT NULL
        AND Institute IS NOT NULL
        AND Location IS NOT NULL);
select * from college_a_hs_v;
-- 7.Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.
create or replace  view college_a_se_v as
SELECT 
    *
FROM
    college_a_se
WHERE
    RollNo IS NOT NULL
        AND lastUpdate IS NOT NULL
        AND Name IS NOT NULL
        AND FatherName IS NOT NULL
        AND MotherName IS NOT NULL
        AND Batch IS NOT NULL
        AND Degree IS NOT NULL
        AND PresentStatus IS NOT NULL
        AND Organization IS NOT NULL
        AND Location IS NOT NULL;
select * from college_a_se_v;
-- 8.Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.
create or replace  view college_a_sj_v as
SELECT 
    *
FROM
    college_a_sj
WHERE
    RollNo IS NOT NULL
        AND lastUpdate IS NOT NULL
        AND Name IS NOT NULL
        AND FatherName IS NOT NULL
        AND MotherName IS NOT NULL
        AND Batch IS NOT NULL
        AND Degree IS NOT NULL
        AND PresentStatus IS NOT NULL
        AND Organization IS NOT NULL
        AND Designation IS NOT NULL
        AND Location IS NOT NULL;
select * from college_a_sj_v;
-- 9.Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.
create or replace  view college_b_hs_v as
SELECT 
    *
FROM
    college_b_hs
WHERE
    RollNo IS NOT NULL
        AND lastUpdate IS NOT NULL
        AND Name IS NOT NULL
        AND FatherName IS NOT NULL
        AND MotherName IS NOT NULL
        AND Branch IS NOT NULL
        AND Batch IS NOT NULL
        AND Degree IS NOT NULL
        AND PresentStatus IS NOT NULL
        AND HSDegree IS NOT NULL
        AND EntranceExam IS NOT NULL
        AND Institute IS NOT NULL
        AND Location IS NOT NULL;
select * from college_b_hs_v;
-- 10.Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.
create or replace  view college_b_se_v as
SELECT 
    *
FROM
    college_b_se
WHERE
    RollNo IS NOT NULL
        AND lastUpdate IS NOT NULL
        AND Name IS NOT NULL
        AND FatherName IS NOT NULL
        AND MotherName IS NOT NULL
        AND Branch IS NOT NULL
        AND Batch IS NOT NULL
        AND Degree IS NOT NULL
        AND PresentStatus IS NOT NULL
        AND Organization IS NOT NULL
        AND Location IS NOT NULL;
select * from college_b_se_v;
-- 11.Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.
create or replace  view college_b_sj_v as
SELECT 
    *
FROM
    college_b_sj
WHERE
    RollNo IS NOT NULL
        AND lastUpdate IS NOT NULL
        AND Name IS NOT NULL
        AND FatherName IS NOT NULL
        AND MotherName IS NOT NULL
        AND Branch IS NOT NULL
        AND Batch IS NOT NULL
        AND Degree IS NOT NULL
        AND PresentStatus IS NOT NULL
        AND Organization IS NOT NULL
        AND Designation IS NOT NULL
        AND Location IS NOT NULL;
select * from college_b_sj_v;
-- 12.Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 
delimiter $$
create procedure String_funcn_procedure()
begin
select lower(Name),lower(FatherName),lower(MotherName) from college_a_hs_v;
select lower(Name),lower(FatherName),lower(MotherName) from college_a_se_v;
select lower(Name),lower(FatherName),lower(MotherName) from college_a_sj_v;
select lower(Name),lower(FatherName),lower(MotherName) from college_b_hs_v;
select lower(Name),lower(FatherName),lower(MotherName) from college_b_se_v;
select lower(Name),lower(FatherName),lower(MotherName) from college_b_sj_v;
end $$
delimiter ;
call String_funcn_procedure();
drop procedure String_funcn_procedure;
delimiter $$
create procedure String_funcn_procedure1()
begin
select lower(Name),lower(FatherName),lower(MotherName) from college_a_hs_v
union
select lower(Name),lower(FatherName),lower(MotherName) from college_a_se_v
union
select lower(Name),lower(FatherName),lower(MotherName) from college_a_sj_v
union
select lower(Name),lower(FatherName),lower(MotherName) from college_b_hs_v
union
select lower(Name),lower(FatherName),lower(MotherName) from college_b_se_v
union
select lower(Name),lower(FatherName),lower(MotherName) from college_b_sj_v;
end $$
delimiter ;
call String_funcn_procedure1();
drop procedure String_funcn_procedure1;
-- 13.Import the created views 
-- (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V)
-- into MS Excel and make pivot chart for location of Alumni. 

-- 14.Write a query to create procedure get_name_collegeA using the cursor to fetch names of all students from college A.
DELIMITER $$
 CREATE PROCEDURE get_name_collegeA( INOUT fullname TEXT(40000) ) 
 BEGIN 
 DECLARE finished INT DEFAULT 0;
 DECLARE namelist VARCHAR (16000) DEFAULT "";
 DECLARE namedetails
 CURSOR FOR SELECT name FROM college_a_hs 
 UNION SELECT name FROM college_a_se
 UNION SELECT name FROM college_a_sj;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished=1; 
 OPEN namedetails; 
 getname1: LOOP 
 FETCH namedetails INTO namelist;
 IF finished =1 THEN LEAVE getname1;
 END IF;
 SET fullname = concat(namelist,",",fullname);
 END LOOP getname1;
CLOSE namedetails;
 end $$
 delimiter ;
SET @NAME="";
CALL get_name_collegeA(@NAME);
SELECT @NAME as full_name;
DROP PROCEDURE get_name_collegeA;


-- 15.Write a query to create procedure get_name_collegeB using the cursor to fetch names of all students from college B.
DELIMITER $$
 CREATE PROCEDURE get_name_collegeB( INOUT fullname TEXT(40000) ) 
 BEGIN 
 DECLARE finished INT DEFAULT 0;
 DECLARE namelist VARCHAR (16000) DEFAULT "";
 DECLARE namedetails
 CURSOR FOR SELECT name FROM college_b_hs 
 UNION SELECT name FROM college_b_se
 UNION SELECT name FROM college_b_sj;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished=1; 
 OPEN namedetails; 
 getname1: LOOP 
 FETCH namedetails INTO namelist;
 IF finished =1 THEN LEAVE getname1;
 END IF;
 SET fullname = concat(namelist,",",fullname);
 END LOOP getname1;
CLOSE namedetails;
 end $$
 delimiter ;
SET @NAME="";
CALL get_name_collegeB(@NAME);
SELECT @NAME as full_name;
DROP PROCEDURE get_name_collegeB;
-- 16.Calculate the percentage of career choice of College A and College B Alumni
-- -- (w.r.t Higher Studies, Self Employed and Service/Job)college_a_se
-- Note: Approximate percentages are considered for career choices.
SELECT 
    'higher studies',
    (SELECT 
            COUNT(*)
        FROM
            college_a_hs) / ((SELECT 
            COUNT(*)
        FROM
            college_a_hs) + (SELECT 
            COUNT(*)
        FROM
            college_a_se) + (SELECT 
            COUNT(*)
        FROM
            college_a_sj)) * 100 'college A percentage',
    (SELECT 
            COUNT(*)
        FROM
            college_b_se) / ((SELECT 
            COUNT(*)
        FROM
            college_b_hs) + (SELECT 
            COUNT(*)
        FROM
            college_b_se) + (SELECT 
            COUNT(*)
        FROM
            college_b_sj)) * 100 'college B percentage'

UNION SELECT 
    'Self Employeed',
    (SELECT 
            COUNT(*)
        FROM
            college_a_se) / ((SELECT 
            COUNT(*)
        FROM
            college_a_hs) + (SELECT 
            COUNT(*)
        FROM
            college_a_se) + (SELECT 
            COUNT(*)
        FROM
            college_a_sj)) * 100 'college A percentage',
    (SELECT 
            COUNT(*)
        FROM
            college_b_se) / ((SELECT 
            COUNT(*)
        FROM
            college_b_hs) + (SELECT 
            COUNT(*)
        FROM
            college_b_se) + (SELECT 
            COUNT(*)
        FROM
            college_b_sj)) * 100 'college B percentage'

UNION SELECT 
    'service job',
    (SELECT 
            COUNT(*)
        FROM
            college_a_sj) / ((SELECT 
            COUNT(*)
        FROM
            college_a_hs) + (SELECT 
            COUNT(*)
        FROM
            college_a_se) + (SELECT 
            COUNT(*)
        FROM
            college_a_sj)) * 100 'college A percentage',
    (SELECT 
            COUNT(*)
        FROM
            college_b_sj) / ((SELECT 
            COUNT(*)
        FROM
            college_b_hs) + (SELECT 
            COUNT(*)
        FROM
            college_b_se) + (SELECT 
            COUNT(*)
        FROM
            college_b_sj)) * 100 'college B percentage';

