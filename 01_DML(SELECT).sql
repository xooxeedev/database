-- 2020.10.29(��) 
-- SELECT (��ȸ)
-- SELECT ������ ��ȸ ��� ���� : RESULT SET 

/* [�ۼ���]
SELECT * | �÷��� [, �÷��� , ...]
FROM ���̺��
WHERE ���ǽ�;
*/

-- EMPLOYEE ���̺��� ��� ��� ������ ��� ��ȸ
SELECT * FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ��� ����� ��� �̸� ��ȸ
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ��� ����� �̸�, �̸���, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE;

-- 1. JOB ���̺��� ��� ���� ��ȸ
SELECT * FROM JOB;

-- 2. JOB ���̺��� ���޸� ��ȸ
SELECT JOB_NAME FROM JOB;

-- 3. DEPARTMENT ���̺��� ��� ���� ��ȸ
SELECT * FROM DEPARTMENT;

-- 4. EMPLOYEE ���̺��� �̸�, �̸���, ��ȭ��ȣ, ����� ��ȸ
SELECT EMP_NAME, EMALL, PHONE, HIRE_DATE
FROM EMPLOYEE;

-- 5. EMPLOYEE ���̺��� �����, �����, ������ȸ
SELECT HIRE_DATE, EMP_NAME, SALARY
FROM EMPLOYEE;


-------------------------------------------------------------

-- �÷� �� ��� ����
-- SELECT �� �÷��� �Է� �κп�
-- ����� �ʿ��� �÷��� + ����, �����ڸ� �̿��Ͽ�
-- ���ϴ� ��� ����� ��ȸ�� �� �ִ�. 


-- EMPLOYEE ���̺��� ������� �̸�, �޿�, ���� ��ȸ
SELECT EMP_NAME, SALARY, SALARY * 12
FROM EMPLOYEE; 

-- EMPLOYEE ���̺��� ����� �̸��� ���ʽ��� �ݿ��� ���� ��ȸ
SELECT EMP_NAME,
 -- (SALARY + SALARY * BONUS) * 12
  SALARY * (1+BONUS) * 12
FROM EMPLOYEE;
-- DB���� ��� ���� �� NULL ���� ���ԵǾ� �ִٸ�
-- ����� ������ NULL 

-- EMPLOYEE ���̺��� ����� �̸�, �����, �ٹ� �ϼ� ��ȸ
-- * DATE Ÿ�� ������ ��� ����,
--   DATE, NUMBER Ÿ���� ��������� ������.
-- SYSDATE : ���� �ð��� ��ȸ�ϴ� Ű���� 
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE;

-- 

/* �÷� ��Ī

 �÷��� ��Ī  /  �÷��� AS ��Ī  |  �÷��� " ��Ī"  /  �÷��� AS "��Ī"
     Ư������, ���� X              Ư������, ���� O 
*/

-- EMPLOYEE ���̺��� ����� �̸�, �Ի���, �ٹ��ϼ��� ��ȸ
-- �÷����� ��� �̸�, �Ի���, �ٹ��ϼ��� ��Ī ����
SELECT EMP_NAME AS �̸�, HIRE_DATE �Ի���,
    SYSDATE - HIRE_DATE "�ٹ� �ϼ�"
FROM EMPLOYEE; 

----------------------------------------------------------

-- ���ͷ� 
-- ���Ƿ� ������ ���ڿ��� SELECT���� ����ϸ� 
-- ���̺� �����ϴ� ������ ó�� ����� �� ����. 
-- ���ͷ��� ǥ�� ��ȣ�� ''(Ȧ����ǥ)
-- ���ͷ��� RESULT SET�� ��� ��� �࿡ �ݺ������� ǥ�õ�.

-- EMPLOYEE ���̺��� 
-- ���, �����, �޿�, ����(������ : ��) ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, 
        '��' AS ����
FROM EMPLOYEE;


-- DISTINCT
-- �÷��� ���Ե� �ߺ� ���� �� ���� ǥ���ϰ��� �� �� ���

