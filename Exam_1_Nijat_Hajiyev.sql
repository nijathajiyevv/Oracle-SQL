-- Task 1
/*
Employees c?dv?linin phone_number sütununda yaln?z 2 ?d?d '.'
(nöqt?) olan s?tirl?rin siyah?s?n? ç?xaran sql yaz?n.
Department_id-y? gör? azalan s?rada s?ralama edin v? s?ralamada ilk 6 s?tir qay?ts?n.
S?tir say?: 6 s?tir
*/
select *
from employees
where phone_number like '%.%.%'
order by department_id asc
fetch first 6 rows only;


-- Task 2
/*
Locations c?dv?lind? street_address sütunundarast g?lin?n 2-ci hiss?ni( bo?lu?a n?z?r?n)
silm?kl? n?tic? qaytar?n.INSTR istifad? etm?kl?
Nümun?:'1297 Via Cola di Rie'
N?tic?:'1297 Cola di Rie'
S?tir say?: 23 s?tir
*/
select
street_address,
case
    when instr(street_address,' ',1,2)=0 
    then substr(street_address,1,instr(street_address,' ',1,1)-1)
    when instr(street_address,' ',1,2)>0 
    then substr(street_address,1,instr(street_address,' ',1,1)) ||
    substr(street_address,instr(street_address,' ',1,2)+1)
    end
from locations;




-- Task 3
/*
Employees c?dv?lind?n 2006-ci ild?n etibar?n i?? gir?n  v? job_id-si 'PU_CLERK' yaxud 'SA_MAN' olan  i?çil?ri ç?xar?n.
1-ci sütun: employee_id 
2-ci sütun: hire_date
3-cu sütun: i?çinin h?ft?nin neç?nci günü i?? girm?sini göst?rm?k, alias: Num of Week
4-cu sütun: i?çinin ayin neç?nci günü i?? girm?sini göst?rm?k, alias: num_of_months
5-ci sütun: i?çinin ilin neç?nci günü i?? girm?sini göst?rm?k, alias: NUM_OF_YEAR
S?tir say?: 4 s?tir
*/
select employee_id, 
    hire_date, 
    to_char(hire_date,'d') as "Num of Week",
    to_char(hire_date, 'dd')  as "num_of_month",
    to_char(hire_date, 'ddd') as "NUM_OF_YEAR"
from employees
where (job_id = 'PU_CLERK' or job_id = 'SA_MAN') and to_char(hire_date, 'yyyy') > '2005';



-- Task 4
/*
Countries c?dv?lind?n country_name,region_id v? ALIAS - region_name sütunlar?n? ç?xar?n:
Region_name sütunu:
?g?r region_id sütunu 1 dirs? 'Europe',2-dirs? 'America',3-dürs?  'Asia', 4-dürs?  'Middle East and Africa' yaz?ls?n.
S?tir say?: 25 s?tir
*/
select country_name, region_id,
    case region_id
        when 1 then 'Europe'
        when 2 then 'America'
        when 3 then 'Asia'
        else 'Middle East and Africa'
    end as "Region_name"
from countries;


-- Task 5
/*
Employees c?dv?lind? phone_number sütununu '999,999,999,999,999.99' format?na g?tir?n sql yaz?n.
Nümun?:'515.123.4567'-------> '5,151,234,567.00'
S?tir say?: 107 s?tir
*/
select to_char(translate(phone_number, ' .', ' ')  , '999,999,999,999,999.99') as "Number"
from employees;


-- Task 6
/*
Employees c?dv?lind? last_name sütununda
2 ard?c?l 'l' h?rfi g?l?n s?tirl?ri ç?xaran sql yaz?n.
S?tir say?: 13 s?tir 
*/
select last_name
from employees
where lower(last_name) like '%ll%';


-- Task 7
/*
Task07
Ad?n?n ilk h?rfi sait (A, E, O, I, U) olan i?çil?rin ad v? soyad?n? birl??dirib,
bir sütunda full_name ba?l??? il? ç?xar?n.
S?tir say?: 16 s?tir
*/
select first_name || ' ' || last_name as "full_name"
from employees
where first_name like 'A%' or 
    first_name like 'E%' or 
    first_name like 'O%' or 
    first_name like 'I%' or 
    first_name like 'U%';



-- Task 8
/*
Task08
Employees c?dv?lind? kommissiyas? 50 faizd?n çox olan i?çil?r? 'komissiya maa??n yar?s?ndan çoxdur',  
50 faizd?n az olan i?çil?r? 'komissiya maa??n yar?s?ndan azd?r',
komissiyasi olmayanlara ise 'komissiya odemir' m?lumat?n? ç?xar?n,sütun ba?l??? 
commission_status olsun. N?tic? i?? girm? tarixin? gör? t?rsin? (böyükd?n kiçiy? do?ru) s?ralans?n.
S?tir say?: 107 s?tir
*/
select first_name, last_name, commission_pct,  
    case
        when commission_pct > 0.5 then 'komissiya maa??n yar?s?ndan çoxdur'
        when commission_pct < 0.5 then 'komissiya maa??n yar?s?ndan azd?r'
        when commission_pct is null then 'komissiya odemir'
    end
from employees
order by hire_date desc;


-- Task 9
/*
Task09
Departments c?dv?lind? ad?nda ba?lan??c v?
son h?rfl?ri eyni olan departmentl?rin ad?n? ç?xaran sql yaz?n.
S?tir say?: 3 s?tir
*/
select department_name
from departments
where lower(substr(department_name, 1, 1)) =  lower(substr(department_name, -1, 1));


-- Task 10
/*
Task10
Employees c?dv?lind?n ?n son i?? gir?n
5 n?f?rin ad?n?, soyad?n?, department_id-sini g?tir?n sql yaz?n. 
S?tir say?: 5 s?tir
*/
select first_name, last_name, department_id
from employees
order by hire_date desc
fetch first 5 rows only;


-- Task 11
/*
100-cu department-d?  maa?? 5000-15000 aras?nda olan 
v? ya departamentind?n as?l? olmayaraq i?? girm? ili 2005 olan i?çil?ri g?tir?n sor?u yaz?n.
S?tir say?: 33 s?tir
*/
select * 
from employees
where (department_id = '100' and salary between 5000 and 15000)
    or to_char(hire_date, 'yyyy') = '2005';


-- Task 12
/*
Task12
Locations c?dv?lind?n a?a??dak? ??kild? m?lumat? g?tir?n sor?unu yaz?n.
1297 Via Cola di Rie küç?si Roma ??h?rind? yerl??ir.  
S?tir say?: 23 s?tir
*/
select street_address || ' kucesi ' || city || ' seherinde yerlesir'
from locations;