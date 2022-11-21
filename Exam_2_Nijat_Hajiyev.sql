-- Task 1
/*
Employees v? Departments c?dv?ll?rind?n istifad? ed?r?k
eyni departamentd? v? eyni phone_number ba?l???na
(phone_number s�tununda ilk noqt?y? q?d?r olan hiss? n?z?rd? tutulur,
515.123.4567--->>'515' ) malik i?�il?rin say?n? ve i?l?diyi departamentl?rin ad?n? �?xaran sql yazin.
N?tice department_name s�tununa g�r? artan s?rada d�z�ls�n.
S?tir say?: 13
*/
select  
    d.department_name,
    substr(e.phone_number,1,instr(e.phone_number,'.',1,1)-1) as provider,
    count(*) as say
from hr.employees e
    left join hr.departments  d
    on e.department_id=d.department_id
group by d.department_name,
    substr(e.phone_number,1,instr(e.phone_number,'.',1,1)-1)
order by d.department_name;


-- Task 2
/*
Employees v? job_history c?dv?lind?n istifad? ed?r?k,
h?r  i?�i ���n a?a??dak? m?lumatlar? �?xar?n(SUBQUERY vasit?sil?):
1-ci s�tun: employee_id
2-ci s�tun: i?cinin h?min job_id-li i?? ba?lama tarixi, s�tun ad?: ishe bashlama tarixi
3-c� s�tun: i?cinin h?min job_id-li i?d?n �?xma tarixi, s�tun ad?: ishden chixma tarixi.
?g?r i?�inin job_id-y? g�r? i?? ba?lama tarixi v? i?d?n �?xma tarixi yoxdursa 'melumat tapilmadi' qeyd olunsun.
S?tir say?: 107
*/
select 
    e.employee_id,
    case when 
        (select to_char(start_date,'dd.mm.yyyy') 
            from hr.job_history h 
            where h.employee_id=e.employee_id 
            and h.job_id=e.job_id) is null then 'melumat tapilmadi'
    
    else  
        (select to_char(start_date,'dd.mm.yyyy') 
            from hr.job_history h 
            where h.employee_id=e.employee_id 
            and h.job_id=e.job_id) end as "ishe bashlama tarixi",
    
    case when
        (select to_char(end_date,'dd.mm.yyyy') 
            from hr.job_history h 
            where h.employee_id=e.employee_id 
            and h.job_id=e.job_id) is null then 'melumat tapilmadi'
    
    else  
        (select to_char(end_date,'dd.mm.yyyy')
            from hr.job_history h
            where h.employee_id=e.employee_id 
            and h.job_id=e.job_id) end as "ishden chixma tarixi"
    
from hr.employees e;


-- Task 3
/*
Task 03
Hans? �lk?l?rd? departament say? 1-d?n �oxdursa o �lk?l?rin
ad?n? v? �lk?d? yerl???n departament say?n? �?xaran sql yaz?n.
S?tir say?: 2
*/
select
    country_name,
    count(department_name)
from countries con
    left join locations loc
    on loc.country_id = con.country_id
    left join departments dep
    on dep.location_id = loc.location_id
group by country_name
having count(department_name) > 1;



-- Task 4
/*
Locations c?dv?lind? street_address s�tununda
ilk simvolun r?q?m olub olmamas?na g�r? qrupla?ma edin
N?tic?d? ilk simvolu r?q?m olan s?tirl?rin say?
v? ilk simvolu r?q?m olmayan s?tirl?rin say? g?lsin.
S?tir say?: 2
*/
select
    count(select street_address from locations
            where substr(street_address, 1,1) like '1', '2', '3', '4', '5', '6', '7')
from locations
group by street_address;


-- Task 5
/*
Employees  c?dv?lind? job_id s�tununda 'T_C' birl??m?si olan s?tirl?r
�zr? yoxlama getsin---> ya maa?? 3000-4000 aral???nda olan  ya da
employee_id si 140-dan b�y�k olan i?�il?rin m?lumat? g?lsin.
S?tir say?: 9
*/




-- Task 6
/*
Locations c?dv?lind? 'S' h?rfi il? ba?layan ??h?rl?rd?n
region_id-si 1,2  olan s?tirl?ri �?xaran sql yaz?n (Exists il?)
S?tir say?:6
*/



-- Task 7
/*
Employees c?dv?lind? soyad v? email uzunluqlar? eyni olan s?tirl?r
���n 2 s�tun n?tic?d? �?xar?n. N?tic? i?? girm? tarixin? g�r? b�y�k tarixd?n ki�ik tarix? s?ralans?n.
1-ci s�tun: first_name v? last_name  - 'ad ve soyad' alias? il?
2-ci s�tun: hire_date
S?tir say?: 9
*/
select
    first_name || ' ' || last_name as "Ad ve soyad",
    hire_date
from employees
where length(last_name) = length(email)
order by hire_date desc;



-- Task 8
/*
Region_name v? qar??s?nda h?r region �zr? yerl???n
??h?rl?ri ?lifba s?rasi ile ', '  ay?rmaqla �?xar?n.
S?tir say?: 4
*/
select
    region_name,
    listagg(l.city, ', ') within group (order by l.city)
