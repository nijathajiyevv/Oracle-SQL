-- Task 21
/*
Hansi address-lerde eger 4 reqem varsa,
hemin address (locations.street_address) ve o
address-de ishleyen ishcilerin adlarini chixarin.
70 setir
*/
select
    loc.street_address,
    emp.first_name
from locations loc
    left join departments dep
    on dep.location_id = loc.location_id
    
    left join employees emp
    on emp.department_id = dep.department_id

where length(loc.street_address) - length(translate(loc.street_address, ' 1234567890', ' ')) = 4
    and emp.first_name is not null;



-- Task 22
/*
Employees, Departments v? Locations c?dv?ll?rind?n istifad? etm?kl? h?r bir i?�inin
ad?n?, soyad?n? v? �al??d??? ?�b?nin yerl??diyi ??h?rin ad?n? �?xaran sql sor?usu t?rtib edin.
107 setir
*/
select
    emp.first_name,
    emp.last_name,
    loc.city
from employees emp
    left join departments dep
    on emp.department_id = dep.department_id
    left join locations loc
    on dep.location_id = loc.location_id;


-- Task 23
/*
`O` h?rfi il? ba?layan ??h?rl?rd? yerl???n department_name-l?ri �?xaran SQL yaz?n.
1 setir
*/
select dep.department_name
from departments dep
    left join locations loc
    on dep.location_id = loc.location_id
where loc.city like 'O%';


-- Task 24
/*
H?r ??h?rin (city) qar??s?na yerl??diyi �lk?nin ad?n? (country_name) �?xaran SQL yaz?n.
23 setir
*/
select
    loc.city,
    cou.country_name
from locations loc
    left join countries cou
    on loc.country_id = cou.country_id;


-- Task 25
/*
H?r i?�inin ad?n?n qar??s?nda tabe olduqlar? menecerin
ad?n? �?xaran sql sor?usu t?rtib edin.
106 setir
*/
select 
    emp.first_name as "Employee name",
    man.first_name as "Manager name"
from employees emp inner join employees man
                    on emp.manager_id = man.employee_id;


-- Task 26
/*
H?r i?�inin ad?n?n qar??s?nda tabe oldu?u menecerin ad?n? �?xaran sql sor?usu t?rtib
edin. N?tic?d? yaln?z i?�inin ad?n?n (first_name) birinci h?rfi menecerinin ad?n?n
(first_name) son h?rfin? b?rab?r olan s?tirl?r �?xs?n.
5 setir
*/
select 
    emp.first_name as "Employee name",
    man.first_name as "Manager name"
from employees emp inner join employees man
                    on emp.manager_id = man.employee_id
where lower(substr(emp.first_name, 1,1)) = lower(substr(man.first_name, -1, 1));


-- Task 27
/*
Hans? i?�il?r �z menecerl?rind?n ?vv?l i?? daxil olublarsa,
onlar? �?xaran sql sor?usu t?rtib edin.
37 setir
*/

select
    emp.first_name
from employees emp inner join employees man
                    on emp.manager_id = man.employee_id
where emp.hire_date < man.hire_date;


-- Task 28
/*
Susan adl? (first_name) i?�i il? eyni tarixd?
i?? q?bul olunan i?�il?ri �?xaran SQL yaz?n
4 setir
*/
select
    emp.first_name,
    emp.hire_date,
    man.first_name
from employees emp 
    left join employees man
    on emp.hire_date = man.hire_date
where emp.first_name = 'Susan';


-- Task 29
/*
Eyni ?�b?d? �al??an i?�il?rd?n eyni ilin eyni ay?nda i?? q?bul olunanlar?n adlar?n? c�t �
c�t qar??la?d?ran (b�t�n m�mk�n hallar?) sql sor?usunu t?rtib edin
70 setir
*/
select
    emp1.first_name || ' ' || emp1.last_name,
    emp2.first_name || ' ' || emp2.last_name
from employees emp1
    cross join employees emp2
where emp1.employee_id <> emp2.employee_id 
    and to_char(emp1.hire_date, 'mm.yyyy') = to_char(emp2.hire_date, 'mm.yyyy')
    and emp1.department_id = emp2.department_id;


-- Task 30
/*
?g?r m�?ssis? daxilind? ?�b?l?r �zr? ?ahmat turniri ke�iril?rs? (oyunlar ancaq
m�xt?lif ?�b?l?rin i?�il?ri aras?nda olacaq v? h?r ?�b?nin h?r bir ?m?kda?? dig?r b�t�n
?�b?l?rin b�t�n ?m?kda?lar? il? oynayacaq), ke�iril?c?k h?r bir oyunun h?r iki
oyun�usunun adlar?n? qar??-qar??ya �?xaran sql sor?usu t?rtib edin.
3969 setir
*/
select 
    emp1.first_name,
    emp2.first_name
from employees emp1
    cross join employees emp2
where emp1.employee_id < emp2.employee_id and emp1.department_id <> emp2.department_id;


-- Task 31
/*
Employees cedvelinden 2002 , 2005 illerde ise qebul olan iscilerin ad, soyad,ise qebul tarixi,
departamentin adi, menegerinin adi, islediyi seherin adini cixaran sql yazin
36 setir
*/

select
    emp1.first_name as "Employee name",
    emp1.last_name as "Employee last name",
    emp1.hire_date as "Employee hire date",
    dep.department_name "Department name",
    man.first_name as "Manager name",
    loc.city as "City"
from employees emp1
    left join employees man
    on emp1.manager_id = man.employee_id
    left join departments dep
    on emp1.department_id = dep.department_id
    left join locations loc
    on dep.location_id = loc.location_id
