-- 2020.10.30(��)���� ����
-- 1��
-- �а� �̸��� �迭�� ǥ���Ͻÿ�. 
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT;

-- 2��
-- �а��� �а� ������ ������ �������·� ȭ�鿡 ����Ѵ�
SELECT DEPARTMENT_NAME || '�� ������' || CAPACITY || '�� �Դϴ�.' AS "�а��� ����"
FROM TB_DEPARTMENT;

-- 3��
-- ����� �������� ���л� 
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE ABSENCE_YN LIKE 'Y'
AND DEPARTMENT_NO LIKE '001'
AND STUDENT_SSN LIKE '_______2%';

-- 4��
-- �й� A513079, A513090, A513091, A513110, A513119
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079','A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC;

-- 5��
-- ���������� 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30; 

-- 6��
-- ������ �̸� 
SELECT PROFESSOR_NAME -- ������ ��. ���� �̸� 
FROM TB_PROFESSOR -- ���� ���̺� �ȿ��� 
WHERE DEPARTMENT_NO IS NULL; -- �а� ��ȣ�� ���� ��� 

-- 7��
-- �а��� ���� �л� (�а����� ����� ��� �ȶߴ� �� ����)
SELECT DEPARTMENT_NAME 
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NO IS NULL; 

-- 8��
-- ���������� �����ϴ� ������� � �������� �����ȣ ��ȸ 
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9��
-- � �迭(CATEGORY)���� �ִ��� ��ȸ // �ߺ� ���� 
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT; 

-- 10��
-- 02�й� ���� �����ڵ��� ����, 
-- ������ ������� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ ���
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN LIKE 'N'
AND ENTRANCE_DATE LIKE '02%'
AND STUDENT_ADDRESS LIKE '%����%' ;


