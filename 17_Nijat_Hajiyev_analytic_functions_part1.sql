-- Task 1
/*
H?r bir i?�inin ad, soyad, maa??n? v? 4-c�
s�tunda �z maa??na g�r? (row_number, rank v? dense_rank) s?ras?n? �?xar?n.
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
H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda
�z maa??na g�r? s?ra n�mr?sini �?xar?n (h?r biri unikal). 
*/
select
    first_name,
    last_name,
    salary,
    row_number() over(order by salary desc) as row_number
from employees;


-- Task 3
/*
H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda
�z maa??na g�r? reytinqini �?xar?n (eyni maa?lar eyni n�mr?).
*/
select
    first_name,
    last_name,
    salary,
    rank() over(order by salary desc) as dense_rank
from employees;


-- Task 4
/*
H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z maa??na g�r?
reytinqini �?xar?n (eyni maa?lar eyni n�mr?, bo? n�mr?l?r qalmamaqla).
*/
select
    first_name,
    last_name,
    salary,
    dense_rank() over(order by salary desc) as dense_rank
from employees;


-- Task 5
/*
H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z departamenti �zr? maa??na g�r?
(row_number, rank v? dense_rank) s?ras?n? �?xar?n.
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
H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda
�z departamenti �zr? maa??na g�r? s?ra
n�mr?sini �?xar?n (h?r biri unikal)
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
H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda
�z departamenti �zr? maa??na g�r?
reytinqini �?xar?n (eyni maa?lar eyni n�mr?).
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
H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z departamenti �zr? maa??na g�r?
reytinqini �?xar?n (eyni maa?lar eyni n�mr?, bo? n�mr?l?r qalmamaqla).
*/
select
    first_name,
    last_name,
    salary,
    dense_rank() over (partition by department_id order by salary asc)
from employees;


-- Task 9
/*
H?r bir i?�inin ad, soyad?, departament_name-i v?
4-c� s�tunda �z departamenti �zr? c?m maa?? �?xar?n.
*/
select
    first_name,
    last_name,
    department_id,
    sum(salary) over(partition by department_id)
from employees;


-- Task 10
/*
H?r bir i?�inin ad, soyad?, departament_name-i v?
4-c� s�tunda b�t�n i?�il?rin c?m maa??n? �?xar?n.
*/
select
    first_name,
    last_name,
    department_id,
    sum(salary) over()
from employees;