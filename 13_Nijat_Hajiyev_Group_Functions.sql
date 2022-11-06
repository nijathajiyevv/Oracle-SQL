-- Task 1
/*
H?r regionda yerl???n �lk?l?rin say?n? �?xaran SQL yaz?n.
N?tic?d? iki s�tun olacaq: region_id, count_country.
*/
select
    region_id,
    count(country_name)
from countries
group by region_id;

-- Task 2
/*
Employees c?dv?lind? h?r department_id �zr?, commission_pct s�tunlar?n?n null olan v? null olmayan
s?tirl?rin saylar?n? �?xaran sql yaz?n. N?tic?d? �� s�tun olacaq: department_id, null_count, notnull_count
*/
select
    department_id as "Department ID",
     count(*)- count(commission_pct) as "Null count",
    count(commission_pct) as "Not null count"
from employees
group by department_id
order by department_id;


-- Task 3
/*
Employees c?dv?lind? employee_id-si t?k olan v? c�t olan
s?tirl?rin salary-l?rinin c?ml?rini �?xaran SQL yaz?n.
N?tic?d? iki s�tun olacaq: count_odd, count_even
*/
select
    sum(case
        when mod(employee_id,2)=1 then sum(salary)
    else null
    end),
    
    sum(case
        when mod(employee_id,2)=0 then sum(salary)
    else null
    end)
from employees
group by mod(employee_id,2);


-- Task 4
/*
H?r ?�b? �zr? department_id v? h?min ?�b?d?
i?l?y?nl?rin aras?nda ?n az v? ?n �ox olan ?m?k
haqq?lar?n f?rqini �?xaran SQL yaz?n.
*/
select
    department_id,
    max(salary) - min(salary)
from employees
group by department_id
order by department_id;


-- Task 5
/*
H?r department �zr? ?n tez i?? girm? tarixi il?,
gec i?? girm? tarixl?ri arasindak? ay f?rqini �?xaran SQL yaz?n.
N?tic?d?: department_id, min_hire_date, max_hire_date, diff_hire_date_by_months
*/
select
    department_id as "Department ID",
    min(hire_date) as "Earliest hire date",
    max(hire_date) as "Laterst hire date",
    round(months_between(max(hire_date), min(hire_date))) as "Difference"
from employees
group by department_id
order by department_id;


-- Task 6
/*
Employees c?dv?lind?n departamentl?r �zr? maa? c?mi ?n �ox olan? �?xar?n.
N?tic?d? bir s�tun olacaq: max_of_sum_salary_by_dep.
*/
select
    sum(salary)
from employees
group by department_id
order by 1 desc
fetch first 1 rows only;


-- Task 7
/*
Employees c?dv?lind?n 2001, 2002, 2003 v? 2004-c� ill?rd? i??
girmi? ?m?kda?lar?n saylar?n? ayr?-ayr?
s�tunlarda �?xaran SQL yaz?n.
N?tic?d? bir s?trd? d�rd s�tun: �2001�, �2002�, �2003�, �2004�.
*/


-- Task 8
/*
Employees c?dv?lind?n 2001, 2002, 2003 v? 2004-c� ill?rd? i?? girmi? ?m?kda?lar?n saylar?n? ayr?-ayr?
s�tunlarda v? sonuncu s�tunda is? �mumi say?n? �?xaran SQL yaz?n.
N?tic?d? bir s?trd? be? s�tun olacaq: �2001�, �2002�, �2003�, �2004�, �2001-2004�.
*/


-- Task 9
/*
Employees c?dv?lind?n ilind?n as?l? olmayaraq, aylar �zr? i?? gir?nl?rin saylar?n? �?xaran SQL yaz?n.
N?tic?d? bir s?trd? on iki s�tun olacaq: Yanvar aylar? �zr? say, Fevral aylar? �zr? say, Mart aylar? �zr?
say, ... ,Dekabr aylar? �zr? say.
*/
select
    to_char(hire_date, 'Month'),
    count(employee_id)
from employees
group by to_char(hire_date, 'Month');


-- Task 10
/*
Employees c?dv?lind?n istifad? etm?kl?, h?r department_id-nin qar??s?na h?min departamentd?
i?l?y?n i?�il?rin say? q?d?r * i?ar?si �?xaran SQL yaz?n.
N?tic?d? iki s�tun olacaq: Department_ID, Stars.
*/
select
    department_id as "Department ID",
    count(employee_id) as "The number of emp",
    rpad('*', count(employee_id), '*')
from employees
group by department_id
order by 1;