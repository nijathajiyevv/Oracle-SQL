-- Task 21
/*
Locations c?dv?lind?n country_id-si US,UK,CA olmayan v? ya country_id-si UK olub
state_province s�tunu bo? olan s?tirl?ri �?xaran sql yaz?n
*/
select *
from locations
where country_id not in ('US', 'UK', 'CA') 
    or (country_id = 'UK' and state_province is null);


-- Task 22
/*
Locations c?dv?lind?n city sutunu Roma, Tokyo olmayan v? country_id-si US,UK,CA olmayan
v? ya country_id-si CN olub state_province s�tunu bo? olan s?tirl?ri �?xaran sql yaz?n.
*/
select *
from locations
where (city not in ('Roma', 'Tokyo') and country_id not in ('US', 'UK', 'CA'))
    or (country_id = 'CN' and state_province is null);


-- Task 23
/*
Locations c?dv?lind?n city sutunu 'Venice','Hiroshima','Bern' olan v? country_id-si 'JP' olan v?
ya state_province-si null olub country_id-si 'JP','IT' olmayan s?tirl?ri �?xaran sql yaz?n.
*/
select *
from locations
where (city in ('Venice','Hiroshima','Bern') and country_id = 'JP')
    or (state_province is null and country_id not in ('JP','IT'));



-- Task 24
/*
Regions c?dv?lind?n region_name s�tununda probel(bo?luq) olmayan v? region_id 2-d?n
b�y�k b?rab?r olan s?tirl?ri �?xaran sql yaz?n.
*/
select *
from regions
where region_name not like '% %' 
    and region_id >= 2;


-- Task 25
/*
Employees c?dv?lind?n manager_id-si 115-d?n b�y�k olan v? ya department_id-si 60-a
b?rab?r olan s?tirl?ri �?xaran sql yaz?n.
*/
select * 
from employees
where manager_id > 115 or department_id = 60;


-- Task 26
/*
Employees c?dv?lind?n salary-si 10000-den b�yuk olan v? ya commission_pct olmayan v?
department_id-si 90 s?tirl?ri �?xaran sql yaz?n.
*/
select *
from employees
where (salary > 10000 or commission_pct is null) 
    and department_id = 90;


-- Task 27
/*
Employees c?dv?lind?n manager_id-si 120-den ki�ik olan v? ya department_id-si 60-a
b?rab?r olan s?trl?ri �?xaran sql yaz?n
*/
select *
from employees
where manager_id < 120 or department_id = 60;


-- Task 28
/*
Departments c?dv?lind?n department_name �ing� il? bit?n v? manager_id-si 200-d?n boyuk
olan s?tirl?ri �?xaran sql yaz?n
*/
select *
from departments
where department_name like '%ing' and manager_id > 200;


-- Task 29
/*
Employees c?dv?lind?n ?n az maa? alan ilk 5 i?�inin adlari v? maa?lar?n? �?xaran sql yaz?n.
*/
select first_name, salary
from employees
order by salary asc fetch first 5 rows only;


-- Task 30
/*
Employees c?dv?lind?n last_name s�tunda �a� h?rfi olan v? ya salary 9000-d?n
b�y�k olan i?�il?rin employee_id, last_name, salary v? job_id s�tunlar?n? �?xaran SQL
yaz?n.
*/
select employee_id, last_name, salary, job_id
from employees
where last_name like '%a%' or salary > 9000;


-- Task 31
/*
Employees c?dv?lind?n last_name s�tunun sondan 3-c� h?rfi �i� h?rfi olan v?
commission_pct bo? olmayan i?�il?rin employee_id, last_name, commission_pct v?
job_id s�tunlar?n? �?xaran SQL yaz?n.
*/
select employee_id,
    last_name,
    commission_pct,
    job_id
from employees
where last_name like '%i__' and commission_pct is not null;


-- Task 32
/*
Employees c?dv?lind?n telefon n�mr?sinin 4-c� simvolu �.� olan v? ya commission_pct bo?
olan i?�il?rin employee_id, last_name v? phone_number s�tunlar?n? �?xaran SQL yaz?n.
*/
select employee_id, last_name, phone_number
from employees
where phone_number like '___.%' or commission_pct is null;


-- Task 33
/*
Locations c?dv?linin country_id-si UK,US olan setrleri a?a??dak? ?ablona uy?un
�?xaran SQL yaz?n:
<street_address> is located in < country_id >
Alias: Address_info 
*/
select street_address || ' is located in ' || country_id as "Address_info"
from locations
where country_id in ('UK', 'US');


