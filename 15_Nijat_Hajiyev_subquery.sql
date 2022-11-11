-- Task 1
/*
Employees cedvelinde Susan ile eyni gunde ise qebul olan iscileri cixarin.
*/
select *
from employees
where hire_date = (select hire_date
                    from employees
                    where first_name = 'Susan');


-- Task 2
/*
Employees cedvelinden employee_id-si 107,110,115,205 olan iscilerin managerlerinin ad,
soyadini cixarin. (iki hell hem join hem subquery)
*/
-- subquery
select
    first_name,
    last_name
from employees emp
where employee_id in (
                        select manager_id
                        from employees 
                        where employee_id in (107, 110, 115, 205));

-- join
select
    man.first_name,
    man.last_name
from employees emp
    inner join employees man
    on emp.manager_id = man.employee_id
where emp.employee_id in (107, 110, 115, 205);


-- Task 3
/*
Employees cedvelinden salary-si butun iscilerin orta
maasinda boyuk olan iscilerin siyahisini cixarin.
*/
select
    first_name,
    last_name
from employees
where salary = (select avg(salary)
                    from employees);


-- Task 4
/*
Departments , employees cedvelinden istifade ederek salary-si 14000-den boyuk olan iscilerin
calisdigi department_name tekrarlanmayan siyahisini cixarin(iki hell hem join hem subquery)
*/
-- subquery
select unique department_name
from departments 
where department_id in (select department_id
                from employees
                where salary >14000);

-- join
select
    unique dep.department_name
from departments dep
    left join employees emp
    on emp.department_id = dep.department_id
where emp.salary > 14000;


-- Task 5
/*
Employees, departments cedvelinden iscinin ad, soyad, hire_date, department_name
melumatini cixarin. (iki hell hem join hem subquery)
*/
select
    first_name,
    last_name,
    hire_date,
    (select department_name from departments dep
        where dep.department_id = emp.department_id)
from employees emp;


-- join
select
    emp.first_name,
    emp.last_name,
    emp.hire_date,
    dep.department_name
from employees emp
    left join departments dep
    on emp.department_id = dep.department_id;


-- Task 6
/*
Departments cedvelinde manager_id-si bos olmayan departmentlerinin yerlesdiyi
city,street_address melumatini cixaran sql yazin(subquery, join iki usulla)
*/
select
    unique (select city from locations loc
        where loc.location_id = dep.location_id),
    (select street_address from locations loc
        where loc.location_id = dep.location_id)
from departments dep
where dep.manager_id is not null;



-- join
select 
    unique loc.city,
    loc.street_address
from locations loc
    left join departments dep
    on dep.location_id = loc.location_id
where dep.manager_id is not null;


-- Task 7
/*
Employees cedvelinden max ve min salary alan butun iscilerin siyahisini cixarin
*/
select first_name, last_name
from employees 
where salary = (select max(salary) from employees) or salary = (select min(salary) from employees);



-- Task 8
/*
Employees cedvelinden first_name, last_name, salary, average_salary ( bu umumi employees
cedveli uzre butun iscilerin orta maasidir)
ve eger maasi orta maasdan yuxaridirsa ‘Above total average salary’ kicikdirse ‘Below total
average salary’ yazmaqla salary_status adli sutun cixarin
*/
select
    first_name,
    last_name,
    salary,
    (select round(avg(salary)) from employees) as "Avg salary",
    (case
        when salary > (select round(avg(salary)) from employees) then 'Above total average salary'
        else 'Below total average salary'
        end) as "Salary status"
from employees;


-- Task 9
/*
Employees cedvelinden first_name, last_name, salary, average_dep_salary
( bu umumi employees cedveli uzre faktiki iscinin calisdigi departmentin orta maasidir) ve
eger maasi orta maasdan yuxaridirsa ‘Above average department salary’ kicikdirse ‘below
average department salary’ yazmaqla salary_dep_status adli sutun cixarin.
*/
select
    first_name,
    last_name,
    salary,
    (select round(avg(salary)) from employees emp2
        where emp.department_id = emp.department_id) as average_dep_salary,
    case
        when salary >(select round(avg(salary)) from employees emp2
        where emp.department_id = emp.department_id) then 'Above average department salary'
        else 'below average department salary'
        end as salary_dep_status
from employees emp;


-- Task 10
/*
Employees cedvelinden first_name, last_name, salary, average_job_salary ( bu umumi
employees cedveli uzre faktiki iscinin calisdigi job_id uzre orta maasidir) ve eger maasi orta
maasdan yuxaridirsa ‘Above average job salary’ kicikdirse ‘below average job salary’
yazmaqla salary_job_status adli sutun cixarin
*/
select
    first_name,
    last_name,
    salary,
    (select round(avg(salary)) from employees emp2
        where emp.job_id = emp2.job_id) as average_job_salary,
    case
        when salary >(select round(avg(salary)) from employees emp2
        where emp.job_id = emp.job_id) then 'Above average job salary'
        else 'below average job salary'
        end as salary_job_status
from employees emp;