-- Task 11
/*
Employees c?dv?lind?n h?r departamentd? neç? f?rqli menecer oldu?unu göst?r?n SQL yaz?n.
N?tic?d? iki sütun olacaq: department id, count of unique managers
*/
select
    department_id,
    count(unique manager_id)
from employees
group by department_id
order by department_id;


-- Task 12
/*
Employees c?dv?lind?n h?r bir job_nin qar??s?nda h?min JOB_?D-y? malik olan ?m?kd?lar?n adlar?n?
siyah? ??klind? ç?xaran SQL yaz?n.
N?tic?d? iki sütun olacaq: job_id, list_of_employees_in_this_job
*/
select
    job_id,
    listagg(first_name, ', ')
from employees
group by job_id
order by job_id;


-- Task 13
/*
Employees c?dv?lind?n , ?m?kda?lar?n?n soyadlar?ndak? (last_name) simvol saylar?na gör?
grupla?d?rma edib, hans? uzunluqlu soyadl? neç? n?f?r oldu?unu ç?xaran SQL yaz?n.
N?tic?d? iki sütun olacaq: length_of_last_name, count_of
*/
select
    length(last_name) as "Soyadlarin uzunlugu",
    count(last_name) as "Uzunluga uygun adlarin sayi"
from employees
group by length(last_name)
order by 1;


-- Task 14
/*
Employees c?dv?lind? i?çil?rin sayini,
ümümi maa? m?bl?gini, orta maa? m?bl??ini çixarin.
*/
select
    count(employee_id) as "Iscilerin sayi",
    sum(salary) "Umumi maas cemi",
    round(avg(salary)) as "Orta maas"
from employees;


-- Task 15
/*
Employees c?dv?lind? komisiyasi olan i?çil?rin sayini cixarin.
*/
select
    count(employee_id) as "Iscilerin sayi"
from employees
where commission_pct is not null;


-- Task 16
/*
Employees c?dv?lind?n ferqli komisiyalarin sayini cixarin.
*/
select
    count(unique commission_pct) as "Ferqli komissiyalarin sayi"
from employees;


-- Task 17
/*
Employees c?dv?lind?n department_id-ler v?
qarsisina onlarin orta salary-sini cixarin
*/
select
    department_id as "Department ID",
    round(avg(salary)) as "Orta maas"
from employees
group by department_id
order by department_id;


-- Task 18
/*
Employees c?dv?lind?n 20,40,60,80 department_id-li i?çil?r üzr?
department_id-l?r v? qarsisina onlarin orta salary-sini cixarin
*/
select
    department_id as "Department ID",
    round(avg(salary)) as "Orta maas"
from employees
where department_id in (20, 40, 60, 80)
group by department_id
order by department_id;


-- Task 19
/*
Employees v? departments c?dv?lind?n department_id-ler,
department_name-ler v? qarsisina
onlarin orta salary, maksimal v? minimal salarisini cixarin
*/
select
    emp.department_id as "Department ID",
    dep.department_name as "Department adi",
    round(avg(emp.salary)) as "Orta maas",
    max(emp.salary) as "Maksimal maas",
    min(emp.salary) as "Minimal maas"
from employees emp
    left join departments dep
    on emp.department_id = dep.department_id
group by emp.department_id, dep.department_name
order by emp.department_id, dep.department_name;


-- Task 20
/*
H?r department üzr? ?n ilk hire_date tarixi il?,
son hire_date tarixl?ri ç?xaran SQL yaz?n.
*/
select
    department_id as "Department ID",
    min(hire_date) as "Ilk hire date",
    max(hire_date) as "Son hire date"
from employees
group by department_id
order by department_id;


-- Task 21
/*
Employees c?dv?lind?n her il nece nefer i?çi ise qebul
olundugunu cixaran sql yazin.(2 sutun ise qebul ili, say)
*/
select
    to_char(hire_date, 'yyyy') as "Il",
    count(employee_id) as "Qebul olunan isci sayi"
from employees
group by to_char(hire_date, 'yyyy')
order by 1;


-- Task 22
/*
Employees c?dv?lind?n her department uzre her il nece nefer i?çi ise qebul
olundugunu cixaran sql yazin.(3 sutun department_id, ise qebul ili, say)
*/
select
    department_id as "Department ID",
    to_char(hire_date, 'yyyy') "Ise goturme ili",
    count(employee_id) as "Ise goturulen isci sayi"
from employees
group by department_id, to_char(hire_date, 'yyyy')
order by 1, 2;


-- Task 23
/*
Employees v? departments c?dv?lind?n department_id-ler, department_name-ler v? qarsisina
onlarin orta salary, maksimal, minimal salarisini, i?çil?rinin adlarinin listini (‘,’-le ayirmaqla)
*/
select
    emp.department_id as "Department ID",
    dep.department_name as "Department Name",
    round(avg(emp.salary)) as "Orta maas",
    max(emp.salary) as "En yuxari maas",
    min(emp.salary) as "En asagi maas",
    listagg(emp.first_name, ', ') as "Iscilerin adlari"
from employees emp
    left join departments dep
    on emp.department_id = dep.department_id
