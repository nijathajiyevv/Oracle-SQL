-- Task 1
/*
Employees c?dv?lind?n first_name, last_name v? first_name il? last_name-in ilk 3 h?rfinin
birlesmesinden al?nan hiss?ciyi ‘username’ aliasi ile ç?xaran sql yazin.
*/
select first_name, last_name,
    substr(first_name, 1, 3) || substr(last_name, 1, 3) as "username"
from employees;


-- Task 2
/*
Employees c?dv?lind? salary-si 10000 ile 25000 araliginda olan first_name, last_name sütunu
birl??m?sini ‘a’,’e’,‘o’,’i’,’u’ h?rfl?rini n?z?r? almamaqla ç?xaran sql yaz?n
*/
select translate(first_name || last_name, ' aeoiu', ' ')
from employees
where salary between 10000 and 25000;


-- Task 3
/*
Employees c?dv?lind? first_name , last_name v? phone_number sütununda olan nömrelerin son
4 r?qemini ‘*’ il? ?v?z ed?r?k ç?xaran sql yaz?n.
*/
select
    first_name,
    last_name,
    phone_number,
    substr(phone_number,1,length(phone_number)-4) ||'****'
from employees;

-- Task 4
/*
Employees c?dv?lind? first_name v? last_name eyni h?rfl? ba?layan s?tirl?ri ç?xaran v? salary
Sutununa gore azalan, employee_id-e gore azalan sira il? s?ralayan sql yaz?n.
*/
select *
from employees
where lower(substr(first_name, 1, 1)) = lower(substr(last_name, 1, 1))
order by salary desc, employee_id desc;


-- Task 5
/*
Employees c?dv?lind? bütün i?çil?rin siyah?s?n? ç?xaran sql yaz?n. Ad, soyad v? bir i? günün? dü??n
?m?k haqq? (1 ayda 23 i? günü oldu?unu q?bul ed?r?k). Bir gün? dü??n ?m?k haqq?n?n k?sr
hiss?sind? ?n çoxu iki r?q?m qalmaqla yuvarlaqla?d?r?ls?n.
*/
select first_name, last_name, round(salary / 23, 2)
from employees;


-- Task 6
/*
Employees c?dv?lind? h?r bir i?çinin maa??n?n vergi faizi (commission_pct) ç?x?ld?qdan sonra
yerd? qalan hiss?sini k?sr hiss? olmamaqla yuvarlaqlasdirib göst?r?n sql t?rtib edin.
*/
select salary, commission_pct, 
    case
        when commission_pct is null then salary
        else round(salary - salary * commission_pct)
    end as "Salary without commission"
from employees
order by salary asc;


-- Task 7
/*
Jobs cedvelinde job_title-si Manager il? bit?n
s?trleri job_title-da Manager sözu olmadan çixaran sql yaz?n.
*/
select replace(job_title, 'Manager', '')
from jobs
where job_title like '%Manager';


-- Task 8
/*
Jobs cdvelind? Job_id sütunda ilk ‘_’-den sonraki simvollari çixaran sql yaz?n
*/
select substr(job_id, instr(job_id, '_', 1)+1)
from jobs;


-- Task 9
/*
Departments c?dvelind? department_name sütununda
‘Sales’ sözunun pozisiyasini ç?xaran sql yaz?n.
*/
select department_name, instr(department_name, 'Sales', 2)
from departments;


-- Task 10
/*
Countries c?dv?lind? country_name sütunda a h?rfl?rini b v? 
b herflerini a il? ?v?z etmekl? çixarin
*/
select country_name, translate(country_name, 'ab', 'ba')
from countries;


-- Task 11
/*
Employees c?dv?lind?n soyad?ndak? h?rfl?rin say? 7-d?n
art?q olmayan i?çil?rin siyah?s?n? göst?rin
*/
select *
from employees
where length(last_name) <=7;


-- Task 12
/*
Employees c?dv?lind?n adlar?n?n son 3 h?rfind?n al?nan hiss?ciyi ç?xar?n.
*/
select first_name, substr(first_name, -3)
from employees;