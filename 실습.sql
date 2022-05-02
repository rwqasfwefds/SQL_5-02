-- LPAD(�÷���, �ڸ���, ä�﹮��)
-- ����(LEFT) �ڸ��� Ư�� ��ȣ�� ä���(PAD) �����Լ�
SELECT LPAD(SALARY, 10, '*')
FROM EMPLOYEE;

-- RPAD(�÷Ÿ�, �ڸ���, ä�﹮��)
-- ������(RIGHT) �ڸ��� Ư�� ��ȣ�� ä���(PAD) �����Լ�
SELECT RPAD(SALARY, 10, '*')
FROM EMPLOYEE;

-- LTRIM(���ڿ�) = ���� ���� ����
-- RTRIM(���ڿ�) = ������ ���� ����
-- TRIM(���ڿ�) = ���� ���� ����
SELECT ' Oracle mania ',
    LTRIM(' Oracle mania '),
    RTRIM(' Oracle mania '),
    TRIM(' Oracle mania ')
FROM DUAL;

-- ���� �Լ�
-- ROUND(�Ǽ�, �ݿø� �� �ڸ���(��������)) : Ư�� �ڸ������� �ݿø��ϴ� ���� �Լ�
SELECT 98.7654,
    ROUND(98.7654), -- ù°�ڸ� �ݿø�
    ROUND(98.7654, 2), -- ��°�ڸ� �ݿø� (�Ű������� 2°�ڸ� ����)
    ROUND(98.7654, -1)-- �����ڸ�(1�� �ڸ�) �� �ø�
FROM DUAL;

-- TRUNC() : Ư�� �ڸ������� ����
SELECT 98.7654,
    TRUNC(98.7654), -- ù° �ڸ����� ����
    TRUNC(98.7654, 2), -- ��° �ڸ����� ����
    TRUNC(98.7654, -1) -- �����ڸ�(1�� �ڸ�) ����
FROM DUAL;

-- MOD : ù ��° ���� �� ��° ������ ���� �������� ��ȯ(�ڹ��� ������ �����ڿ� ����)
SELECT MOD(31, 2),
    MOD(31, 5),
    MOD(31, 8)
FROM DUAL;

-- ���� 1) ��� ����� �޿��� 500���� ���� �������� ����ؼ� ����ϼ�
SELECT ENAME, SALARY,
    MOD(SALARY, 500)
FROM EMPLOYEE;

-- ��¥ �Լ�
-- �ý��ۿ� ����� ���� ��¥�� ��ȯ�ϴ� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

-- ��¥ ����
SELECT SYSDATE - 1 AS ����, -- ����
    SYSDATE AS ����, -- ����
    SYSDATE + 1 AS ���� -- ����
FROM DUAL;

-- ��������) ������� ��������� �ٹ� �ϼ� ���ϱ�
-- ��, �Ǽ��� ������ �ݿø� �ϱ�
SELECT ENAME AS �̸�, HIREDATE AS �Ի���, ROUND(SYSDATE - HIREDATE) AS "�ٹ� �ϼ�"
FROM EMPLOYEE;

-- MONTHS_BETWEEN(���� ��¥, ���ų�¥) : ��¥�� ��¥ ������ ���� ���� ���ϴ� ���� �Լ�
-- �ٹ� �ϼ��� ���� ���� ����� ����
SELECT ENAME, SYSDATE, HIREDATE, 
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS ������
FROM EMPLOYEE;

-- �Ի����� 6���� ���� ��¥�� ���ϰ� ���� 1��
-- ADD_MONTHS(��¥�÷�, �� �� ���� ��) : ��¥�÷� + �� �� ������
SELECT ENAME, HIREDATE, 
    ADD_MONTHS(HIREDATE, 6) AS "6���� ��"
FROM EMPLOYEE;

-- ������ �������� ���ʷ� �����ϴ� ����� ���ϱ�
-- NEXT_DAY(��¥, ����) : �� ��¥�κ��� ���Ͽ� �ش��ϴ� ���� ��ȯ
SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '�����') AS "�̹� �� �����",
    NEXT_DAY(SYSDATE, 7) AS "���ڷ� �̹� �� �����"