group by emp.department_id, dep.department_name;


-- Task 24
/*
Departments c?dv?lind?n h?r location_id uzr?
nec? department oldugunu ç?xaran sql yaz?n
*/
select
    unique location_id as "Location id",
    count(department_id) as "Department sayi"
from departments
group by location_id;


-- Task 25
/*
Locations c?dv?lind?n h?r country_id üzr?
yerl???n ??h?r say?n? ç?xaran sql yaz?n.
*/
select
    unique location_id as "Location ID",
    count(city) as "Seher sayi"
from locations
group by location_id;


-- Task 26
/*
Employees c?dv?lind?n cut aylarda ise qebul olan
i?çil?rin sayini onlarin ümumi maa? m?bl?gini ve
orta maa? m?bl??ini çixarin.
*/
select
    count(employee_id) as "Ise qebul olan iscilerin sayi",
    sum(salary) as "Toplam maas",
    round(avg(salary)) as "Ortalama maas"
from employees
where mod(to_char(hire_date, 'mm'), 2) = 0;


-- Task 27
/*
Employees c?dv?lind? umumi maas cemini komisiya nezere almaqla cixarin.
*/
-- Formulani salary * commission_pct olaraq bilirem deye bele hesabladim
-- deyesen formula duzdur
-- formulani unutmusam sorry )))
select
    sum(salary*commission_pct)
from employees;


-- Task 28
/*
Region_name ve qarsisinde her region uzre yerlesen
departament_name-leri elifba sirasi ile ', ' ayirmaqla cixarin
*/
select
    reg.region_name as "region name",
    listagg(dep.department_name, ', ') within group (order by dep.department_name) as "Department names"
from regions reg
    left join countries cou
    on cou.region_id = reg.region_id
    left join locations loc
    on cou.country_id = loc.country_id
    left join departments dep
    on dep.location_id = loc.location_id
group by reg.region_name;


-- Task 29
/*
Employees c?dv?lind?n cut employee_id-li
i?çil?r üzr? department_id-l?r v? qarsisina
onlarin orta salary-sini cixarin
*/
select
    department_id as "Department ID",
    round(avg(salary)) as "Orta maas"
from employees
where mod(employee_id, 2) = 0
group by department_id
order by department_id;


-- Task 30
/*
Employees c?dv?lind?n her ay nece nefer i?çi ise qebul
olundugunu cixaran sql yazin.(2 sutun ise qebul ayi, say)
*/
select
    to_char(hire_date, 'mm') as "Aylar",
    count(employee_id)
from employees
group by to_char(hire_date, 'mm')
order by to_char(hire_date, 'mm');


-- Task 31
/*
Employees c?dv?lind?n her department uzre her ay nece nefer i?çi ise qebul olundugunu cixaran sql
yazin.(3 sutun department_id, ise qebul ayi, say)
*/
select
    department_id as "Department_id",
    to_char(hire_date, 'mm') as "Aylar", 
    count(employee_id) as "Isci sayi"
from employees
group by department_id, to_char(hire_date, 'mm')
order by 1, 2;


-- Task 32
/*
Employees c?dv?lind?n managerin adi v? qarsisina hemin menegerin iscileri uzre 
orta salary, maksimal, minimal salarisini ve onun i?çil?rinin ad ve 
soyadlarininlarinin listini (‘,’-le ayirmaqla) cixarin
*/
select
    man.first_name as "Manager adi",
    round(avg(emp.salary)) as "Orta maas",
    max(emp.salary) as "En yuksek maas",
    min(emp.salary) as "En az maas",
    listagg(emp.first_name || ' ' || emp.last_name, ', ') within group (order by emp.first_name) as "Iscilerin adlari"
from employees emp
    inner join employees man
    on emp.manager_id = man.employee_id
group by man.first_name
order by 1, 2;


-- Task 33
/*
Her region_name -in ishci sayini , orta, minimum, maximum salary cixarin
*/
select
    reg.region_name as "Region name",
    count(emp.employee_id) as "Isci sayi",
    round(avg(emp.salary)) as "Orta maas meblegi",
    min(emp.salary) as "Min maas",
    max(emp.salary) as "Max maas"
from regions reg
    left join countries cou
    on cou.region_id = reg.region_id
    left join locations loc
    on cou.country_id = loc.country_id
    left join departments dep
    on dep.location_id = loc.location_id
    left join employees emp
    on dep.department_id = emp.department_id
group by reg.region_name;


********
-- Task 34
/*
Locations c?dv?lind? street_address sutununda h?r s?tird? neç? kiçik h?rf oldu?unu (say?n?)
mü?yy?nl??dirib, h?min saylar üzr? qrupla?d?rma edin, göst?rsin ki, h?r saydan neç? s?trd?
t?krarlan?r. Bunun üçün SQL yaz?n.
*/
********


-- Task 35
/*
EMPLOYEES c?dv?lind?n hans? job_id üzr? i?çi say?
20-d?n kiçik deyils?, h?min JOB_?D v? say? ç?xar?n.
*/
select
    job_id as "Job id",
    count(*) as "Isci sayi"
from employees
group by job_id
having count(*)>=20;