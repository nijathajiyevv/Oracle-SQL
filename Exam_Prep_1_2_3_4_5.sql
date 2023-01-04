-- Task 1-1
/*
Cüt sayda günü olan aylarda i?? gir?n i?çil?rin
f?rqli menecer id-l?rini tapan sql sor?usu yaz?n.
*/
select distinct manager_id 
from employees 
where mod(to_char(hire_date,'mm'),2)=0;


-- Task 1-2
/*
H?r bir departmentd? öz departmentinin orta maa??ndan
çox maa? al?b h?m d? öz job_id-sinin orta maa??ndan çox maa?  
alan i?çil?ri göst?r?mn sq? yaz?n.  28 s?tir
*/
select *
from employees e
where salary > (select avg(salary) from employees e1 where e.department_id = e1.department_id)
                and salary> (select avg(salary) from employees e2 where e.job_id = e2.job_id); 


-- Task 1-3
/*
Maa?? employee_id -sinin kvadrat?ndan
böyük olan i?çil?ri tapan sql sor?usu yaz?n.
*/
select *
from employees
where salary > employee_id * employee_id;

select *
from employees 
where salary> power(employee_id,2);


-- Task 1-4
/*
4.H?r bir i?çinin ad?n?, soyad?n?, i?? girdiyi tarixi, i?? girdiyi ili, i?? girdiyi 
ay? ( bütöv ad), i?? girdiyi  günü ( ay?n günü) , i?? girdiyi h?ft? gününü tapan sql yaz?n
--107 setir, 7 sutun
*/
select
    first_name,
    last_name,
    hire_date,
    to_char(hire_date, 'yyyy') as il,
    to_char(hire_date, 'month') as ay,
    to_char(hire_date, 'dd') as gun,
    to_char(hire_date, 'day') as hefte_gunu
from employees;


-- Task 1-5
/*
2022-ci ildeki butun shenbe gunlerine
dushen tarixleri getiren sorgu yaz?n.
*/
select
    to_date('31.12.2021','dd.mm.yyyy')+level 
from dual
where to_char(to_date('31.12.2021','dd.mm.yyyy')+level,'d')='6'
    connect by level <=365;


-- Task 2-1
/*
Employees c?dv?lind?n istifad? ed?r?k, i?çil?rin ad?n?, soyad?n?
v? ad v? soyad?nda ortaq h?rfl?rin olub-olmad???n? t?yin ed?n ortaq_h?rf sütununu yarad?n.
Bu sütun 2 qiym?t alacaq: 
1) ortaq h?rf var 2) ortaq h?rf yoxdur  --107 s?tir
*/
select
    first_name,
    last_name, 
    case 
    when length(replace(translate(lower(first_name),lower(last_name),' '),' ','')) <> length(first_name)
    then 'ortaq herf var' else 'ortaq herf yoxdur' end as ortaq_herf
from employees;


-- Task 2-2
/*
Departments c?dv?lind?n istifad?
ed?r?k selectiona aid nümun? yaz?n.
*/
select *
from departments
where manager_id < 150;


-- Task 2-3
/*
Employees c?dv?lind?n h?r bir i?çinin maa??n?n öz
departamentinin orta maa??na olan nisb?tini tap?n.
*/
select
    first_name,
    last_name,
    round(salary/ avg(salary) over ( partition by department_id),2)
from employees;


-- Task 2-4
/*
Employees c?dv?lind?n 3-cü ?n yüks?k maa?? tap?n.
*/
select 
    salary from (   select
                        salary,
                        dense_rank() over(order by salary desc) as rn
                    from employees ) e 
where e.rn=3;


-- Task 2-5
/*
Ad? 1 sözd?n ibar?t olan department
adlar?n? g?tir?n sql sor?usu yaz?n.
*/
select department_name 
from departments 
where instr(department_name,' ',1,1)=0;






-- Task 3-1
/*
Employees c?dv?lind?n istifad? ed?r?k i?? girm?
tarixl?ri aras?ndak? maksimum gün f?rqini tap?n.
*/
select max(hire_date-prev_Date) 
from (select hire_date,lag(hire_Date,1) over(order by hire_date asc) prev_date
from employees);

-- Task 3-2
/*
40-ci departmentdeki ilk i?? gir?nl? son
i?? gir?n aras?nda ba?qa departmentl?r? 
i?? gir?n i?çil?rin say?n? tap?n.
*/
select count(*)
from employees 
where hire_date> (select min(hire_date) from employees where department_id =50)
and hire_Date <  (select max(hire_date) from employees
where department_id =50) and department_id <>50;

-- Task 3-3
/*
1700 id-li location-in yerl??diyi ölk?nin ad?n? tap?n.
*/
select country_name
from countries c
    left join locations l
    on c.country_id = l.country_id
where l.location_id = 1700;


