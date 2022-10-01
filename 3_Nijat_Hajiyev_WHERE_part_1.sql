-- Task 1
/*
Selectiona nümun? olan select komandas? yaz?n.
*/
select *
from employees
where employee_id = 107;


-- Task 2
/*
Employees c?dv?lind? job_id-si SA_REP v? ya MK_MAN qiym?tl?rind?n biri olan, ?m?k
haqq?s? 4000 v? 10000 aras?nda olan i?çil?rin siyah?s?n? ç?xar?n.
*/
select *
from employees
where (job_id = 'MK_MAN' or job_id = 'SA_REP')
    and salary between 4000 and 10000;


-- Task 3
/*
DEPARTMENTS c?dv?lind? ad?nda (department_name) ‘er’ hiss?ciyi olan departamentl?rin
siyah?n? ç?xaran sql yaz?n
*/
select *
from departments
where department_name like '%er%';


-- Task 4
/*
Locations c?dv?lind? street_address sütununda ‘-’ simvolu olan s?trl?ri ç?xaran sql yaz?n.
*/
select *
from locations
where street_address like '%-%';


-- Task 5
/*
Employees c?dv?lind? manager_id sütunu bo? olan s?tirl?rin employee_id ,first_name,
last_name sütunlar?n? ç?xaran sql yaz?n
*/
select 
    employee_id,
    first_name,
    last_name
from employees
where manager_id is null;


-- Task 6
/*
Employees c?dv?lind? ?m?k haqq?s? 5000 v? 10000 aras?nda olan i?çil?rin siyah?n? ç?xaran 2
?d?d sql yaz?n (between operatorundan istifad? etm?kl? v? etm?m?kl?).
*/
select *
from employees
where salary BETWEEN 5000 and 10000;

-- 2nd version
select *
from employees
where salary <= 10000 and salary >= 5000;


-- Task 7
/*
Employees c?dv?lind?n s?tirl?ri ç?xar, department_id-l?r? gör? s?ralanm??(böyük id yuxar?da),
eyni department_id-y? malik s?tirl?r bir daha employee_id sütununa gör? d?
s?ralans?nlar(kiçik id yuxar?da).
*/
select *
from employees
order by department_id desc, employee_id asc;


-- Task 8
/*
Employees c?dv?lind? commission_pct sütununa gör? s?ralama edin, null qiym?tl?r ?vv?l g?lsin.
*/
select *
from employees
order by commission_pct asc nulls first;


-- Task 9
/*
Employees c?dv?lind? first_name, last_name v? 12*salary m?lumatlar ç?xs?n, 3-cü sütuna
gör? s?ralanma olsun (kiçik qiym?t sonda)
*/
select first_name,
    last_name,
    salary * 12
from employees
order by 3 desc;


-- Task 10
/*
Employees c?dv?lind?n 2004-cü ild?n sonra i?? q?bul olunmu? v? maa?? 5000 –d?n böyük
olan yaxud da i?? q?bul tarixind?n as?l? olmayaraq maa?? 10000-d?n böyük olan bütün
i?çil?rin siyah?s?n? ç?xaran sql yaz?n.
*/
select *
from employees
where (hire_date > '31-dec-2004' and salary > 5000) or salary > 10000;


-- Task 11
/*
Jobs c?dv?lind?n JOB_TITLE-? Administration il? ba?layan v?zif?l?rin JOB_TITLE v? orta maa?
m?lumat?n? ç?xaran SQL yaz?n
*/
select job_title,
    (min_salary + max_salary) / 2  as "Average Salary"
from jobs
where job_title like 'Administration%';


-- Task 12
/*
Employees c?dv?lind?n SALARY-si 12000-d?n böyük olan departamentl?rin t?krarlanmayan
DEPARTMENT_ID siyah?s?n? ç?xaran SQl yaz?n.
*/
select unique department_id
from employees
where salary > 12000;


-- Task 13
/*
Departments c?dv?lind?n MANAGER_ID sütunu bo? olan s?tirl?rin DEPARTMENT_ID,
DEPARTMENT_NAME sütunlar?n? ç?xaran SQL yaz?n.
*/
select department_id,
    department_name
from departments
where manager_id is null;


-- Task 14
/*
Locations c?dv?lind?n C?TY sütunda ‘South’ sözü il? ba?layan STATE_PROVINCE ,
COUNTRY_ID ç?xaran SQL yaz?n.
*/
select state_province,
    country_id
from locations
where city like 'South%';


-- Task 15
/*
Countries c?dv?lind?n REGION_ID-si 1 olan olan s?tirl?ri ç?xaran SQl yaz?n.
*/
select *
from countries
where region_id = 1;

-- Task 16
/*
Countries c?dv?lind?n REGION_ID-si 2, 4 olmayan s?tirl?ri ç?xaran SQl yaz?n.
*/
select *
from countries
where region_id <> 2 and region_id <>4;

-- 2nd version
select *
from countries
where region_id not in (2, 4);


-- Task 17
/*
Jobs c?dv?lind?n MIN_SALARY v? MAX_SALARY f?rqi 10000-d?n çox olan s?tirl?ri ç?xaran SQL yaz?n.
*/
select *
from jobs
where (max_salary - min_salary) > 10000;


-- Task 18
/*
Employees c?dv?lind?n COMMISSION_PCT-si olmayan i?çil?rin aid oldugu departamentl?rin
t?krarlanmayan DEPARTMENT_ID siyah?s?n? ç?xaran SQL yaz?n.
*/
select unique department_id
from employees
where commission_pct is null;


-- Task 19
/*
Jobs c?dv?lind?n job_title-i ‘Manager’ sözü ile bit?n v? max_salary, min_salary f?rqi 5000-
d?n böyük olan v? ya job_id-si A ile ba?layan sütunlar? ç?xaran SQL yaz?n.
*/
select *
from jobs
where (job_title like '%Manager' and (max_salary - min_salary) > 5000) or job_id like 'A%';

-- Task 20
/*
Jobs c?dv?lind?n max_salary 5000 v? 15000 aral???nda olan v? job_id-si 'REP' il? bitm?y?n v?
ya min_salary-si 12000-d?n böyük olan sutunlar? ç?xaran SQL yaz?n.
*/
select *
from jobs
where ((max_salary between 5000 and 15000) and job_id not like '%REP') or min_salary > 12000;