-- EMPLOYEE ���̺��� ������ ���� �ڵ带 ��ȸ
SELECT JOB_CODE FROM EMPLOYEE; 

-- EMPLOYEE ���̺��� ������ ���� �ڵ带 �ߺ� ���� ��ȸ
SELECT DISTINCT JOB_CODE FROM EMPLOYEE; 

-- * DISTINCT ���� ����
--  -> DISTINCT SELECT�� �ϳ��� �� ���� ��� ���� (�������°� ����!) 
SELECT DISTINCT JOB_CODE, DISTINCT DEPT_CODE
FROM EMPLOYEE;

-- DISTINCT�� ���ʿ� �ۼ��� �÷����� ��� ��� �ߺ����� �����Ͽ� ���
SELECT DISTINCT JOB_CODE, DEPT_CODE
FROM EMPLOYEE;

--------------------------------------------------

-- WHERE ��
-- ��ȸ�� ���̺��� ������ �´� ���� ���� ���� ��󳻴� ����

-- WHERE������ TRUE, FALSE�� ���� �� �ִ� 
-- �� �����ڰ� ����. 
-- >, <, >=, <=
-- = (����), !=, ^=, <>(���� �ʴ�)

-- EMPLOYEE ���̺��� 
-- �μ��ڵ尡 'D9'�� ������ ���, �̸�, �μ��ڵ带 ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9'; 

-- EMPLOYEE ���̺��� 
-- �޿��� 4�鸸 �̻��� ������ �̸�, �޿� ��ȸ
SELECT EMP_NAME, SALARY 
FROM EMPLOYEE
WHERE SALARY >= 4000000;

-- EMPLOYEE ���̺��� �μ��ڵ尡 'D9'�� �ƴ� �����
-- �̸�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';

-- EMPLOYEE ���̺��� ����� ����� 
-- �̸�, ��ȭ��ȣ, �μ��ڵ� ��ȸ
SELECT EMP_NAME, PHONE, DEPT_CODE
FROM EMPLOYEE
WHERE ENT_YN = 'Y';


--1. EMPLOYEE ���̺��� SAL_LEVEL S1�� �����
-- �̸�, ����, �����, ����ó ��ȸ
SELECT EMP_NAME �̸�, SALARY ����, HIRE_DATE �����, PHONE ����ó
FROM EMPLOYEE
WHERE SAL_LEVEL = 'S1';

--2. EMPLOYEE ���̺��� ������ 3,000,000�̻��� �����
-- �̸�, ����, ����� ��ȸ
SELECT EMP_NAME �̸�, SALARY ����, HIRE_DATE �����
FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- 3. EMPLOYEE ���̺��� ������ 5õ���� �̸��� �����
-- �̸�, ����, ����, ����� ��ȸ
SELECT EMP_NAME,SALARY, SALARY * 12, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY * 12 < 50000000;



-------------------------------------------------------

-- �� ������ (AND / OR)
-- �������� ������ ���� ��� ����ϴ� ������ 

-- EMPLOYEE ���̺���
-- �μ��ڵ尡 'D6'�̰�
-- �޿��� 200�� �̻� �޴� ������ 
-- ���, �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6'
AND SALARY >= 2000000; 

-- EMPLOYEE ���̺���
-- �μ��ڵ尡 'D6' �̰ų� 
-- �޿��� 200�� �̻� �޴� ������ 
-- ���, �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6'
OR SALARY >= 2000000; 

-- EMPLOYEE ���̺���
-- �޿��� 250�� �̻� 600�� ���Ϸ� �޴� ������ 
-- ���, �̸�, �޿�, �μ��ڵ�, �����ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE SALARY >= 3500000
AND SALARY <= 6000000; 

-- EMPLOYEE ���̺�
-- �μ��ڵ尡 D5 �Ǵ� D9�� ��� ��
-- ������� 2002�� 1�� 1�Ϻ��� ���� �����
-- ���, �̸�, �μ��ڵ�, ����� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE = 'D5'
OR DEPT_CODE = 'D9')
AND HIRE_DATE < '02/01/01';