FROM EMPLOYEE;

-- �Ի��� ���� ������ �� ���ϱ�
-- LAST_DAY(��¥�÷�) : �� ���� ������ ���� ��ȯ
SELECT ENAME, HIREDATE,
    LAST_DAY(HIREDATE)
FROM EMPLOYEE;

-- ������ ��ȯ �Լ�
-- TO_CHAR : ��¥�� �Ǵ� �������� ���������� ��ȯ�ϴ� �����Լ�
-- TO_CHAR(��¥ �÷�, ���� ����) : ��¥�� ������ ������ ���� ���ڿ��� ��ȯ
SELECT ENAME, HIREDATE,
    TO_CHAR(HIREDATE, 'YY-MM') AS "�⵵, ��",
    TO_CHAR(HIREDATE, 'YYYY/MM/DD DAY') AS "�⵵, ��, ��, ����",
    TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MI:SS') AS "���־��� ����"
FROM EMPLOYEE;

-- TO_CHAR : ���ڸ� ������ ������ ���� ���ڿ��� ��ȯ
-- 9 : �ڸ����� ��Ÿ��, �ڸ����� ���� ������ ������ ä���� ����
-- 0 : �ڸ����� ��Ÿ��, �ڸ����� ���� ������ 0���� ä��
-- L : �� ������ ��ȭ ��ȣ�� �տ� ǥ��
-- , : õ ���� �ڸ� ������ ���� ǥ��
SELECT ENAME, SALARY,
    TO_CHAR(SALARY, 'L999,999') AS "�� ǥ��",
    TO_CHAR(SALARY, 'L000,000') AS "�� ǥ��2"
FROM EMPLOYEE;

-- TO_DATE : ���ڸ� ��¥�� ��ȯ�ϴ� ���� �Լ�
-- ��������) 1981��2�� 20�Ͽ� �Ի��� ��� �˻��ϱ�
-- HIREDATE �̻��Ⱑ ����Ʈ ���̱⶧���� �� ��ġ ������� ��

SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE HIREDATE = TO_DATE('19810220');

-- ���ڸ� ���ڷ� �ٲٴ� ���� �Լ�
-- TO NUMBER(���ڿ� ����, ��������) : ���ڿ��� ������ ������ ���ڷ� �ٲٱ�
-- �տ��Ŷ� �ڿ��� �׻� ���� ��ġ �� ����� ,��ġ ��ġ
SELECT TO_NUMBER('100,000', '999,999') - TO_NUMBER('50,000', '999,999')
FROM DUAL;

-- ���� ���� 1) SUBSTR�Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����ϼ�
SELECT SUBSTR(HIREDATE, 1, 2) AS �Ի�⵵,
    SUBSTR(HIREDATE, 4, 2) AS �Ի��
FROM EMPLOYEE;

-- ���� ���� 2) SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ����ϼ�
SELECT *
FROM EMPLOYEE
WHERE SUBSTR(HIREDATE, 4, 2) = '04';

-- ���� ���� 3) ����� ¦���� ��� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE MOD(ENO, 2) = 0;

-- ���� ���� 4) ���� ��ĥ�� �������� ����ϼ� ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ�,
-- TO_DATE�Լ��� ����ؼ� ���� ��ġ ��Ű��
SELECT TRUNC(SYSDATE - TO_DATE('20220101', 'YYYYMMDD')) AS "�ų���� ���� ��"
FROM DUAL;

-- �Ϲ� �Լ�
-- NVL(NULL�� ���Ե� �÷�, �ٲܰ�) NULL�̸� 0 �Ǵ� �ٸ� ������ �ٲٴ� �����Լ�
-- NVL�� ���� ��
SELECT ENAME, SALARY,
    COMMISSION,
    NVL(COMMISSION, 0) AS ���ʽ�,
    SALARY * 12 + NVL(COMMISSION, 0) AS ����
FROM EMPLOYEE
ORDER BY JOB;

-- NVL2(�÷���, ǥ����1, ǥ����2)
-- �÷����� NULL�̸� ǥ����2�� ��ȯ�ϰ�, NULL�� �ƴϸ� ǥ����1�� ��ȯ
SELECT ENAME, SALARY, COMMISSION,
       NVL2(COMMISSION, SALARY * 12 + COMMISSION, SALARY * 12)
