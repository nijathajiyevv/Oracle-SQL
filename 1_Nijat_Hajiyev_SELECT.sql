-- Task 1
/*
HR schemas?nda olan bütün c?dv?ll?rin adlar?n?n siyah?s?n? ç?xaran sql yaz?n.
*/
SELECT table_name
FROM all_tables;


-- Task 2
/*
Job_History c?dv?lind? olan bütün sütunlar? ç?xaran sql yaz?n.
*/
SELECT *
FROM job_history;


-- Task 3
/*
Job_History c?dv?lind?n ilk iki sütunu ç?xaran sql yaz?n.
*/
SELECT employee_id, start_date
FROM job_history;


-- Task 4
/*
Job_History c?dv?lind?n employee_id, start_date v? end_date sütunlar?n? ç?xaran sql yaz?n.
N?tic?d? sütunlar?n adlar? a?a??dak? kimi görünsün:
Emp#, Start at, End at
*/
select  t.employee_id as "Emp#",
        t.start_date as "Start at",
        t.end_date as "End at"
from hr.job_history t;


-- Task 5
/*
Locations c?dv?lind? olan bütün sütunlar? birl??dirib, bir sütun kimi ç?xaran sql yaz?n.
N?tic?d? sütunun ad? a?a??dak? kimi olsun:
Full location info
*/
select t.location_id||' '||t.street_address||' '||t.postal_code||' '||t.city||' '||t.state_province||' '||t.country_id as "Full location info"
from hr.locations t;


-- Task 6
/*
Locations c?dv?lind?n 1-ci sütunda location_id-ni, 2-ci sütunda is? city v? state_province
sütunlar?n? aralar?nda '/' i?ar?si olmaqla birl??dirib ç?xaran sql yaz?n.
N?tic?d? sütunlar?n adlar? a?a??dak? kimi görünsün:
Loc No, city/state
*/
select 
        t.location_id as "Loc No",
        t.city||'/'||t.state_province as "city/state"
from hr.locations t;


-- Task 7
/*
Departments c?dv?lind?n istifad? etm?kl? ist?nil?n projection yaz?n
*/
SELECT department_id || ' - ' || department_name
FROM departments;


-- Task 8
/*
Employees c?dv?lind?n first_name, last_name, employee_id, manager_id v? manager_id il?
employee_id-nin f?rqini(ç?xma) ç?xaran sql yaz?n
*/
SELECT first_name, 
    last_name, 
    employee_id, 
    manager_id, 
    manager_id - employee_id as Difference
FROM employees;


-- Task 9
/*
Employees c?dv?lind?n r?q?m (number) tipind? olan bütün sütunlar? birl??dirib, bir sütun kimi
ç?xaran sql yaz?n.
N?tic?d? h?min sütuna öz ist?diyiniz alis? verin
*/
DESCRIBE HR.EMPLOYEES;
SELECT employee_id || ' ' || salary || ' ' || commission_pct || ' ' || manager_id || ' ' || department_id as reqemler
FROM hr.employees;


-- Task 10
/*
Jobs c?dv?lind?n istifad? ed?r?k, a?a??dak? nümun?y? uy?un n?tic? ç?xaran sql yaz?n.
JOB_ID Salary info
AD_PRES President earns salary in range of 20080 and 40000
AD_VP Administration Vice President earns salary in range of 15000 and 30000
AD_ASST Administration Assistant earns salary in range of 3000 and 6000
FI_MGR Finance Manager earns salary in range of 8200 and 16000
FI_ACCOUNT Accountant earns salary in range of 4200 and 9000
Sizin n?tic?nizd? 19 s?tr olacaq.
*/
SELECT job_id,
    job_title || ' earns salary in range of ' || min_salary || ' and ' || max_salary as Salary_info
FROM jobs;
