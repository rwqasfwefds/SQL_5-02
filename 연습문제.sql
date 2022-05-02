-- 연습문제 1) 모든 사원의 급여 최고액과 최저액, 총액 및 평균 급여를 출력하셈
-- 컬럼의 별칭은 : 최고액, 최저액, 총액, 평균급여
-- 단, 실수가 나오면 반올림 해주셈

SELECT MAX(SALARY) AS 최고액,
       MIN(SALARY) AS 최저액,
       SUM(SALARY) AS 총액,
       ROUND(AVG(SALARY)) AS 평균급여
FROM EMPLOYEE;

-- 연습문제 2) 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하셈
-- 컬럼의 별칭은 : 최고액, 최저액, 총액, 평균급여
-- 단, 실수가 나오면 반올림 해주셈

SELECT JOB AS 담당업무, 
       MAX(SALARY) AS 최고액,
       MIN(SALARY) AS 최저액,
       SUM(SALARY) AS 총액,
       ROUND(AVG(SALARY)) AS 평균급여
FROM EMPLOYEE
GROUP BY JOB;

-- 연습문제 3) COUNT(*) 함수를 이용하여 담당 업무가 동일한 사원 수를 출력하셈
SELECT JOB AS 담당업무, 
       COUNT(*) AS "사원 수"
FROM EMPLOYEE
GROUP BY JOB;

-- 연습문제 4) 관리자 수를 나열하시오.
SELECT MANAGER AS 관리자, COUNT(*)
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL
GROUP BY MANAGER;

-- 답
SELECT COUNT(MANAGER)
FROM EMPLOYEE;

-- 연습문제 5) 급여 최고액, 급여 최저액의 차액을 출력하세요.
-- 컬럼 별칭은 "차액"으로 표기하세요
SELECT (MAX(SALARY) - MIN(SALARY)) AS 차액
FROM EMPLOYEE;

-- 연습문제 6) 직급별 사원의 최저 급여를 출력하세요
-- 관리자를 알 수 없는 사원 및 최저 급여가 2000 미만인 그룹은 제외시키고
-- 결과를 급여에 대한 내림차순으로 정렬하여 출력하셈
SELECT JOB AS 담당업무,
       MIN(SALARY) AS 최저액
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL
GROUP BY JOB
HAVING MIN(SALARY) > 2000
ORDER BY MIN(SALARY) DESC;

-- 연습문제 7) 각 부서에 대해 부서번호, 사원 수, 부서 내의 모든 사원의 평균 급여를 출력하세요
-- 컬럼 별칭, 부서번호, 사원 수, 평균 급여
-- 평균 급여는 소수점 2째자리에서 반올림 하셈
SELECT DNO AS "부서 번호",
       COUNT(*) AS "사원 수",
       ROUND(AVG(SALARY), 2) AS "평균 급여"
FROM EMPLOYEE
GROUP BY DNO;
       
-- 연습문제 8) 각 부서에 대해 부서번호, 이름, 지역명, 사원 수
-- 부서별 사원의 평균 급여를 출력하셈(DECODE, CASE WHEN 둘 중 하나 사용)
-- 컬럼 별칭 부서이름, 지역명, 사원 수, 평균급여
SELECT DNO,
    CASE WHEN DNO = 10 THEN 'ACCOUNTING'
         WHEN DNO = 20 THEN 'RESEARCH'
         WHEN DNO = 30 THEN 'SALES'
         WHEN DNO = 40 THEN 'OPERATIONS'
    END AS "부서 이름",
    CASE WHEN DNO = 10 THEN 'NEW WORK'
         WHEN DNO = 20 THEN 'DALLAS'
         WHEN DNO = 30 THEN 'CHICAGO'
         WHEN DNO = 40 THEN 'BOSTON'
    END AS "지역 명",
    COUNT(*) AS "사원 수",
    ROUND(AVG(SALARY)) AS "평균 급여"
FROM EMPLOYEE
GROUP BY DNO;