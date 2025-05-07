SELECT
    LAST_NAME
    || ' earns '
    || SALARY
    || ' monthly but wants '
    || SALARY * 3
    || '.' AS "Dream Salaries"
FROM
    HR.EMPLOYEES;

SELECT
    LAST_NAME,
    CASE
        WHEN COMMISSION_PCT IS NULL THEN
            'No Commission'
        ELSE
            TO_CHAR(COMMISSION_PCT)
    END AS COMM
FROM
    HR.EMPLOYEES;

SELECT
    JOB_ID,
    DECODE(JOB_ID, 'AD_PRES', 'A', 'ST_MAN', 'B',
           'IT_PROG', 'C', 'SA_REP', 'D', 'ST_CLERK',
           'E', '0') AS GRADE
FROM
    HR.EMPLOYEES;

SELECT
    JOB_ID,
    CASE
        WHEN JOB_ID = 'AD_PRES'  THEN
            'A'
        WHEN JOB_ID = 'ST_MAN'   THEN
            'B'
        WHEN JOB_ID = 'IT_PROG'  THEN
            'C'
        WHEN JOB_ID = 'SA_REP'   THEN
            'D'
        WHEN JOB_ID = 'ST_CLERK' THEN
            'E'
        ELSE
            '0'
    END AS GRADE
FROM
    HR.EMPLOYEES;

SELECT
    MAX(SALARY) AS "Hoghest Salary",
    MIN(SALARY) AS "Lowest Salary",
    SUM(SALARY) AS "Total",
    AVG(SALARY) AS "Average Salary"
FROM
    HR.EMPLOYEES;

SELECT
    JOB_ID,
    MAX(SALARY) AS "Hoghest Salary",
    MIN(SALARY) AS "Lowest Salary",
    SUM(SALARY) AS "Total",
    AVG(SALARY) AS "Average Salary"
FROM
    HR.EMPLOYEES
GROUP BY
    JOB_ID;

SELECT
    JOB_ID,
    COUNT(*) AS "Count"
FROM
    HR.EMPLOYEES
GROUP BY
    JOB_ID;

SELECT
    JOB_ID,
    COUNT(*) AS "Count"
FROM
    HR.EMPLOYEES
WHERE
    JOB_ID = '&SELECTED_JOB'
GROUP BY
    JOB_ID;

SELECT
    COUNT(DISTINCT MANAGER_ID) AS "Manager Count"
FROM
    HR.EMPLOYEES
WHERE
    MANAGER_ID IS NOT NULL;

SELECT
    MAX(SALARY) - MIN(SALARY) AS "DIFFERENCE"
FROM
    HR.EMPLOYEES;

SELECT
    COUNT(*) AS "Total",
    COUNT(
        CASE
            WHEN EXTRACT(YEAR FROM HIRE_DATE) = 2015 THEN
                1
        END
    )        AS "2015",
    COUNT(
        CASE
            WHEN EXTRACT(YEAR FROM HIRE_DATE) = 2016 THEN
                1
        END
    )        AS "2016",
    COUNT(
        CASE
            WHEN EXTRACT(YEAR FROM HIRE_DATE) = 2017 THEN
                1
        END
    )        AS "2017",
    COUNT(
        CASE
            WHEN EXTRACT(YEAR FROM HIRE_DATE) = 2018 THEN
                1
        END
    )        AS "2018"
FROM
    HR.EMPLOYEES;

SELECT
    JOB_ID      AS "Job",
    SUM(
        CASE
            WHEN DEPARTMENT_ID = 20 THEN
                SALARY
        END
    )           AS "Department 20",
    SUM(
        CASE
            WHEN DEPARTMENT_ID = 50 THEN
                SALARY
        END
    )           AS "Department 50",
    SUM(
        CASE
            WHEN DEPARTMENT_ID = 80 THEN
                SALARY
        END
    )           AS "Department 80",
    SUM(
        CASE
            WHEN DEPARTMENT_ID = 90 THEN
                SALARY
        END
    )           AS "Department 90",
    SUM(SALARY) AS "Total"
FROM
    HR.EMPLOYEES
GROUP BY
    JOB_ID;

SELECT
    LAST_NAME,
    HIRE_DATE,
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
    || ' year '
    || TO_CHAR(EXTRACT(MONTH FROM SYSDATE) - EXTRACT(MONTH FROM HIRE_DATE))
FROM
    HR.EMPLOYEES;

SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12)                                                   AS "Years",
    FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) -(FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) * 12)) AS "Months",
    ROUND(SYSDATE - ADD_MONTHS(HIRE_DATE,
                               FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))),
          0)                                                                                         AS "Days"
FROM
    HR.EMPLOYEES;

