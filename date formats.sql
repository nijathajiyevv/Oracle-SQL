SELECT 
    TO_CHAR(SYSDATE, 'Day') AS Day_of_the_week,
    TO_CHAR(SYSDATE, 'd') AS week_day_number,
    TO_CHAR(SYSDATE, 'dy') AS short_day_of_the_week,
    TO_CHAR(SYSDATE, 'DD') AS day,
    TO_CHAR(SYSDATE, 'iw') AS week_of_the_year,
    TO_CHAR(SYSDATE, 'Month') AS Month_number,
    TO_CHAR(SYSDATE, 'mm') AS Month,
    TO_CHAR(SYSDATE, 'YYYY') AS Year,
    TRUNC(SYSDATE, 'MM') AS first_day_of_mnth,
    LAST_DAY(SYSDATE) AS last_day_of_mnth,
    ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1) AS first_day_of_next_mnth,
    LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1)) AS last_day_next_mnth,
    ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1) AS first_day_of_prev_mnth,
    LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1)) AS last_day_prev_mnth
FROM dual;