-- AND�� OR ���꺸�� �켱������ ����! (�����սô�) 

-- �÷��� BETWEEN A AND B 
-- >> A �̻� B ����
-- EMPLOYEE ���̺��� 
-- �޿��� 350�� �̻� 600�� ���Ϸ� �޴� ����� 
-- ���, �̸�, �޿�, �μ��ڵ�, �����ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;

-- NOT (�� ���� ������)
-- EMPLOYEE ���̺��� 
-- �޿��� 350�� �̸� 600�� �ʰ��� �޴� ����� 
-- ���, �̸�, �޿�, �μ��ڵ�, �����ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 3500000 AND 6000000;

-- EMPLOYEE ���̺���
-- �Ի����� '90/01/01' ~ '99/12/31'�� �����
-- �̸�, �Ի��� ��ȸ 
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '99/12/31';

SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE NOT HIRE_DATE BETWEEN '90/01/01' AND '99/12/31';


-- ���� ������( || )
-- ���� �÷��� �ϳ��� �÷�ó�� �����ϰų�
-- �÷� + ���ͷ��� ���¸� ���� �� �ִ� ������. 

-- EMPLOYEE ���̺��� ���, �̸�, �޿��� �����ؼ� ��ȸ
SELECT EMP_ID || EMP_NAME || SALARY 
FROM EMPLOYEE;

-- EMPLOYREE ���̺���
-- ��� ����� �̸�, �޿� ��ȸ
-- ��, �޿� �ڿ� '(��)'���� �ٿ��� ��ȸ
-- EX. ������ | 8000000(��)
SELECT EMP_NAME, SALARY || '(��)' �޿�
FROM EMPLOYEE;

-----------------------------------------------------------

-- LIKE (�ڡڡڡڡ�)
/*
���Ϸ��� ���� ������ Ư�� ������ ������Ű�� �����͸� ��ȸ�� �� ���

�񱳴���÷��� LIKE '���� ����'

���� 1) % (�ۼ�Ʈ)
 '��%' (�� ���� �����ϴ� ��)
 '%��' (�� ���� ������ ��)
 '%��%' (�� �̶�� ���ڰ� ���ԵǴ� ��)

���� 2) _ (�����)
 '_' (�� ����)
 '__' (�� ����)
 '��__' (�� ���� �����ϴ� ������)

   0101234[1]234
   PHONE LIKE _______1%
*/

-- EMPLOYEE ���̺���
-- ���� '��'���� ����� ���, �̸�, �μ��ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';

-- EMPLOYEE ���̺���
-- ���� '��'���� ����� ���, �̸�, �μ��ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

-- EMPLOYEE ���̺���
-- ��ȭ��ȣ �� ��° �ڸ��� 7�� �����ϴ� �����
-- ���, �̸�, ��ȭ��ȣ ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '___7%';

-- EMPLOYEE ���̺���
-- EMAIL ���̵� �� '_' ��ȣ ���� �������� �����
-- ���, �̸�, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%';

-- ESCAPE OPTIONS
-- LIKE�� ���ϵ�ī�� ��ȣ��, �˻��Ϸ��� ��ȣ�� ������ ���
-- �˻���ȣ�� �νĽ�Ű�� ���ؼ� ����ϴ� ����
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___#_%' ESCAPE '#';

-- NOT LIKE
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL NOT LIKE '___#_%' ESCAPE '#';

-- EMPLOYEE ���̺��� 
-- ���� '��'���� �ƴ� ����� ��� ���� ��ȸ
SELECT * FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '��%';

-- EMPLOYEE ���̺��� 
-- �̸� ���� '��'���� ������ ����� �̸� ��ȸ
SELECT EMP_NAME FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��'; 

-- EMPLOYEE ���̺���
-- ��ȭ��ȣ ó�� �� �ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ�� ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%'; 

