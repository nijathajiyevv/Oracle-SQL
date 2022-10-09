-- Task 21
/*
Employees c?dv?lind? last_name sütununu ‘o’ h?rfl?rini n?z?r? almamaqla ç?xaran sql yaz?n.
*/
select replace(last_name, 'o', '')
from employees;

-- Task 22
/*
Employees c?dv?lind? ad v? soyad? birl??dirdikd?n sonra çat??mayan simvollar ?v?zin? `*`
i?ar?si qoymaqla ümumi uzunlu?u 50-? b?rab?r olan sütun ç?xaran sql yaz?n. (`*` i?ar?l?ri
sa?da v? yaxud solda ola bil?r)
*/
select lpad(concat(first_name, last_name), 50, '*')
from employees;

-- Task 23
/*
Employees c?dv?lind? first_name sütununu ç?xar?n, lakin ç?xan sütunda simvol say?, h?r
s?tird?ki last_name-d? olan simvol say? q?d?r olsun. Çat??mayan simvollar?n ?v?zin? ‘#’
i?ar?sind?n istifad? edin.
*/
select lpad(first_name, length(last_name), '#')
from employees;

-- Task 24
/*
Employees c?dv?lind? bütün s?tirl?ri göst?r?n sql yaz?n. Ad? ?n uzun olan i?çi ?n yuxar?da, ?n
q?sa olan i?çi is? ?n sonda ç?xs?n.
*/
select *
from employees
order by length(first_name) desc;

-- Task 25
/*
Employees c?dv?lind? h?r bir i?çinin maa?? min-min hiss?l?r? bölünm?lidir,
1000-? çatmayan hiss?si is?, sonuncu min manata ?lav? olunmal?d?r, bell?lik?, sonuncu
hiss?ni ç?xaran sql t?rtib edin (M?s: salary=15200, son hiss?=1200)
*/
select mod(salary, 1000) + 1000
from employees
where mod(salary, 1000) <> 0;


-- Task 26
/*
Employees c?dv?lind? bütün i?çil?rin siyah?s?n? ç?xaran sql yaz?n.
Ad, soyad v? bir i? günün? dü??n ?m?k haqq? (1 ayda 23 i? günü oldu?unu q?bul ed?r?k). Bir
gün? dü??n ?m?k haqq?n?n k?sr hiss?sind? ?n çoxu iki r?q?m qalmaqla yuvarlaqla?d?r?ls?n
*/
select first_name,
    last_name,
    round(salary/23, 2)
from employees;


-- Task 27
/*
H?r bir i?çi i?? q?bul oldu?u aydan sonrak? ay?n ilk günü ilk ?m?k haqq?n? al?r. Employees
c?dv?lind? h?r bir i?çinin ad, soyad v? ilk ?m?k haqq? alma tarixini göst?r?n sql t?rtib edin.
*/
select first_name,
    last_name,
    last_day(hire_date) + 1 as "Ilk emek haqqi gunu"
from employees;


-- Task 28
/*
??çi t?crüb?y? ba?lad??? günd?n 20 gün müdd?tind? s?naq müdd?tind? say?l?r, sonra is?
hire_date qeyd olunaraq, r?smi i?? q?bul olunur. Bunu n?z?r? alaraq, Employees c?dv?lind?n
h?r bir i?çinin ad, soyad v? t?crüb?y? ba?lama tarixini göst?r?n sql t?rtib edin.
*/
select first_name,
    last_name,
    hire_date - 20 as "Tecrubeye baslama gunu"
from employees;

-- Task 29
/*
??çil?rin h?r birinin i?? q?bul olundu?u tarixd?n 6 ay sonra ilk m?zuniyy?t? ç?xmaq
hüququnun oldu?una ?saslanaraq h?r bir i?çinin ad,
soyad v? ilk m?zuniyy?t hüququnun yarand??? tarixini göst?r?n sql t?rtib edin.
*/
select first_name,
    last_name,
    add_months(hire_date, 6) as "Ilk mezuniyyet elde ede bilme gunu"
from employees;


-- Task 30
/*
Employees c?dv?lind? h?r bir i?çinin qar??s?nda bu günd?n neç? ay ?vv?l i?? q?bul
olundu?unu göst?r?n sql t?rtib edin(k?sr hiss?si at?ls?n).
*/
--
select first_name,
    last_name,
    hire_date,
    round(MONTHS_BETWEEN(sysdate, hire_date))
from employees;