from regions r
    left join countries c
    on r.region_id = c.region_id
    left join locations l
    on l.country_id = c.country_id
group by region_name;



-- Task 9
/*
Employees, departments, locations v? countries c?dv?lind?n istifad? ed?r?k, ay?n 1-ci yar?s?nda i?? ba?layan  
i?�il?rin ad?n?, soyad?n?, departmentinin ad?n?, departamentin yerl??diyi ??h?ri, �lk?ni tap?n.
S?tir say?: 57
*/

-- MENCE MEN DUZ YAZMISAM, AYIN 16DAN EVELI (ILK YARISI) GOTURMUSEM
select
    e.first_name,
    e.hire_date,
    e.last_name,
    d.department_name,
    l.city,
    c.country_name
from employees e
    left join departments d
    on e.department_id = d.department_id
    left join locations l
    on d.location_id = l.location_id
    left join countries c
    on l.country_id = c.country_id
where to_char(e.hire_date, 'dd') < '16';



-- Task 10
/*
Task 10
Employees c?dv?lind?n a?a??da qeyd olunan h?r bir maa?
kateqoriyas? �zr? i?�il?rin orta maa??n?  g?tir?n sor?u yaz?n.
N?tic?d? 1 s?tir v? 3 s�tun olacaq. 
10000 - d?n az alanlar a?a??
10000 -15000 aras? alanlar orta
15000-d?n yuxar? alanlaer  y�ks?k.
*/
select 
    avg(select salary from employees
                where salary < 10000)
from employees;
                


-- Task 11
/*
Employees v? departments c?dv?lind?n h?r bir department-d?
employee_id-si palindrom olan i?�il?rin say?n? tap?n. 
S�tunlar: Department_name, Count_od_palindrome_id 
Palindrom t?rsin? yaz?l??? eyni ?d?d olan ?d?d? deyilir. (M?s?l?n, 121)
S?tir say?: 5  
*/
select
    e.employee_id,
    d.department_name,
    count(select employee_id from employees e
            where to_char(e.employee_id) = reverse(to_char(e.employee_id))
from departments d
    left join employees e
    on d.department_id = e.department_id;


-- Task 12
/*
Bazar ert?si i?? gir?n i?�il?rin orta maa??n? tap?n. 
S?tir say?: 1
*/

select
    avg(salary)
from employees
where trunc(hire_date, 'iw');



-- Task 13
/*
Locations c?dv?lind?n r?q?ml? ba?lamayan
street_addresl?rin say?n? tap?n.
S?tir say?: 1 
*/



-- Task 14
/*
Task 14
??? girdiyi ay 20 g�nd?n �ox i?l?y?n i?�il?rin ad?n?,
soyad?n?, v?zif?sini g?tir?n sor?u yaz?n. 
S?tir say?: 31
*/
select
    first_name,
    last_name, 
    job_title,
    last_day(hire_date)
from employees e
    left join jobs j
    on e.job_id = j.job_id
where last_day(hire_date) - hire_date > 20;


-- Task 15
/*
Task 15
Menecerin ad?n?, qar??s?nda onun i?�il?rinin ad?n?
verg�ll? ayr?lm?? siyah?sn? g?tir?n sor?u yaz?n.  
S?tir say?: 18 
*/
select
    man.first_name,
    listagg(emp.first_name, ', ')
from employees emp
    inner join employees man
    on emp.manager_id = man.employee_id
group by man.first_name;



-- Task 16
/*
4-d?n �ox i?�isi olan departamentl?rin ad?n?  �?xaran sor?u yaz?n. 
S?tir say?: 5 
*/
select
    department_name,
    count(employee_id)
from departments d
    left join employees e
    on d.department_id = e.department_id
group by department_name
having count(employee_id) > 4;


-- Task 17
/*
H?r bir department_id �zr? i?�il?rin �d?diyi
komissiya m?bl??inin c?mini tap?n. 
S?tir say?: 12 
*/
select
    department_id,
    sum(salary * commission_pct)
from employees
group by department_id;


-- Task 18
/*
Task 18
Employees c?dv?lind?n 2-ci ?n y�ks?k maa??  tap?n. 
S?tir say?: 1 
*/
select
    max(salary)
from employees
where salary < (select
                    max(salary)
                from employees);


-- Task 19
/*
30-cu department-d?ki ham?dan y�ks?k maa?
alan i??il?ri g?tir?n sor?u yaz?n.  
S?tir say?: 10 
*/
select
    salary
from employees
where salary > (select max(salary) from employees where department_id = 30);


-- Task 20
/*
2006-ci ild? 5-d?n �ox i?�i g�t�r?n departmentl?rin g�t�rd�kl?ri
i?�il?rin say?n? (h?r bir department �zr? ayr?l?qda) tap?n.  
S?tir say?: 2 
*/
-- KOHNE DATABASE
-- sadece yazmaga cehd eledim, mence duzdur
select
    department_name,
    count(employee_id)
from employees e
    left join departments d
    on e.department_id = d.department_id
where to_char(hire_date, 'yyyy') = 2006
group by department_name
having count(employee_id) > 5;
