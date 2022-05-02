-- �������� 1) ��� ����� �޿� �ְ�װ� ������, �Ѿ� �� ��� �޿��� ����ϼ�
-- �÷��� ��Ī�� : �ְ��, ������, �Ѿ�, ��ձ޿�
-- ��, �Ǽ��� ������ �ݿø� ���ּ�

SELECT MAX(SALARY) AS �ְ��,
       MIN(SALARY) AS ������,
       SUM(SALARY) AS �Ѿ�,
       ROUND(AVG(SALARY)) AS ��ձ޿�
FROM EMPLOYEE;

-- �������� 2) �� ��� ���� �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����ϼ�
-- �÷��� ��Ī�� : �ְ��, ������, �Ѿ�, ��ձ޿�
-- ��, �Ǽ��� ������ �ݿø� ���ּ�

SELECT JOB AS ������, 
       MAX(SALARY) AS �ְ��,
       MIN(SALARY) AS ������,
       SUM(SALARY) AS �Ѿ�,
       ROUND(AVG(SALARY)) AS ��ձ޿�
FROM EMPLOYEE
GROUP BY JOB;

-- �������� 3) COUNT(*) �Լ��� �̿��Ͽ� ��� ������ ������ ��� ���� ����ϼ�
SELECT JOB AS ������, 
       COUNT(*) AS "��� ��"
FROM EMPLOYEE
GROUP BY JOB;

-- �������� 4) ������ ���� �����Ͻÿ�.
SELECT MANAGER AS ������, COUNT(*)
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL
GROUP BY MANAGER;

-- ��
SELECT COUNT(MANAGER)
FROM EMPLOYEE;

-- �������� 5) �޿� �ְ��, �޿� �������� ������ ����ϼ���.
-- �÷� ��Ī�� "����"���� ǥ���ϼ���
SELECT (MAX(SALARY) - MIN(SALARY)) AS ����
FROM EMPLOYEE;

-- �������� 6) ���޺� ����� ���� �޿��� ����ϼ���
-- �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ���ܽ�Ű��
-- ����� �޿��� ���� ������������ �����Ͽ� ����ϼ�
SELECT JOB AS ������,
       MIN(SALARY) AS ������
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL
GROUP BY JOB
HAVING MIN(SALARY) > 2000
ORDER BY MIN(SALARY) DESC;

-- �������� 7) �� �μ��� ���� �μ���ȣ, ��� ��, �μ� ���� ��� ����� ��� �޿��� ����ϼ���
-- �÷� ��Ī, �μ���ȣ, ��� ��, ��� �޿�
-- ��� �޿��� �Ҽ��� 2°�ڸ����� �ݿø� �ϼ�
SELECT DNO AS "�μ� ��ȣ",
       COUNT(*) AS "��� ��",
       ROUND(AVG(SALARY), 2) AS "��� �޿�"
FROM EMPLOYEE
GROUP BY DNO;
       
-- �������� 8) �� �μ��� ���� �μ���ȣ, �̸�, ������, ��� ��
-- �μ��� ����� ��� �޿��� ����ϼ�(DECODE, CASE WHEN �� �� �ϳ� ���)
-- �÷� ��Ī �μ��̸�, ������, ��� ��, ��ձ޿�
SELECT DNO,
    CASE WHEN DNO = 10 THEN 'ACCOUNTING'
         WHEN DNO = 20 THEN 'RESEARCH'
         WHEN DNO = 30 THEN 'SALES'
         WHEN DNO = 40 THEN 'OPERATIONS'
    END AS "�μ� �̸�",
    CASE WHEN DNO = 10 THEN 'NEW WORK'
         WHEN DNO = 20 THEN 'DALLAS'
         WHEN DNO = 30 THEN 'CHICAGO'
         WHEN DNO = 40 THEN 'BOSTON'
    END AS "���� ��",
    COUNT(*) AS "��� ��",
    ROUND(AVG(SALARY)) AS "��� �޿�"
FROM EMPLOYEE
GROUP BY DNO;