-- Task 1
/*
Dual c?dv?lind?n istifad? ed?r?k 24 saat?n ne�? saniy? oldu?unu hesablayan sql yaz?n.
*/
SELECT 24*3600 FROM dual;


-- Task 2
/*
Employees c?dv?lind?n h?r bir ?m?kda??n ad v? soyad?n? a?a??dak? n�mun?y? uy?un ??kild?
�?xaran sql yaz?n.
Steven 's surname is King and salary is 24000
Neena 's surname is Kochhar and salary is 17000
Lex 's surname is De Haan and salary is 17000
Alexander 's surname is Hunold and salary is 9000
Bruce 's surname is Ernst and salary is 6000
Sizin n?tic?nizd? 107 s?tr olacaq.
*/
SELECT first_name || '''s surname is ' || last_name || ' and salary is' || salary
FROM hr.employees;


-- Task 3
/*
Departments c?dv?lind?n b�t�n s�tunlar? �?xaran sql yaz?n
*/
SELECT * FROM hr.departments;


-- Task 4
/*
Employees c?dv?lind? 1-ci s�tunda employee_id , 2-ci s�tunda first_name, last_name v? email
s�tunlar?n? birl??mi? halda �?xar?n.
*/
SELECT employee_id,
    first_name || ' ' || last_name || ' ' || email as " Name / Surname / Email"
FROM hr.employees;


-- Task 5
/*
Employees c?dv?lind? h?r i?�inin employee_id �sini v? 12 ayl?q maa??n?n c?minin 20%-ni
�?xar?n.
*/
SELECT employee_id, 
    salary *  12 * 0.2
FROM hr.employees;


-- Task 6
/*
Employees c?dv?lind? salary s�tununda ?m?k haqqlar?n?n b�t�n m�xt?lif qiym?tl?rini �?xar?n.
*/
SELECT UNIQUE salary
FROM hr.employees;


-- Task 7
/*
Employees c?dv?lind? h?r bir i?�i ���n first_name, last_name v? illik ?m?k haqq?n? �?xar?n.
S�tunlar?n adlar? bel? g�r?nm?lidir:
Ad Soyad Illik mash
*/
SELECT first_name as "Ad",
    last_name as "Soyad",
    salary * 12 as "Illik maash"
FROM hr.employees;


-- Task 8
/*
Employees c?dv?lind? h?r bir i?�i ���n first_name, last_name v? ?m?k haqq?n?n commissiya
�?x?lm?? hiss?sini �?xar?n.
*/
SELECT first_name,
    last_name,
    salary - salary * commission_pct
FROM hr.employees;


-- Task 9
/*
DUAL tabledan istifa ed?r?k, sad?c? bir s?tird?n v? iki s�tundan ibar?t olan n?tic? �?xaran sql yaz?n
*/
SELECT ' ', ' '
FROM dual;


-- Task 10
/*
ALL_TABLES tabledan 1-ci, 3-c� v? 6-c? s�tunlar? birl??dirib. bir s�tun kimi �?xaran sql yaz?n.
*/
SELECT owner || ' ' || tablespace_name || ' ' || status as "3 sutun"
FROM all_tables;


-- Task 11
/*
ALL_OBJECTS tabledan object_type sah?sind? olan f?rqli qiym?tl?ri �?xaran sql yaz?n.
*/
SELECT DISTINCT object_type
FROM  all_objects;


-- Task 12
/*
ALL_VIEWS tabledan owner v? text_length sah?l?rind? birlikd? unikal olan qiym?tl?ri �?xaran sql yaz?n.
*/
SELECT UNIQUE owner, text_length
FROM all_views;


-- Task 13
/*
ALL_OBJECTS tabledan status sah?sind? olan f?rqli qiym?tl?ri �?xaran sql yaz?n.
*/
SELECT DISTINCT status 
FROM all_objects;
   

-- Task 14
/*
Employees c?dv?linin strukturunu g�st?r?n komanda yaz?n.
*/
DESCRIBE hr.employees;
