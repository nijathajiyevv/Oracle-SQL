-- Task 1
/*
H?r bir i?çinin ad, soyad, maa??n? v? 4-cü
sütunda öz maa??na gör? (row_number, rank v? dense_rank) s?ras?n? ç?xar?n.
*/
select
    first_name,
    last_name,
    salary,
    row_number() over(order by salary) as row_number,
    rank() over(order by salary) as rank,
    dense_rank() over(order by salary) as dense_rank
from employees;


-- Task 2
/*
H?r bir i?çinin ad, soyad, maa??n? v? 4-cü sütunda
öz maa??na gör? s?ra nömr?sini ç?xar?n (h?r biri unikal). 
*/
select
    first_name,
    last_name,
    salary,
    row_number() over(order by salary desc) as row_number
from employees;


-- Task 3
/*
H?r bir i?çinin ad, soyad, maa??n? v? 4-cü sütunda
öz maa??na gör? reytinqini ç?xar?n (eyni maa?lar eyni nömr?).
*/
select
    first_name,
    last_name,
    salary,
    rank() over(order by salary desc) as dense_rank
from employees;


-- Task 4
/*
H?r bir i?çinin ad, soyad, maa??n? v? 4-cü sütunda öz maa??na gör?
reytinqini ç?xar?n (eyni maa?lar eyni nömr?, bo? nömr?l?r qalmamaqla).
*/
select
    first_name,
    last_name,
    salary,
    dense_rank() over(order by salary desc) as dense_rank
from employees;


-- Task 5
/*
H?r bir i?çinin ad, soyad, maa??n? v? 4-cü sütunda öz departamenti üzr? maa??na gör?
(row_number, rank v? dense_rank) s?ras?n? ç?xar?n.
*/
select
    first_name,
    last_name,
    salary,
    department_id,
    row_number() over(partition by  department_id order by  salary asc) as row_number,
    rank() over(partition by  department_id order by  salary asc) as rank,
    dense_rank() over(partition by  department_id order by  salary asc) as dense_rank
from employees;


select
    first_name,
    last_name,
    salary,
    department_id,
    row_number() over(partition by  department_id) as row_number,
    rank() over(partition by  department_id) as rank,
    dense_rank() over(partition by  department_id) as dense_rank
from employees
order by department_id;

-- Task 6
/*
H?r bir i?çinin ad, soyad, maa??n? v? 4-cü sütunda
öz departamenti üzr? maa??na gör? s?ra
nömr?sini ç?xar?n (h?r biri unikal)
*/
-- anlamiram suali tam
-- mence beledir
select
    first_name,
    last_name,
    salary,
    department_id,
    row_number() over (partition by department_id order by salary asc)
from employees;



-- Task 7
/*
H?r bir i?çinin ad, soyad, maa??n? v? 4-cü sütunda
öz departamenti üzr? maa??na gör?
reytinqini ç?xar?n (eyni maa?lar eyni nömr?).
*/
select
    first_name,
    last_name,
    salary,
    department_id,
    rank() over (partition by department_id order by salary asc)
from employees;


-- Task 8
/*
H?r bir i?çinin ad, soyad, maa??n? v? 4-cü sütunda öz departamenti üzr? maa??na gör?
reytinqini ç?xar?n (eyni maa?lar eyni nömr?, bo? nömr?l?r qalmamaqla).
*/
select
    first_name,
    last_name,
    salary,
    dense_rank() over (partition by department_id order by salary asc)
from employees;


-- Task 9
/*
H?r bir i?çinin ad, soyad?, departament_name-i v?
4-cü sütunda öz departamenti üzr? c?m maa?? ç?xar?n.
*/
select
    first_name,
    last_name,
    department_id,
    sum(salary) over(partition by department_id)
from employees;


-- Task 10
/*
H?r bir i?çinin ad, soyad?, departament_name-i v?
4-cü sütunda bütün i?çil?rin c?m maa??n? ç?xar?n.
*/
select
    first_name,
    last_name,
    department_id,
    sum(salary) over()
from employees;