-- EMPLOYEE ���̺���
-- �����ּ� '_'�� ���� �� ���� �̸鼭 DEPT_CODE�� D9 �Ǵ� D6�̰�
-- ������� 90/01/01 ~ 00/12/01�̰�,
-- �޿��� 270�� �̻��� ����� ��ü�� ��ȸ
SELECT * 
FROM EMPLOYEE
WHERE EMAIL LIKE '____#_%' ESCAPE '#'
AND (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6')
AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01'
AND SALARY >= 2700000;

----------------------------------------------------------------

-- IS NULL : �÷����� NULL�� ���
-- IS NOT NULL : �÷����� NULL�� �ƴ� ���

-- EMPLOYEE ���̺��� 
-- ���ʽ��� ���� �ʴ� ����� ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL; 

-- EMPLOYEE ���̺���
-- ���(���ӻ��)�� ����, �μ��ڵ嵵 ���� �����
-- �����, ����ڵ�, �μ��ڵ� ��ȸ 
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL
AND DEPT_CODE IS NULL;

-- IN
-- ���Ϸ��� �÷����� ���(��ȣ ����)�� ��ġ�ϴ� ���� �ִٸ� TRUE�� ��ȯ�ϴ� ������
-- �÷��� IN(A,B,C,D,...);

-- EMPLOYEE ���̺��� 
-- �μ��ڵ尡 D6, D8, D9�� ����� 
-- ���, �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6'
OR DEPT_CODE = 'D8'
OR DEPT_CODE = 'D9';

-- IN ���
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IN('D6', 'D8', 'D9');


-- ������ �켱����
/*
1. ��� + - * /
2. ���� || 
3. �� =, !=, ^=, <>, >, <, >=, <=
4. IS NULL, LIKE, IN
5. BETWEEN A AND B
6. NOT
7. AND 
8. OR 
*/
-------------------------------------------------------

-- ORDER BY ��(�ڡڡڡڡ�)
  -- SELECT�� ����� ����(RESULT SET)�� ������ �� ����ϴ� ����
  -- SELECT���� ���� ������ �ٿ� �ۼ�
  -- SELECT�� �ؼ� ���� �߿����� ���� ������ 
  
-- [�ۼ���]
/*
  SELECT �÷���, [�÷���, ...]
  FROM ���̺��
  [WHERE ���ǽ�]
  [ORDER BY �÷��� | ��Ī | �÷����� ���� ���(����, ����) [NULLS FIRST | LAST] ]
*/

-- EMPLOYEE ���̺��� 
-- ��� ����� �̸�, �޿�, �μ��ڵ带 ������������ ���
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
ORDER BY EMP_NAME /*ASC*/; -- ���� ������ �⺻��

-- EMP_NAME ��������
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
ORDER BY 1; -- ��ȸ�� �÷� �� ù ��°��(EMP_NAME)�� �������� ����

-- EMP_NAME ��������
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
ORDER BY 1 DESC;

-- EMPLOYEE ���̺���
-- ��� ����� �̸�, ����, �μ��ڵ带 
-- �μ��ڵ� ������������ �����Ͽ� ��ȸ
SELECT EMP_NAME, SALARY*12 AS ����, DEPT_CODE
FROM EMPLOYEE
ORDER BY DEPT_CODE DESC NULLS LAST; 

-- EMPLOYEE ���̺���
-- ��� ����� �̸�, ����, �μ��ڵ带 
-- ���� ������������ �����Ͽ� ��ȸ
SELECT EMP_NAME, SALARY * 12 AS ����, DEPT_CODE
FROM EMPLOYEE
ORDER BY ���� DESC NULLS LAST; -- ��Ī ��� ����


-- EMPLOYEE ���̺���
-- ��� ����� �̸�, ����, �μ��ڵ带 
-- ���� ������������ �����Ͽ� ��ȸ
-- ��, ������ 4õ�� �̻��� ����� ��ȸ
SELECT EMP_NAME, SALARY * 12 AS ����, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY * 12 /*����*/ >= 40000000 -- WHERE������ ��Ī ��� �Ұ� 
ORDER BY 2 DESC NULLS LAST; -- ��Ī ��� ����

