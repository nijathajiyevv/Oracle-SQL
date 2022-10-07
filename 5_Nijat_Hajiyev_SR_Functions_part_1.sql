-- Task 1
/*
Employees c?dv?lind?n employee_id-si t?k ?d?d olan i?çil?ri ç?xar?n.
*/
select *
from employees
where mod(employee_id, 2) = 1;


-- Task 2
/*
Locations c?dv?lind?n street_address sütununda ikinci rast g?l?n bo?lu?un mövqeyini ç?xar?n.
*/
select street_address,
    instr(street_address, ' ', 1, 2)
from locations;


-- Task 3
/*
Departments c?dv?lind?n h?r departmentin ad?n? v? ad?nda neç? simvol oldu?unu ç?xar?n.
*/
select department_name,
    length(department_name)
from departments;


-- Task 4
/*
Employees c?dv?lind?n ad v? soyad?nda birlikd? olan 
simvol say? 12-d?n çox olan i?çil?ri ç?xar?n.
*/
-- #1 version
select *
from employees
where length(first_name) + length(last_name) > 12;
-- #2 version
select *
from employees
where length(concat(last_name, first_name)) > 12;


-- Task 5
/*
Employees c?dv?lind?n salary-l?ri 27-? bölüb, yuvarlaqla?d?rma üsulu il?,
k?srd? maximum 2 r?q?m olmaqla ç?xar?n.
*/
select round(salary / 27, 2)
from employees;


-- Task 6
/*
Countries c?dv?lind? f?rqli region_id-l?ri ç?xar?n.
*/
select unique region_id
from countries;


-- Task 7
/*
Employees c?dv?lind?n last_name-l?rd? bütün h?rfl?r kiçik v?
yaln?z son h?rf böyük olmaqla ç?xar?n.
*/
select last_name,
    reverse(initcap(reverse(last_name)))
from employees;


-- Task 8
/*
Locations c?dv?lind?n street_address sütununda olan sözl?rin
ham?s?n?n son h?rfini böyük olmaqla ç?xar?n.
*/
select street_address, 
    reverse(initcap(reverse(street_address)))
from locations;


-- Task 9
/*
Locations c?dv?lind?n street_address sütununda olan sözl?rin
ham?s?nda 'a' h?rfl?rini '+' i?ar?si il? ?v?z edib ç?xar?n.
*/
select street_address,
    replace(street_address, 'a', '+')
from locations;


-- Task 10
/*
Locations c?dv?lind?n street_address sütununda olan cüml?nin
sonundak? h?rfi '!' i?ar?si il? ?v?z edib ç?xar?n.
*/
select street_address,
    concat(substr(street_address, 0, length(street_address)-1), '!')
from locations;


-- Task 11
/*
Departments c?dv?lind?n department_name-l?rind? çüt sayda simvol olanlar? a?a??dak? kimi
d?yi?ib ç?xar?n. M?s?l?n: ‘oracle’ >> ‘raoecl’ (k?nardak? h?rfl?r m?rk?z? g?lsin)
*/
select department_name,
    substr(department_name, 2, length(department_name)/2-1) || 
    lower(substr(department_name, 1,1)) ||
    substr(department_name, -1) || 
    substr(department_name, length(department_name)/2, (length(department_name)/2-1))
from departments
where mod(length(department_name), 2) = 0;


-- Task 12
/*
Employees c?dv?lind?n h?r i?çinin qar??s?nda onun 
i?? girdiyi tarix il? h?min ay?n son tarixinin
f?rqini ç?xar?n.
*/
select first_name,
    last_name,
    hire_date,
    last_day(hire_date),
    last_day(hire_date) - hire_date
from employees;


-- Task 13
/*
Departments c?dv?lind?n h?r department_name-in
qar??s?na h?min s?trd?ki department_id-nin 
qiym?ti q?d?r '$' i?ar?si ç?xar?n.
*/

select department_id,
    department_name,
    rpad(department_name, length(department_name)+length(department_id), '$')
from departments;

-- her iki versiya
select department_id,
    department_name,
    rpad(department_name, department_id, '$')
from departments;

-- Task 14
/*
Locations c?dv?lind?n City sütununda olan sözl?rd? bütün 
'a', 'b','o' v? 't' h?rfl?rini l??v etm?kl? ç?xar?n.
*/
select city, translate(city, ' abot', ' ')
from locations;

-- Task 15
/*
Employees c?dv?lind? last_name v? ya first_name- sütunlar?n?n heç olmasa birind? ?n az? iki
d?n? 'a' h?rfi olan s?tirl?ri ç?xar?n. (2 üsulla: 1) OR istifad? etm?kl?, 2) OR-suz)
*/
select *
from employees
where last_name like '%a%a%' or first_name like '%a%a%';


-- Task 16
/*
Employees c?dv?lind? job_id sütununda "_" simvolundan sonra 
"c" h?rfi g?l?n s?tirl?ri
ç?xaran SQL yaz?n(2 usulla)
*/
select job_id
from employees
where job_id like '%/_C%' escape '/';



-- Task 17
/*
Employees c?dv?lind? phone_number_sutununda
'.' simvolunun sayi '2'simvolundan çox
yaxud b?rab?r olan s?tirl?rin phone_number-ni ç?xar?n.
*/
select phone_number
from employees
where length(phone_number)-length(replace(phone_number, '.', '')) >= 
    length(phone_number)-length(replace(phone_number, '2', ''));



-- Task 18
/*
Employees c?dv?lind?n soyad?ndak? h?rfl?rin say? 
7-d?n art?q olmayan i?çil?rin siyah?s?n? göst?rin.
*/
select *
from employees
where length(last_name) <= 7;


-- Task 19
/*
Employees c?dv?lind?n adlar?n?n son 3 h?rfind?n al?nan hiss?ciyi ç?xar?n
*/
select substr(first_name, -3)
from employees;


-- Task 20
/*
Locations c?dv?lind? address sütununda 3-cü simvoldan ba?layaraq rast 
g?lin?n 2-ci ‘a’ h?rfinin yerini (position) göst?r?n sql yaz?n
*/
select street_address, instr(street_address, 'a', 3, 2)
from locations;