-- Task 34
/*
Jobs c?dv?lind?n max_salary 30000-den boyuk ve ya min_salary 20000-den ki�ik
olan job_title, max_salary, min_salary �?xaran SQL yaz?n
*/
select job_title, max_salary, min_salary
from jobs
where max_salary >30000 or min_salary < 20000;


-- Task 35
/*
Employees c?dv?lind?n manager_id s�tunu 100 v? 110 aras?nda olan ve first_name
�J� ile baslamayan i?�il?rin employee_id,first_name, last_name v? manager_id
s�tunlar?n? �?xaran SQL yaz?n
*/
select employee_id,first_name, last_name, manager_id
from employees
where manager_id between 100 and 110 
    and first_name not like 'J%';


-- Task 36
/*
Employees c?dv?lind?n department_id s�tunu 10, 20 v? 40 olan ve ya
commission_pct bos olan i?�il?rin employee_id, last_name v? department_id s�tunlar?n?
�?xaran SQL yaz?n
*/
select employee_id, last_name, department_id
from employees
where department_id in (10, 20, 40) 
    or commission_pct is null;


-- Task 37
/*
Employees c?dv?lind?n salary s�tunu 10000 v? 15000 aras?nda olan ve salary
sutunu 6000 olmayan i?�il?rin employee_id, last_name v? salary s�tunlar?n? �?xaran SQL yaz?n
*/
select employee_id, last_name, salary
from employees
where (salary between 10000 and 15000) 
    and salary <> 6000;


-- Task 38
/*
Locations c?dv?lind?n location_id s�tunu 1500-den boyuk olan ve country_id-si US,
CA olan location_id, city ve country_id s�tunlar?n? �?xaran SQL yaz?n.
*/
select location_id, city, country_id
from locations
where location_id > 1500 and country_id in ('US', 'CA');


-- Task 39
/*
Employees c?dv?lind?n job_id s�tunu �REP� il? bit?n i?�il?rin b�t�n s�tunlar?n?
�?xaran SQL yaz?n.
*/
select *
from employees
where job_id like '%REP';


-- Task 40
/*
Employees c?dv?lind?n employee_id 105-den boyuk olan hemcinin first_name �A� ile
baslayan i?�il?rin ve ya commission_pct s�tunu NULL olan olan i?�il?rin employee_id,
last_name v? commission_pct s�tunlar?n? �?xaran SQL yaz?n.
*/
select employee_id, last_name, commission_pct
from employees
where (employee_id > 105 and first_name like 'A%') 
    or commission_pct is null;


-- Task 41
/*
Employees c?dv?lind?n employee_id-si 105-den boyuk olan i?�il?rd?n commission_pct
s�tunu NULL olan ve ya first_name �A� ile baslayan i?�il?rin employee_id, last_name
v? commission_pct s�tunlar?n? �?xaran SQL yaz?n.
*/
select employee_id, last_name, commission_pct
from employees
where employee_id > 105  
    and (commission_pct is null or first_name like 'A%');


-- Task 42
/*
Employees c?dv?lind?n email s�tununda 2-ci h?rfi �M� olan v? email s�tununda �mumiyy?tl?
�S� h?rfi olan h?m�inin commission_pct-si bo? olmayan s?tirl?rin employee_id, job_id,
department_id s�tunlar?n? �?xaran SQL yaz?n. N?tic? employee_id-y? g�r? azalan s?rada d�z�ls�n.
*/
select employee_id, job_id, department_id
from employees
where email like '_M%' and email like '%S%'
    and commission_pct is not null
order by employee_id desc;

-- Task 43
/*
Employees c?dv?lind?n employee_id s�tunu 200 v? 205 aras?nda olan i?�il?rin employee_id
last_name s�tunlar?n? birl??dirib emp_no alias? il? v? manager_id s�tunlar?n? �?xaran SQL yaz?n.
*/
select employee_id || ' ' || last_name as emp_no,
    manager_id
from employees
where employee_id between 200 and 205;

-- Task 44
/*
Employees c?dv?lind?n: ad?, soyad?, bonusu (salary*commission_pct) v? bonus + maash
c?mini �?xar?n. Selection=salary * commission_pct >2000
Aliaslar: ad, soyad, bonus, bonus v? maash
*/
select first_name as "Ad",
    last_name as "Soyad",
    salary * commission_pct as "Bonus",
    (salary * commission_pct) + salary as "Bonus + Maash"
from employees;

-- Task 45
/*
Employees c?dv?lind?n salary-si 10000-12000 aral???nda olan s?tirl?rin employee_id,
last_name, salary-nin kubunu �?xaran SQL yaz?n.
Aliaslar: ?d, Soyad, Salary^3
*/
select employee_id as "Id",
    last_name as "Soyad",
    salary * salary * salary as "Salary^3"