where to_char(emp1.hire_date, 'yyyy') = 2002 or to_char(emp1.hire_date, 'yyyy') = 2005;


-- Task 32
/*
Employees cedvelinde 1 yanvar 2008 tarixinden
sonra isci qebul eden departamentlerin
siyahisini cixarin.
2 setir
*/

select
    dep.department_name
from departments dep
    left join employees emp
    on dep.department_id = emp.department_id
where hire_date > to_date('01.01.2008', 'dd.mm.yyyy'); 


-- Task 33
/*
Employees cedvelinden May ayinda ise qebul olan
iscilerin adlari , menecer adlari ve department
adini cixaran sql yazin.
5 setir
*/
select
    emp.first_name,
    man.first_name,
    dep.department_name
from employees emp
    left join employees man
    on emp.manager_id = man.employee_id
    left join departments dep
    on emp.department_id = dep.department_id
where to_char(emp.hire_date, 'mm') = '05' and dep.department_name is not null;


-- Task 34
/*
Employees cedvelinden is staji menecerinin stajindan
boyuk olan iscilerin siyahisini cixarin.
37 setir
*/
-- KOHNE DB
select
    emp.first_name as "Employee Name",
    man.first_name as "Manager Name",
    round(sysdate - emp.hire_date) as "Employee experience",
    round(sysdate - man.hire_date)as "Manager experience"
from employees emp
    left join employees man
    on emp.manager_id = man.employee_id
where sysdate - emp.hire_date > sysdate - man.hire_date;


-- Task 35
/*
Employees ve Departments c?dv?ll?rini istifad? etm?kl? h?r bir i?�inin qar??s?na �z deprtamentini
�?xaran SQL yaz?n.
107 setir
*/
select
    emp.first_name as "Employee name",
    emp.last_name as "Employee last name",
    dep.department_name as "Department name"
from employees emp
    left join departments dep
    on emp.department_id = dep.department_id;


-- Task 36
/*
Employees istifad? etm?kl? h?r bir i?�inin qar??s?na �z menecerini �?xaran SQL yaz?n.
Hans? i?�inin menecerini t?yin etm?k m�mk�n deyils?, qar??s?nda 'Teyin edilmeyib' s�z� �?xs?n.
107 setir
*/
select 
    emp.first_name as "Employee name",
    case
        when man.first_name is null then 'TEYIN EDILMEYIB'
        else man.first_name
    end as "Manager name"
from employees emp
    left join employees man
    on emp.manager_id = man.employee_id;


-- Task 37
/*
H?r bir departamementin qar??s?na h?min departamentin menecerinin ad?n? �?xaran SQl yaz?n.
27 setir
*/
select
    emp.first_name as "Manager name",
    dep.department_name as "Department name"
from departments dep
    left join employees emp
    on dep.manager_id = emp.employee_id;


-- Task 38
/*
H?r bir departamentin qar??s?na aid oldu?u ??h?rin ad?n? �?xaran SQl yaz?n.
27 setir
*/
select
    dep.department_name,
    loc.city
from departments dep
    left join locations loc
    on dep.location_id = loc.location_id;


-- Task 39
/*
H?r bir departamentin qar??s?na �z�nd?n ki�ik ?D-li departamentin adlar?n? �?xaran SQL yaz?n.
351 setir
*/
select
    dep1.department_name,
    dep1.department_id,
    dep2.department_name,
    dep2.department_id
from departments dep1
    cross join departments dep2
where dep1.department_id > dep2.department_id;


-- Task 40
/*
H?r bir i?�inin ad?n?n qar??s?na �z departamemntind? olan i?�inin ad? �?xs?n. B�t�n hallar.
3298 setir
*/
select
    emp1.first_name,
    emp2.first_name
from employees emp1
    cross join employees emp2
where emp1.department_id = emp2.department_id;


-- Task 41
/*
COUNTRY_ID-si US olan �lk?l?rd? i?l?y?nl?rin ad, soyad, departament v? �lk? adlar?n? �?xar?n.
68 setir
*/
select
    emp.first_name,
    emp.last_name,
    dep.department_name,
    cou.country_name
from employees emp
    left join departments dep
    on emp.department_id = dep.department_id
    left join locations loc
    on dep.location_id = loc.location_id
    left join countries cou
    on loc.country_id = cou.country_id
where cou.country_id = 'US';


-- Task 42
/*
2000, 2001, 2002 v? 2003-c� ill?rd? i?? gir?n v? department_id-si 30, 80, 100 qiym?tl?rind?n biri olan
i?�il?rin ad, soyad, depatrment_id v? i?? girm? tarixl?rini �?xar?n. Tarix format? n�mun?d?ki kimi
�?xs?n.
N�mun?: 27.06.2002 12:00:00 AM
4 setir
*/




-- Task 43
/*
EMPLOYEES c?dv?lind?n JOB_?D-si ST il? ba?layan i?�il?rin ad, soyad
v? pe??sinin tam ad?n? (job_title) �?xar?n.
EMPLOYEES, JOBS c?dv?ll?rini istifad? edin.
25 setir
*/
select
    emp.first_name,
    emp.last_name,
    job.job_title
from employees emp
    left join jobs job
    on emp.job_id = job.job_id
where emp.job_id like 'ST%';




-- Task 44
/*
LOCATION_ID-si 1400 olan i?cil?rin ad, soyad ,
departament ad?n? v? country_name m?lumat?n? �?xar?n.
5 setir
*/
select
    emp.first_name,
    emp.last_name,
    dep.department_name,
    cou.country_name
from employees emp
    left join departments dep
    on emp.department_id = dep.department_id
    left join locations loc
    on dep.location_id = loc.location_id
    left join countries cou
    on loc.country_id = cou.country_id
where loc.location_id = 1400; 