FROM EMPLOYEE
ORDER BY JOB;

-- NULLIF(ǥ����1, ǥ����2)
-- ǥ���� 1 == ǥ���� 2 : NULL��ȯ
-- ǥ���� 1 != ǥ���� 2 : ǥ���� 1 ��ȯ
SELECT NULLIF('A', 'A'),
       NULLIF('A', 'B')
FROM DUAL;

-- ����Ŭ���� IF / ELSE IF / ELSE ���
-- DECODE(ǥ����, ����, ���1
--               ����2, ���2
--               ����3, ���3
--               �⺻���)
SELECT ENAME, DNO,
    DECODE(DNO, 10, 'ȸ���',
                20, '������',
                30, '������',
                40, '���',
                'DEFAULT') AS �μ��̸�
FROM EMPLOYEE
ORDER BY DNO;

-- �� �ٸ� ��� IF / ELSE IF / ELSE ���
-- �̰� ���� �ֱٿ� ���°��� �̰� ����
SELECT ENAME, DNO,
    CASE WHEN DNO = 10 THEN 'ȸ���'
         WHEN DNO = 20 THEN '������'
         WHEN DNO = 30 THEN '������'
         WHEN DNO = 40 THEN '���'
         ELSE 'DEFAULT' 
    END AS �μ��̸�
FROM EMPLOYEE
ORDER BY DNO;

-- �������� 5) ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� NULL �� ���
-- 0�� ����ϼ�
SELECT ENO, ENAME,
    NVL(MANAGER, 0)
FROM EMPLOYEE;

-- �̷��Ե� ����
SELECT ENO, ENAME,
    NVL2(MANAGER, MANAGER, 0) AS MANAGER
FROM EMPLOYEE;

-- �������� 6) DECODE, CASE WHEN �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�.
-- ������ 'ANALYST' �� ����� 200,
-- ������ 'SALAESMAN' �� ����� 180,
-- ������ 'MANAGER' �� ����� 150,
-- ������ 'CLERK' �� ����� 100

SELECT ENO, ENAME, JOB, SALARY,
    CASE WHEN JOB = 'ANALYST' THEN SALARY + 200
         WHEN JOB = 'SALAESMAN' THEN SALARY + 180
         WHEN JOB = 'MANAGER' THEN SALARY + 150
         WHEN JOB = 'CLERK' THEN SALARY + 100
         ELSE SALARY
    END AS �λ�޿�
FROM EMPLOYEE;

-- �̷��Ե� ����
SELECT ENO, ENAME, JOB, SALARY,
    DECODE(JOB, 'ANALYST', SALARY + 200,
                'SALAESMAN', SALARY + 200,
                'MANAGER', SALARY + 200,
                'CLERK', SALARY + 200,
                SALARY) AS "�޿� �λ�"
FROM EMPLOYEE;

-- �׷� �Լ�
-- SUM : ���� �հ踦 ��ȯ
-- AVG : �׷��� ����� ��ȯ
-- COUNT : �׷��� ������ ��ȯ
-- MAX : �׷��� �ִ밪�� ��ȯ
-- MIN : �׷��� �ּҰ��� ��ȯ

SELECT SUM(SALARY) AS "�޿� �Ѿ�",
       TRUNC(AVG(SALARY)) AS "�޿� ���",
       MAX(SALARY) AS "�ִ� �޿�",
       MIN(SALARY) AS "�ּ� �޿�"
FROM EMPLOYEE;

-- ���� 4) �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �Ի����� ����ϼ�
SELECT
       MAX(HIREDATE) AS "���� �ֱ� �Ի�",
       MIN(HIREDATE) AS "���� ������ �Ի�"
FROM EMPLOYEE;

-- �׷� �Լ� VS NULL
-- �׷� �Լ��� ���������� NULL������ �����ϰ� ���
SELECT SUM(COMMISSION) AS "Ŀ�̼� �Ѿ�"
FROM EMPLOYEE;

-- COUNT : �Ǽ� ����
SELECT COUNT(*)
FROM EMPLOYEE;

