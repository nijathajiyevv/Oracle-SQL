-- Task 1
/*
Employees c?dv?lind? i?çil?rin ad?n?, soyad?n? v? 3-cü sütunda commission_pct varsa, onda
‘SALARY AND COMM’, ?ks halda ‘SALARY’ ç?xaran sql t?rtib edin (funksiya istifad? etm?kl?).
*/
select first_name, last_name,
    case
        when commission_pct is not null then 'SALARY AND COMM'
        else 'SALARY'
    end as "Comm"
from employees;

-- Task 2
/*
Employees c?dv?lind? i?çil?rin ad?n?, soyad?n? v? 3-cü sütunda ?g?r ad v? soyadda olan h?rfl?rin
say? f?rqlidirs?, addak? h?rfl?rin say?n?, ?ks halda null ç?xaran sql t?rtib edin. 2 üsul il?
*/
select first_name, last_name, 
    case
        when length(first_name) != length(last_name) then length(first_name)
        else null
    end as "herf sayi"
from employees;


-- Task 3
/*
Employees c?dv?lind? i?çil?rin ad?n?, soyad?n?, departament id-sini v? 4-cü s?trd? ?g?r i?çi 10 id-li
departamentd? i?l?yirs?,
`Manager`, 20 id-li departamentd? i?l?yirs?, `SubManager`, ?ks halda `Other` ifad?l?ri ç?xaran sql
t?rtib edin. Case v? decode il?
*/
select first_name, last_name, department_id,
    case 
        when department_id = 10 then 'Manager'
        when department_id = 20 then 'Submanager'
        else 'Other'
    end as "Department class"
from employees;


select first_name, last_name, department_id,
    case department_id
        when 10 then 'Manager'
        when 20 then 'Submanager'
        else 'Other'
    end as "Department class"
from employees;


select first_name,last_name,department_id,
    decode (department_id,
    '10' , 'Manager',
    '20' , 'Submanager',
    'other') as "result"
from employees;


-- Task 4
/*
Employees c?dv?lind? i?çil?rin ad?n?, soyad?n?, ?m?k haqq?n? v? 4-cü s?trd? ?g?r i?çinin ?m?k
haqq? 10.000 –d?n böyükdürs?, `yüks?k`, 10.000-d?n kiçik 5.000 –d?n boyükdürs?, `orta`, ?ks
halda `a?a??` ifad?l?rini ç?xaran sql t?rtib edin.
*/
select first_name, last_name, salary, 
    case
        when salary > 10000 then 'Yuksek'
        when salary between 5000 and 10000 then 'Orta'
        else 'Asagi'
    end as "Emek haqqi"
from employees;


-- Task 5
/*
$1,600.00 ??kild? verilmi? m?bl??? to_number funksiyas?n? t?tbiq et 
(dual psevdoc?dv?lind?n istifad? etm?kl?)
*/
select to_number('$1,600.00', '$999,999.99') as "Number" from dual;


-- Task 6
/*
Emplooyes c?dv?lind? last_name v? first_name-d?n istifad? ed?r?k email yarad?n:
M?s?l?n: last_name King, first_naame Steven ? kin_ven@shahinkarimov.com
*/
select first_name, last_name,
    substr(last_name,1,3) || '_' 
    || substr(first_name,-3,3)
    || '@shahinkarimov.com' as "email"
from employees;


-- Task 7
/*
Employees c?dv?lind? last_name v? first_name sütunlar?n? birl??dirdikd?n sonra:
5-ci simvoldan etibar?n 3 simvoldan h?r hans? biri 'a' ve yaxud 'A' herfin? b?rab?rdis?,
onlari chixarsin
*/
select first_name, last_name, substr(last_name || first_name,5,3)
from employees
where substr(last_name || first_name,5,3) like '%a%' or 
    substr(last_name || first_name,5,3) like '%A%';  


-- Task 8
/*
Departments: hansi name-ler simvol sayi tekdirse, hemin name-lerin ortaya dushen simvolunu tapiriq
*/
select department_name, 
substr(department_name,length(department_name)/2+1,1)
from departments
where mod(length(department_name), 2) = 1;