-- Task 3-4
/*
Dual c?dv?lind?n istifad? ed?r?k 1-d?n 20-y?
kimi cüt ?d?dl?ri g?tir?n sql sor?usu yaz?n.
*/
select level 
from dual
where mod(level,2)=0
connect by level<=20;




-- Task 3-5
/*
Locations c?dv?lind?n istifad? ed?r?k, postal code-u ancaq 
r?q?ml?rd?n ibar?t olan street_address-l?ri tap?n.
*/
select *
from locations
where translate(postal_code, '.1234567890', '.') is null;




-- Task 4-1
/*
Locations c?dv?lind?n location_id v? street_Addressi eyni
simvolla ba?layan street_address-l?ri tap?n.
*/
select *
from locations
where substr(location_id, 1,1) = substr(street_address, 1,1);




-- Task 4-2
/*
50-ci departmentd? i?l?y?n i?çil?rin maksimum
maa?? il? minimum maa??n?n f?rqini tap?n.
*/
select max(salary) - min(salary)
from employees
where department_id = 50;




-- Task 4-3
/*
Countries c?dv?linin strukturunu göst?r?n sql sor?usu yaz?n.
*/
desc countries;
describe countries;



-- Task 4-4
/*
Employees, departments v? job_history c?dv?ll?rind?n istifad?
ed?r?k hans? department-d?ki 
i?çil?rin v?zif? d?yi?ikliyi etdiyini tap?n.
N?tic?d? department name-l?r ç?xs?n.
*/
select department_name
from departments d
where department_id in (select department_id from job_history);



-- Task 4-5
/*
Department manager-i ( y?ni ki, bu adam hans?sa departamentin meneceridir) 
olan i?çil?rin ad,soyad?n?, v?zif?sinin ad?n? g?tir?n sql sor?usu yaz?n.
*/
select
    e.first_name,
    e.last_name,
    j.job_title
from employees e
    left join jobs j
    on e.job_id = j.job_id
    left join departments d
    on d.department_id = e.department_id
where e.employee_id = d.manager_id
order by e.first_name asc;

-- Task 5-1
/*
H?r bir i?çinin qar??s?nda onun öz v?zif?si v? departamenti üzr? 
maa? reytinqini müqayis?sinin n?tic?si olan job_or_Department sütunu yaz?n.
Sütun 3 qiym?t alacaq : 1) v?zif? üzr? reytinqi yüks?kdir 
                        2) department üzr? reytinqi yüks?kdir 
                        3) reytinq eynidir
*/
select first_name, 
case when job_ranking < dept_ranking then 'v?zif? üzr? reytinqi yüks?kdir' 
     when dept_ranking < job_ranking then 'department üzr? reytinqi yüks?kdir'
     else 'reytinq eynidir' end as job_or_Department from (
select first_name, dense_rank() over(partition by job_id order by salary desc) as job_ranking,
       dense_rank() over(partition by department_id order by salary desc) as dept_ranking
       from employees )e;




-- Task 5-2
/*
Exists operatorundan istifad? ed?r?k i?çisi olmayan
departmentl?rin ad?n? g?tir?n sql sor?usu yaz?n.
*/
select department_name
from departments d
where not exists (select * from employees e where d.department_id = e.department_id);




-- Task 5-3
/*
2022-ci ilin  mart ay?ndak? cüm? günl?rinin
tarixl?rini tapan sql sor?usu yaz?n.
*/
select 
distinct next_day(to_date('01.03.2022','dd.mm.yyyy')+level,'friday') as fridays
from dual
where to_char(next_day(to_date('01.03.2022','dd.mm.yyyy')+level,'???????'),'mm') ='03'
connect by level<= to_char(to_date('31.03.2022','dd.mm.yyyy'),'dd')
order by fridays;



-- Task 5-4
/*
Employee_id v? phone_number sütunlar? eyni r?q?ml? bit?n i?çil?rin 
ad?n?, soyad?n?, departmenti-nin ad?n?, tabe oldu?u
manager-in ad?n?, i?l?diyi departamentin 
menecerinin ad?n? g?tir?n sql sor?usu yaz?n.
*/
select
    e.first_name, 
    e.last_name,
    d.department_name,
    m.first_name as tabe_menecer,
    dm.first_name as dept_menecer
from employees e
    join departments d on e.department_id = d.department_id
    join employees m on e.manager_id =m.employee_id
    join employees dm on d.manager_id = dm.employee_id
where substr(e.employee_id, -1, 1) = substr(e.phone_number, -1, 1);


-- Task 5-5
/*
Countries c?dv?lind?n country_id-si country_name-in ilk 2 h?rfi olan v?  
country_id-si country_name-in ilk 2 h?rfi olmayan ölk?l?rin say?n? tap?n.
N?tic?d? 1 s?tir 2 sütun olacaq.
*/
select count(case when country_id=substr(upper(country_name),1,2) then 1 end) as first_two_same,
       count(case when country_id <>substr(upper(country_name),1,2) then 1 end) as first_two_differen
from countries;

