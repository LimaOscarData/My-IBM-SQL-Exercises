-- Query 1------
----Retrieve all employees whose address is in Elgin,IL
;
select F_NAME , L_NAME
from EMPLOYEES
where ADDRESS LIKE '%Elgin,IL%' ;
--Query 2--
----Retrieve all employees who were born during the 1970's.
;
select F_NAME , L_NAME
from EMPLOYEES
where B_DATE LIKE '197%' ;
---Query3--
--Retrieve all employees in department 5 whose salary is 
--between 60000 and 70000 .
;
select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;
--Query4A--
--Retrieve a list of employees ordered by department ID.
;
select F_NAME, L_NAME, DEP_ID 
from EMPLOYEES
order by DEP_ID;
--Query4B--
--Retrieve a list of employees ordered in descending order 
--by department ID and within each department ordered 
--alphabetically in descending order by last name.(Query 4B)
;
select F_NAME, L_NAME, DEP_ID 
from EMPLOYEES
order by DEP_ID desc, L_NAME desc;
--Query5A--
--For each department ID retrieve the number of employees 
--in the department.
;
select DEP_ID, COUNT(*)
from EMPLOYEES
group by DEP_ID;

-- second way
select	dep_id, count(dep_id) 
from employees
group by dep_id; 
--Query5B--
--For each department retrieve the number of employees in 
--the department, and the average employees salary in the 
--department.(Query 5B)
;
select DEP_ID, COUNT(*), AVG(SALARY)
from EMPLOYEES
group by DEP_ID;
--Query5C--
--Label the computed columns in the result set of Query 5B
-- as NUM_EMPLOYEES and AVG_SALARY.(Query 5C)
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID;

--my code
select dep_id, count(dep_id) as NUM_EMPLOYEES, avg(salary) AVG_SALARY
from employees
group by dep_id;
--Query5D--
-- In Query 5C order the result set by Average Salary.(Query 5D)
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
order by AVG_SALARY;
--Query5E--
-- In Query 5D limit the result to departments with fewer than 4 
--employees.
--Note: WHERE clause is used for filtering the entire result set 
--whereas the HAVING clause is used for filtering the result of the 
--grouping
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
having count(*) < 4
order by AVG_SALARY;

--5E alternative: if you want to use the label
--Similar to 4B but instead of department ID use department name. 
--Retrieve a list of employees ordered by department name, and 
--within each department ordered alphabetically in descending 
--order by last name.
select DEP_ID, NUM_EMPLOYEES, AVG_SALARY from
  ( select DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY from EMPLOYEES group by DEP_ID)
  where NUM_EMPLOYEES < 4
order by AVG_SALARY;
--BONUS Query6--
;
select D.DEP_NAME , E.F_NAME, E.L_NAME
from EMPLOYEES as E, DEPARTMENTS as D
where E.DEP_ID = D.DEPT_ID_DEP
order by D.DEP_NAME, E.L_NAME desc ;