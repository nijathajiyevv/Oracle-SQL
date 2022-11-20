-- Task 11
/*
Countries, locations cedvellerini istifade etmekle
location_id-si 1200,1800 araliginda olan olke
adlarini cixarin (iki hell join, subquery)
*/
-- subquery
select
    unique (select country_name from countries cou
            where loc.country_id = cou.country_id)
from locations loc
where loc.location_id between 1200 and 1800;

-- Join
select
    unique cou.country_name
from countries cou
    left join locations loc
    on loc.country_id = cou.country_id
where loc.location_id between 1200 and 1800;




-- Task 12
/*
Countries, locations,regions cedvellerini istifade
etmekle location_id-si 1200,2000 araliginda olan olke adlarini
ve region adlarini cixarin (iki hell join, subquery)
*/
-- subquery
select
    unique(select reg.region_name from regions reg
            where reg.region_id = cou.region_id) as "Region name",
    cou.country_name as "Country name"
from countries cou
where cou.country_id in (select country_id from locations loc
                    where loc.location_id between 1200 and 2000);


-- join
select
    unique reg.region_name,
    cou.country_name
from regions reg
    left join countries cou
    on reg.region_id = cou.region_id
    left join locations loc
    on loc.country_id = cou.country_id
where loc.location_id between 1200 and 2000;



-- Task 13
/*
Jobs ve employees cedvellerini istifade etmekle
job_title ve qarsisinda hemin job_title uzre
isci sayini cixarin(iki hell join ve subquery)
*/
select
    job.job_title as "Job title",
    (select count(employee_id) from employees emp where job.job_id = emp.job_id)
from jobs job;


-- join
select
    unique job.job_title as "Job title",
    count(emp.employee_id) as "Count employees"
from jobs job
    left join employees emp
    on emp.job_id = job.job_id
group by job.job_title;


-- Task 14
/*
Jobs ve employees cedvellerini istifade etmekle first_name, last_name, salary ve jobs
cedvelindeki min_salary,max_salary esasinda orta maas cixaran sql yazin (iki hell join, subquery)
*/
select
    emp.first_name,
    emp.last_name,
    emp.salary as "Maas",
    (select (job.min_salary + job.max_salary) / 2 from jobs job
        where job.job_id = emp.job_id) as "Orta Maas"
from employees emp;


-- join
select
    emp.first_name,
    emp.last_name,
    emp.salary as "Maas",
    (job.min_salary + job.max_salary) / 2 as "Orta maas"
from employees emp
    left join jobs job
    on emp.job_id = job.job_id;



-- Task 15
/*
Departments , employees cedvelinden istifade ederek iscisi
olmayan department_name siyahisi cixarin.(exists ile)
*/
select
    department_name
from departments d
where not exists (select employee_id from employees e
                    where e.department_id = d.department_id);


-- Task 16
/*
Employees cedvelinde employee_id-si Kevin Feeney -nin
employee_id-sinden boyuk olan iscileri cixarin.
*/
select
    employee_id,
    first_name,
    last_name
from employees
where employee_id > (select employee_id from employees 
                        where first_name = 'Kevin' and last_name = 'Feeney');



-- Task 17  
/*
Employees cedvelinden employee_id-si 146 olan isci ile eyni managere sahib isci
melumatlarini cixarin. (iki hell yolu ile join ve subquery)
*/
select *
from employees e
where e.manager_id in ( select b.manager_id from employees  b
                      where b.employee_id = 146);



-- Task 18
/*
Employees cedvelinden salary-si 10000 olan isciler calisan
departamentlerin butun iscilerinin siyahisini cixarin.
*/
select
    first_name, 
    last_name,
    department_id
from employees
where department_id in (select department_id from employees
        where salary = 10000);



-- Task 19
/*
Departments , employees cedvelinden istifade ederek job_id-si SA_REP olan ve ya salary-si
15000-den boyuk olan iscilerin calisdigi department_name-lerin tekrarlanmayan siyahisini cixarin
*/
select
    unique department_name
from departments d
    left join employees e
    on e.department_id = d.department_id
where e.job_id = 'SA_REP' or salary > 15000;


-- Task 20
/*
Subquery istifade ederek employees cedvelinde iscinin ad, soyad, hire_date,
department_name, country_name melumatini cixarin.
*/
select
    e.first_name,
    e.last_name,
    e.hire_date,
    (select department_name from departments d
        where d.department_id = e.department_id) as "Department name",
    (select country_name from countries c
        left join locations l
        on l.country_id = c.country_id
        left join departments d
        on d.location_id = l.location_id
    where d.department_id = e.department_id) as "Country name"
from employees e;




-- Task 21
/*
Locations cedvelinden her country country_id uzre olan city sayini ve city-leri aralarinda ‘, ‘
olmaqla cixarin, (hemcinin subquery ile select liste country_id esasinda country_name melumatini cixarin)
*/
select
    country_id,
    count(city),
    (select country_name from countries c
        where c.country_id = l.country_id),
    listagg(city, ', ')
from locations l
group by country_id;



-- Task 22
/*
Salary-si 5000-den kicik olan iscilerin oldugu tekrarlanmayan job_title siyahisi cixarin 
*/
select unique
    (select job_title
        from jobs j where j.job_id = e.job_id)
from employees e
where e.salary < 5000;



-- Task 23
/*
Job_history cedvelinde is yeri deyisme melumatlari oldugunu nezere alaraq indiyedek is
yerini deyismis isciler uzre ad, soyad, manager_adi(subquery ile),
department_name(subquery ile) cixarin.
*/
select * from job_history;

select
    e.first_name,
    e.last_name,
    (select man.first_name from employees e2
        inner join employees man
        on e2.manager_id = man.employee_id
        where e2.employee_id = e.employee_id)  as "Manager name",
    (select department_name from departments d
        where e.department_id = d.department_id) as "Department name"
from employees e
    left join job_history j
    on j.employee_id = e.employee_id
where j.employee_id = e.employee_id;



-- Task 24
/*
Employees v? departments c?dv?ll?rind?n istifad? ed?r?k
ad,soyad,department_name(subquery il?) v? ish? girm? ill?rini cixaran sql yaz?n
Ishchileri ishe girme illerine gore seqmentleshdirin(case il?)
*/
select
    e.first_name,
    e.last_name,
    (select department_name from departments d
        where e.department_id = d.department_id) as "Department name",
    extract(year from hire_date) as "Year",
    to_char(hire_date, 'yyyy') as "Year",
    case
        when to_char(hire_date, 'yyyy') < '1990' then '90ci ilden once ise giren'
        when to_char(hire_date, 'yyyy') > '1990' then '90ci ilden sonra ise giren'
        else '90ci ilde ise giren' end as "Seqment"
from employees e;


-- Task 25
/*
Country_id-si 'UK' ya 'CA' olan departmentde ishleyen ,postal_code-u herfle biten, ishcilerin
ad, soyad, departament ad?n? v? country_name m?lumat?n? ç?xar?n. (subquery istifade ederek)
34 setir
*/
select 
    first_name,
    last_name,
    department_name,
    (select country_name from countries co where co.country_id = loc.country_id) as country_name
        from employees e 
        left join departments d 
        ON e.department_id = d.department_id 
        left join locations loc 
        on loc.location_id = d.location_id
where loc.country_id in (select country_id from countries where country_id in( 'UK' , 'CA') )
                    and substr(postal_code,-1,1)  not between '0' and '9';