-- Task 9
/*
Departments: hansi name-ler simvol sayi cütdürs?,
hemin name-lerin ortaya dushen iki yana??
simvolunu tapiriq.
*/
select department_name,
    substr(department_name, length(department_name)/2, 2)
from departments
where mod(length(department_name), 2) = 0;


-- Task 10
/*
Departments: name-lerin ortaya dushen simvolunu tapiriq (simvol sayi tek olduqda ortaya dü??n
bir, cüt olduqda ortaya dü??n iki simvol). Bir SQL yazmaqla.
*/
select
department_name,
case mod (length(department_name),2)
when 0 then substr(department_name,length(department_name)/2,2)
when 1 then substr(department_name,length(department_name)/2+1,1)
        end as "result"
from departments;

select department_name,
 decode(mod (length(department_name),2),0,substr(department_name,length(department_name)/2,2),
             1,substr(department_name,length(department_name)/2+1,1))
             from departments;


-- Task 11
/*
Locations: bütün s?trl?rin street_address sütunundak? ilk hiss?ni tapiriq
*/
select street_address, 
    substr(street_address, 1, instr(street_address, ' '))
from locations;


-- Task 12
/*
Locations: street_address sütunundak? ikinci hissini tapiriq.
*/
select street_address, 
    substr(street_address, instr(street_address, ' '),instr(street_address, ' ', 2) )
from locations;


-- Task 13  
/*
Locations: street_address sütununda son hiss?ni tapiriq.
*/
select street_address, 
    substr(street_address, instr(trim(street_address), ' ', -1)+1)
from locations;


-- Task 14
/*
Dual: sysdate-i 'dd.mm.yyyy (ilin nechenci gunudur) (heftenin nechenci gunudur)' shablonuna
uygun chixarin.
*/
select  to_char(sysdate, 'd') as week,
        to_char(sysdate, 'ddd') as year
from dual;


-- Task 15
/*
Dualdan istifad? edib, sysdate + 5ay tarixini '20210225 saat:deqiqe:saniye' ?ablonuna uy?un
göst?rin.
*/
select to_char(add_months(sysdate,5),  'yyyymmdd hh24:mi:ssy')  from dual;


-- Task 16
/*
Employees: ishe girme tarixleri 2003-cu il olan ishchileri chixarin.
*/
select *
from employees
where to_char(hire_date, 'yyyy') = '2003';


-- Task 17
/*
Employees: ischinin ishe girdiyi tarixden bu gune qeder olan muddeti il ve aya gore gosterin.
*/
select  hire_date, 
    trunc(months_between(sysdate,hire_date) / 12) as "Il uzre",
    trunc(months_between(sysdate,hire_date)) as "Aylar uzre",
    numtoyminterval(months_between(sysdate,hire_date),'month') as "Il uzre 2"
from employees;

-- Task 18
/*
Employees cedvelinden hansi ishchi ayin son gunu ishe giribse, onlari chixaran sql yaziriq.
*/
select first_name, last_name, hire_date
from employees
where hire_date = last_day(hire_date);

-- Task 19
/*
Dual: sysdate ve '22.05.2022 saat 9:25' arasinda qalan muddeti intervalla gostermek (neche
gun saat deqiqe saniye)
*/
select numtodsinterval((sysdate - to_date('22.05.2022 9:25', 'dd.mm.yyyy hh12:mi:ss AM')), 'day')
from dual;

-- Task 20
/*
Dual: sysdate-i 'dd.mm.yyyy (ilin neç?nci günüdür) (h?ft?nin neç?nci günudur)' ?ablonuna uygun chixarin.
*/
select
    to_char (sysdate, 'dd.mm.yyyy'),
    to_char (sysdate,'ddd') ,
    to_char (sysdate,'d') 
from dual;

-- Task 21
/*
Dual:sysdate + 5ay n?tic?sini '20210225 saat:deqiqe:saniy?' ?ablonuna uygun chixarin.
*/
select to_char(add_months(sysdate, 5), 'yyyymmdd hh12:mi:ss am')
from dual;


-- Task 22
/*
Employees: i?e girm? tarixleri 2003-cu il olan isçileri çixar?n. 
*/
select *
from employees
where to_char(hire_date, 'yyyy') = '2003';

