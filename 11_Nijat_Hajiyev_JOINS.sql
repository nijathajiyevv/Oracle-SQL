-- Task 1
/*
Employees v? Departments c?dv?ll?rind?n istifad? etm?kl? h?r bir i?çinin ad?n?, soyad?n? v? çal??d???
departamentin ad?n? ç?xaran sql sor?usu t?rtib edin. ?g?r mü?t?rinin çal??d??? ?öb?ni t?yin etm?k
mümkün deyils?, onda 'Department not found' yaz?s? ç?xs?n.
107 setir
*/
select
    emp.first_name, 
    emp.last_name, 
    case 
        when dep.department_id is not null then dep.department_name
        else 'Department not found'
    end as department_name
from employees emp 
    left join departments dep
    on emp.department_id = dep.department_id;



-- Task 2
/*
Employees v? Departments c?dv?ll?rind?n istifad? etm?kl? h?r bir i?çinin ad?n?, soyad?n? v? çal??d???
departamentin managerinin ad?n? ç?xaran sql sor?usu t?rtib edin. ?g?r i?çinin çal??d???
departamenti t?yin etm?k mümkün deyils?, onda 'Department not found' yaz?s? ç?xs?n.
107 setir
*/
select
    emp.first_name as iscinin_Adi,
    emp.last_name as iscinin_soyadi,
    e.first_name as manager_name,
    case
        when dep.department_id is null then 'Department not found'
    else dep.department_name
    end
from employees emp 
    left join departments dep 
    on emp.department_id=dep.department_id
    left join employees e 
    on dep.manager_id=e.employee_id
order by emp.employee_id;



-- Task 3
/*
Employees, Departments v? Locations c?dv?ll?rind?n istifad? etm?kl? country_id-si ‘CA’,’IT’,’UK’
olan h?r bir i?çinin ad?n?, soyad?n? v? çal??d??? ?öb?nin yerl??diyi ??h?rin ad?n? ç?xaran sql sor?usu
t?rtib edin.
37 setir
*/
select
    emp.first_name,
    emp.last_name,
    loc.city
from employees emp 
    left join departments dep
    on emp.department_id = dep.department_id
    
    left join locations loc
    on loc.location_id = dep.location_id    
where country_id in ('CA','IT','UK');

select *
from departments;

select *
from employees;

select *
from locations
where country_id in ('CA','IT','UK');


-- Task 4
/*
'United' sozu il? ba?layan ölk?l?rd? yerl???n department siyah?s?n? ç?xaran SQL yaz?n.
25 setir
*/
select
    dep.department_name
from departments dep 
    left join locations loc
    on dep.location_id = loc.location_id
    
    left join countries cou
    on loc.country_id = cou.country_id
where country_name like 'United%';


-- Task 5
/*
H?r ??h?rin (city) qar??s?na yerl??diyi ölk?nin ad?n? (country_name) ç?xaran SQL yaz?n.
23 setir
*/
select
    loc.city, 
    cou.country_name
from locations loc 
    left join countries cou
    on loc.country_id = cou.country_id;


-- Task 6
/*
Countries cedvelinde country_name qarsisinda aid oldugu regionun adini cixarin.
25 setir
*/
select
    cou.country_name,
    reg.region_name
from countries cou 
    left join regions reg
    on cou.region_id = reg.region_id;


-- Task 7
/*
Departments ve locations cedvellerini istifade etmekle Roma,Venice,Tokyo,Hiroshima seherlerinde
yerlesmeyen departmet_name ve street_address melumatini cixaran sql yazin
27 setir
*/
select
    dep.department_name,
    loc.street_address
from departments dep 
    left join locations loc
    on dep.location_id = loc.location_id
where loc.city not in ('Roma','Venice','Tokyo','Hiroshima');


-- Task 8
/*
Employees, Locations v? Departments c?dv?ll?rind?n istifad? etm?kl? 15000-den yuxari maas alan
h?r bir i?çinin ad?n?, soyad?n? , çal??d??? departamentin ad?n? ve yerlesdiyi seherin adini ç?xaran sql
sor?usu t?rtib edin.
3 setir
*/
select
    emp.first_name, 
    emp.last_name,
    dep.department_name, 
    loc.city
from employees emp 
    left join departments dep
    on emp.department_id = dep.department_id
    
    left join locations loc
    on dep.location_id = loc.location_id
where salary > 15000;


-- Task 9
/*
Employees, Departments v? Locations c?dv?ll?rind?n istifad? etm?kl? department_id-si 30-150
araliginda olan ve ya manager_id-si bos olan h?r bir i?çinin ad?n?, soyad?n? v? çal??d??? ?öb?nin
yerl??diyi ??h?rin ve kucenin ad?n? ç?xaran sql sor?usu t?rtib edin.
103 setir
*/
select
    emp.first_name,
    emp.last_name,
    loc.city,
    loc.street_address
from employees emp 
    left join departments dep
    on emp.department_id = dep.department_id
    
    left join locations loc
    on loc.location_id = dep.location_id
where (emp.department_id between '30' and '150') or (emp.manager_id is null);