-- COMMISSION�� �޴� ����� ���� �˰� ����
-- �׷� �Լ��� ���������� NULL�� ����
SELECT COUNT(COMMISSION)
FROM EMPLOYEE;
-- ���� ����
SELECT COUNT(COMMISSION)
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

-- Ȱ�� ��)
SELECT COUNT(JOB) AS "������ ����"
FROM EMPLOYEE;

SELECT COUNT(DISTINCT(JOB)) AS "�ߺ� ���� ������ ����"
FROM EMPLOYEE;

-- �׷� �Լ��� �� �� �����ؾ� �� ��
-- �Ϲ� �÷��� ���� �� �� ����, �׷��� �׷쳢���� �԰���
SELECT COUNT(ENO), MAX(SALARY)
FROM EMPLOYEE;

-- ** GROUP BY ��
-- �׷� �Լ� : �ϳ��� ������� ������(COUNT, MAX, SUM ....)
-- ����) �μ����� ��� �޿��� �˰����
-- GROUP BY �÷��� => SELECT �÷���
SELECT DNO AS "�μ� ��ȣ",
       TRUNC(AVG(SALARY)) AS "��� �޿�"
FROM EMPLOYEE
GROUP BY DNO; -- �μ� ��ȣ�� �׷���

-- �߸� �� ���� ���� : ENAME GROUP BY���� ���� �÷���
SELECT DNO AS "�μ� ��ȣ",
       ENAME,
       TRUNC(AVG(SALARY)) AS "��� �޿�"
FROM EMPLOYEE
GROUP BY DNO; -- �μ� ��ȣ�� �׷���

-- ��������) �μ���, ���޺� �ѱ޿��� ����Ͽ� ����� �ּ���
-- ��, �μ���, ���޺��� ������������ ����
SELECT DNO AS "�μ� ��ȣ",
       JOB AS "����",
       SUM(SALARY) AS "�� �޿�"
FROM EMPLOYEE
GROUP BY DNO, JOB
ORDER BY DNO, JOB;

-- GROUP BY ���� ���ǰɱ�
-- HAVING �׷��Լ�(�÷�) > ���ǰ�
-- �μ����� �ִ� �޿��� ���ϴµ�, 3000�̻��� �Ǵ� �͸� ����ϼ�
SELECT DNO, MAX(SALARY)
FROM EMPLOYEE
GROUP BY DNO
HAVING MAX(SALARY) >= 3000;
       
-- ��������) MANAGER�� �����ϰ� �޿� �Ѿ��� 5000�̻��� ���޺� �޿� �Ѿ� ���ϱ�
-- ��, �޿� �Ѿ��� �������� �������� ����
SELECT JOB, SUM(SALARY)
FROM EMPLOYEE
WHERE NOT JOB = 'MANAGER'
GROUP BY JOB
HAVING SUM(SALARY) >= 5000
ORDER BY SUM(SALARY);

-- �ش�
SELECT JOB, SUM(SALARY)
FROM EMPLOYEE
WHERE JOB NOT LIKE '%MANAGER%'
GROUP BY JOB
HAVING SUM(SALARY) >= 5000
ORDER BY SUM(SALARY);

-- ���� *****(������ ����)
-- ��� ��ȣ�� 7788�� ������ �μ�����? �̰� �˰� ��������
-- ������ ���ٸ� �̷��� 2�� ��ȸ�� �غ��� ���� ����
SELECT DNO
FROM EMPLOYEE
WHERE ENO = 7788;

SELECT DNAME
FROM DEPARTMENT
WHERE DNO = 20;

-- ��� ������ �缺�ҷ��� JOIN�� ���� �ѹ��� �԰���
-- �Ϲ� JOIN(EQUAL JOIN, INNER JOIN) : ������
-- �Ǽ����� ���� ���� �տ� ���� ���� ���� �ڿ��� ������ ����Ʈ�� 4�� ���÷��̴� 14��
SELECT A.DNO, A.DNAME, A.LOC
FROM DEPARTMENT A,
     EMPLOYEE B
WHERE B.DNO = A.DNO
AND B.ENO = 7788;