-- Task 23
/*
Employyes c?dv?lind?n Mart, v? Sentyabr aylar?nda i?? q?bul olunan i?çil?ri ç?xar?n
*/
select *
from employees
where to_char(hire_date, 'mm') = 03 or to_char(hire_date, 'mm') = 09;



-- Task 24
/*
Employees c?dv?lind?n 2003cu ild?n ?vv?l i?? q?bul olunan v? ya Yanvar ay?nda i?? q?bul olunub
salary-si 8000-d?n böyük olan i?ç?l?ri ç?xar?n.
*/
select *
from employees
where hire_date < to_date('2003', 'yyyy')
    or (hire_date = to_date('01', 'mm') and salary >8000);


-- Task 25
/*
Employees c?dv?lind? address sütununda 3-cü simvoldan ba?layaraq rast g?lin?n 2-ci
'a' h?rfinin yerini (position) göst?r?n sql yaz?n.
*/
-- YEQIN KI LOCATIONS CEDVELI NEZERDE TUTMUSUZ
select street_address, 
    instr(street_address, 'a', 3, 2)
from locations;


-- Task 26
/*
Employees c?dv?lind?n first_name, last_name, salary v? commission_pct sutunu null olduqda
"komisiya odemir"
dolu olduqda "komisiya odeyir" c?xar?n(nvl, nvl2, coalesce, case,decode her 5 usul il?) 
*/
select nvl2(first_name, 'komisiya odeyir', 'komisiya odemir') as "AD",
    nvl2(last_name, 'komisiya odeyir', 'komisiya odemir') as "SOYAD",
    nvl2(salary, 'komisiya odeyir', 'komisiya odemir') as "SALARY",
    nvl2(commission_pct, 'komisiya odeyir', 'komisiya odemir') as "COMISSION"
from employees;

select nvl(first_name, 'komisiya odemir'),
    nvl(last_name, 'komisiya odemir'),
    nvl(salary, 'komisiya odemir'),
    nvl(commission_pct, 'komisiya odemir')
from employees;
    
select first_name, last_name, salary, commission_pct,
    coalesce(to_char(commission_pct), to_char(manager_id), to_char(department_id), email, phone_number)  
from employees;

select first_name, last_name, salary, commission_pct,
    coalesce(to_char(first_name), to_char(last_name), to_char(salary), to_char(commission_pct))
from employees;


-- Task 27
/*
Departments c?dv?lind?n department_id, department_name v? manager_id oldugu halda
"department_name-nin manageri var" yaz?s?
null oldugu halda i?? "department_name-nin manageri yoxdur" cixsin.(nvl, nvl2, coalesce,
case,decode her 5 usul il?)
*/
-- 26 SUAL ILE EYNIDIR



-- Task 28
/*
Employees c?dv?lind? i?çil?rin ad?n?, soyad?n?, salary v? salary-si 4000-den kiçik olanda
‘a?a?i’, 4000-8000 arali??nda olduqda ‘orta’ dig?r hallarda ‘yüksek’ yazisini
‘salary_category’ aliasi ile chixaran sql t?rtib edin.
*/
select first_name, last_name, salary,
    case
        when salary < 4000 then 'Asagi'
        when salary < 8000 then 'Orta'
        else 'Yuksek'
    end as "Salary category"
from employees;


-- Task 29
/*
Jobs c?v?lind? Job_title-de Manager sözu olan s?trlerde Menecer, Clerk sözu olanlarda
Klerk, Representative olanlarda Numayende diger hallarda ise Job_title özünu çixaran sql yazin
*/
select job_title,
    case 
        when job_title like '%Manager%' then 'Menecer'
        when job_title like '%Clerk%' then 'Klerk'
        when job_title like '%Representative%' then 'Numayende'
        else job_title
    end as "JOB_TITLES"
from jobs;


-- Task 30
/*
Locations c?dv?lind?n street_address sütununda a, b, c, d simvollar?n? n?z?r? almamaqla simvol
say? 20-d?n böyük olan s?trl?ri cixaran projection nümun?si yaz?n.
*/
select street_address, 
    translate(street_address, ' abcd', ' ')
from locations
where length(translate(street_address, ' abcd', ' ')) > 20;