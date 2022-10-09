-- Task 21
/*
Employees c?dv?lind? last_name s�tununu �o� h?rfl?rini n?z?r? almamaqla �?xaran sql yaz?n.
*/
select replace(last_name, 'o', '')
from employees;

-- Task 22
/*
Employees c?dv?lind? ad v? soyad? birl??dirdikd?n sonra �at??mayan simvollar ?v?zin? `*`
i?ar?si qoymaqla �mumi uzunlu?u 50-? b?rab?r olan s�tun �?xaran sql yaz?n. (`*` i?ar?l?ri
sa?da v? yaxud solda ola bil?r)
*/
select lpad(concat(first_name, last_name), 50, '*')
from employees;

-- Task 23
/*
Employees c?dv?lind? first_name s�tununu �?xar?n, lakin �?xan s�tunda simvol say?, h?r
s?tird?ki last_name-d? olan simvol say? q?d?r olsun. �at??mayan simvollar?n ?v?zin? �#�
i?ar?sind?n istifad? edin.
*/
select lpad(first_name, length(last_name), '#')
from employees;

-- Task 24
/*
Employees c?dv?lind? b�t�n s?tirl?ri g�st?r?n sql yaz?n. Ad? ?n uzun olan i?�i ?n yuxar?da, ?n
q?sa olan i?�i is? ?n sonda �?xs?n.
*/
select *
from employees
order by length(first_name) desc;

-- Task 25
/*
Employees c?dv?lind? h?r bir i?�inin maa?? min-min hiss?l?r? b�l�nm?lidir,
1000-? �atmayan hiss?si is?, sonuncu min manata ?lav? olunmal?d?r, bell?lik?, sonuncu
hiss?ni �?xaran sql t?rtib edin (M?s: salary=15200, son hiss?=1200)
*/
select mod(salary, 1000) + 1000
from employees
where mod(salary, 1000) <> 0;


-- Task 26
/*
Employees c?dv?lind? b�t�n i?�il?rin siyah?s?n? �?xaran sql yaz?n.
Ad, soyad v? bir i? g�n�n? d�??n ?m?k haqq? (1 ayda 23 i? g�n� oldu?unu q?bul ed?r?k). Bir
g�n? d�??n ?m?k haqq?n?n k?sr hiss?sind? ?n �oxu iki r?q?m qalmaqla yuvarlaqla?d?r?ls?n
*/
select first_name,
    last_name,
    round(salary/23, 2)
from employees;


-- Task 27
/*
H?r bir i?�i i?? q?bul oldu?u aydan sonrak? ay?n ilk g�n� ilk ?m?k haqq?n? al?r. Employees
c?dv?lind? h?r bir i?�inin ad, soyad v? ilk ?m?k haqq? alma tarixini g�st?r?n sql t?rtib edin.
*/
select first_name,
    last_name,
    last_day(hire_date) + 1 as "Ilk emek haqqi gunu"
from employees;


-- Task 28
/*
??�i t?cr�b?y? ba?lad??? g�nd?n 20 g�n m�dd?tind? s?naq m�dd?tind? say?l?r, sonra is?
hire_date qeyd olunaraq, r?smi i?? q?bul olunur. Bunu n?z?r? alaraq, Employees c?dv?lind?n
h?r bir i?�inin ad, soyad v? t?cr�b?y? ba?lama tarixini g�st?r?n sql t?rtib edin.
*/
select first_name,
    last_name,
    hire_date - 20 as "Tecrubeye baslama gunu"
from employees;

-- Task 29
/*
??�il?rin h?r birinin i?? q?bul olundu?u tarixd?n 6 ay sonra ilk m?zuniyy?t? �?xmaq
h�ququnun oldu?una ?saslanaraq h?r bir i?�inin ad,
soyad v? ilk m?zuniyy?t h�ququnun yarand??? tarixini g�st?r?n sql t?rtib edin.
*/
select first_name,
    last_name,
    add_months(hire_date, 6) as "Ilk mezuniyyet elde ede bilme gunu"
from employees;


-- Task 30
/*
Employees c?dv?lind? h?r bir i?�inin qar??s?nda bu g�nd?n ne�? ay ?vv?l i?? q?bul
olundu?unu g�st?r?n sql t?rtib edin(k?sr hiss?si at?ls?n).
*/
--
select first_name,
    last_name,
    hire_date,
    round(MONTHS_BETWEEN(sysdate, hire_date))
from employees;