from employees
where salary between 10000 and 12000;

-- Task 46
/*
Employees c?dv?lind?n 50-ci departamentd? i?l?y?nl?r aras?nda job_id-si 'S' il? bashlayan
?m?kda?lar? �?xaran SQL yaz?n.
*/
select *
from employees
where department_id = 50 and job_id like 'S%';

-- Task 47
/*
Employees c?dv?lind?n Soyadi 'K' v? 'A' h?rfi il? ba?layan i?�il?rd?n department_id-si 60-dan
ki�ik olanlar? �?xaran SQL yaz?n.
*/
select *
from employees
where (last_name like 'K%' or last_name like 'A%')
    and department_id < 60;

-- Task 48
/*
Employees c?dv?lind? department_id-si manager_id-sinin yarisindan b�y�k olan i?�il?ri
�?xaran SQL yaz?n.
*/
select *
from employees
where department_id > (manager_id /2);

-- Task 49
/*
Employees c?dv?lind?n maa?? ?n �ox olan i?�inin m?lumatlar?n? �?xar?n
*/
select *
from employees
order by salary desc fetch first 1 rows only;

-- Task 50
/*
Select list: location_id, street_address s�t�nlar?n? g�st?rin.
??rt: hans? street_address-l?rd? ?n azi 2 dene probel (boshluq) i?ar?si var.
Sort: city sutununa gor?, ?lifba s?ras?n?n t?rsin?.
--18 setir
*/
select location_id,
    street_address
from locations
where street_address like '% % %'
order by city desc;

-- Task 51
/*
Employees c?dv?lind?n employee_id-si 200 olan i?�inin employee_id, first_name, last_name
s�tunlar?n? �?xaran SQl yaz?n.
*/
select employee_id, first_name, last_name
from employees
where employee_id = 200;

-- Task 52
/*
Employees c?dv?lind?n salary-si 10000-d?n b�y�k olan i?�il?rin m?lumatlar?n? �?xaran SQl yaz?n.
*/
select *
from employees
where salary > 10000;

-- Task 53
/*
Departments c?dv?lind?n department_name s�tunu A h?rfi il? bit?n s?tirl?ri �?xaran SQL yaz?n.
*/
-- Bel? department yoxdur
select * 
from departments
where department_name like '%A';

-- Task 54
/*
Locations c?dv?lind?n street_address s�tunda Via s�z� olan s?tirl?ri �?xaran SQL yaz?n.
*/
select *
from locations
where street_address like '%Via%';

-- Task 55
/*
Locations c?dv?lind?n location_id-si 1400-d?n 1700-? q?d?r olan s?tirl?ri �?xaran SQL yaz?n
*/
select *
from locations
where location_id between 1400 and 1700;

-- Task 56
/*
Countries c?dv?lind?n country_name s�tununda a v? ardinca d h?rfl?ri olan s?tirl?ri �?xaran SQL yaz?n.
*/
select *
from countries
where country_name like '%ad%';

-- Task 57
/*
Countries c?dv?lind?n country_name s�tunu A ba?layan v? ki�ik a h?rfi il? bit?n s?tirl?ri
�?xaran SQL yaz?n
*/
select *
from countries
where country_name like 'A%a';

-- Task 58
/*
Employees c?dv?lind?n manager_id-si bo? olan s?tri �?xaran SQL yaz?n.
*/
select *
from employees
where manager_id is null;

-- Task 59
/*
Jobs c?dv?lind?n job_id s�tununda sondan 4-c� simvolu _ olan s?tirl?ri �?xaran SQL yaz?n
*/
select *
from jobs
where job_id like '%/____' escape '/';

-- Task 60
/*
Employees c?dv?lind?n employee_id-si department_id-nin 2 qat?ndan 4 vahid �ox olan olan
s?tirl?ri a?a??dak? formada �?xaran SQL yaz?n
<employee_id> ededi <department_id> ?d?dinin 2 mislind?n 4 vahid �oxdur.
Alias:Employee_id v? department_id f?rqi
*/
select employee_id||' ededi '||department_id||' ededinin 2 mislinden 4 vahid choxdur.' as "Employee_id v? department_id f?rqi" 
from hr.employees 
where employee_id=department_id*2+4;


-- Task 61
/*
Employees c?dv?lind?n manager_id �si 120-d?n ki�ik v? ya department_id-si 100-d?n b�y�k
olan t?krarlanmayan manager_id siyah?s?n? �?xaran sql yaz?n
*/
select unique manager_id
from employees
where manager_id < 120 or department_id > 100;