-- Task 10
/*
H?r bir i?çinin ad?n?, job_id-sin? uygun i?inin ad?n?,
department-in yerl??diyi küç?ni v? ??h?ri ç?xaran sql yaz?n.
107 setir
*/
select 
    emp.first_name,
    jo.job_title,
    loc.city,
    loc.street_address
from employees emp 
    left join jobs jo
    on emp.job_id = jo.job_id
    
    left join departments dep 
    on emp.department_id = dep.department_id
    
    left join locations loc
    on loc.location_id = dep.location_id;


-- Task 11
/*
H?r bir addressin qar??s?nda hansi regiona 
aid oldu?unu v? han?? ??h?rd? oldu?unu ç?xar?n.
23 setir
*/
select
    loc.street_address,
    loc.city,
    reg.region_name
from locations loc 
    left join countries cou
    on cou.country_id = loc.country_id
    
    left join regions reg
    on reg.region_id = cou.region_id;


-- Task 12
/*
Hansi departamentlerd? heç k?s i?l?mirs?, hemin 
departamentlerin yerl??diyi ??h?rl?rin v? ölk?l?rin adlarini çixarin.
16 setir
*/
select 
    dep.department_name, 
    loc.city, 
    cou.country_name
from departments dep 
    left join employees emp 
    on dep.department_id = emp.department_id
    
    left join locations loc 
    on dep.location_id = loc.location_id
    
    left join countries cou 
    on  loc.country_id = cou.country_id
where emp.first_name is null;

-- Task 13
/*
??çil?ri iç?risind? 10000-den yuxar? maa? alan
departmentl?rin t?krarlanmayan siyah?s?n? ç?xar?n.
6 setir
*/
select
    unique dep.department_name
from departments dep
    left join employees emp
    on dep.department_id = emp.department_id
where emp.salary > 10000;


-- Task 14
/*
H?r bir i?çinin ad?n?, job_id-sin? uy?un i?inin ad?n?,
department-in yerl??diyi küç?ni, ??h?ri v?
yerl??diyi vregionun adini ç?xaran sql yaz?n.
107 setir
*/
select
    emp.first_name,
    job.job_title,
    loc.street_address,
    loc.city,
    reg.region_name
from employees emp 
    left join jobs job
    on emp.job_id = job.job_id
    
    left join departments dep
    on dep.department_id = emp.department_id
    
    left join locations loc
    on loc.location_id = dep.location_id
    
    left join countries cou
    on cou.country_id = loc.country_id
    
    left join regions reg
    on reg.region_id = cou.region_id;
    

-- Task 15
/*
Jobs c?dv?lin? ?sas? min_salary max_salary ortalamas?
?n böyük olan 5 v?zif?nin aid oldu?u
departmentl?rin t?krarlanmayan siyah?s?n? ç?xar?n.
5 setir
*/
select distinct department_name 
    from (
        Select
            department_name 
        from employees emp
            left join departments dep
            on emp.department_id = dep.department_id
            left join jobs jo
            on emp.job_id = jo.job_id
order by (jo.max_salary+jo.min_salary)/2 desc 
fetch first 5 rows only) a


-- Task 16
/*
Location_id-si 1700 olmayan departamentl?rin yerl??diyi
regionlar? v? department_name-l?ri ç?xaran sql yaz?n.
6 setir
*/
select 
    reg.region_name,
    dep.department_name
from regions reg
    left join countries cou
    on reg.region_id = cou.region_id
    left join locations loc
    on loc.country_id = cou.country_id
    left join departments dep
    on dep.location_id = loc.location_id
where loc.location_id != 1700 and dep.department_name is not null;


-- Task 17
/*
??? al?nma tar?x? 01.01.2006-c? ild?n yuxar? olan h?r bir i?çinin ad?n?, job_id-sin? uygun i?inin ad?n?,
department-in yerl??diyi küç?ni, ??h?ri v? yerl??diyi regionun adini ç?xaran sql yaz?n.
53 setir
*/
select
    emp.first_name,
    job.job_title,
    loc.street_address,
    loc.city,
    region_name
from employees emp 
    left join jobs job
    on emp.job_id = job.job_id
    left join departments dep
    on dep.department_id = emp.department_id
    left join locations loc
    on dep.location_id = loc.location_id
    left join countries cou
    on cou.country_id = loc.country_id
    left join regions reg
    on reg.region_id = cou.region_id
where to_char(hire_date, 'yyyy') > '2005';

-- Task 18
/*
Her bir ishchinin adini ve qarshisinda job_id-sine
uygun ishinin adini (jobs.job_title) chixarin. (employees, jobs)
107 setir
*/
select
    emp.first_name,
    job.job_title
from employees emp
    left join jobs job
    on emp.job_id = job.job_id;


-- Task 19
/*
Her bir addressin qarshisinda hansi regiona aid oldugunu chixarin.
(locations, countries, regions)
23 setir
*/
select
    loc.street_address,
    reg.region_name
from locations loc
    left join countries cou
    on cou.country_id = loc.country_id
    left join regions reg
    on reg.region_id = cou.region_id;


-- Task 20
/*
Hansi departamentlerde hech kes ishlemirse,
hemin departamentlerin adlarini chixarin.
16 setir
*/
select 
    dep.department_name
from departments dep 
    left join employees emp 
    on dep.department_id = emp.department_id
where emp.first_name is null;

